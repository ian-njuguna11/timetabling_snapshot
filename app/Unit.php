<?php

namespace Timetabler;

use Illuminate\Database\Eloquent\Model;

class Unit extends Model
{
    protected $table = "units";
    protected $fillable = [
        "code", "name", "lecture_hours", "lab_hours", "lab_type_id","department_ID", "lecturer_id", "program_id"
    ];
    
    function lecturer()
    {
        return $this->belongsTo(Lectures::class, "lecturer_id");
    }

    function levels(){
        return $this->belongsToMany(Level::class,
            "levels_units_pivot","unit_id", "level_id");
    }

    function sessions(){
        return $this->hasMany(Session::class, 'unit_id', 'id');
    }

    public function levelsInSession(){
        return $this->levels()->where('in_session', true);
    }

    public function locations(){
        $locations = $this->levelsInSession()->get()->map(function($level){
            return $level->locations();
        })->toArray();

        return array_unique(array_merge(...$locations));
    }

    function lab_type(){
        return $this->hasOne(LabType::class, "id", "lab_type_id");
    }

    public function mergeUnit($unit_id){

        if ($unit_id == $this->id){
            return;
        }

        $unit_to_merge = Unit::with('levels')
            ->first($unit_id);
        $levels = $unit_to_merge->levels;

        if(is_null($unit_to_merge->related_to)){
            $relations = json_decode("[]");
        }else{
            $relations = json_decode($unit_to_merge->related_to);
        }

        $this->levels()->attach($levels);
        $unit_to_merge->levels()->detach();

        // Get other related units
        $other_merged_units = json_decode($this->related_to);
        $other_merged_units[] = ["code"=> $unit_to_merge->code, "name"=> $unit_to_merge->name];

        $this->related_to = json_encode(array_merge($other_merged_units, $relations));

        $unit_to_merge->delete();
    }

    public function mergeUnits($unit_ids){
        foreach ($unit_ids as $unit_id){
            if ($unit_id == $this->id){
                continue;
            }

            $unit_to_merge = Unit::with('levels')
                ->find($unit_id);
            $levels = $unit_to_merge->levels;
            $relations = json_decode($unit_to_merge->related_to);

            //$this->levels()->attach($levels);
            $unit_to_merge->levels()->detach();

            // Get other related units
            $other_merged_units = json_decode($this->related_to);
            $other_merged_units[] = ["code"=> $unit_to_merge->code, "name"=> $unit_to_merge->name];

            $this->related_to = json_encode(array_merge($other_merged_units, $relations));

            $unit_to_merge->delete();
        }
    }

    public function splitUnit($unit_code, $destroy = false){
        $new_merged_units = [];
        $unit_to_split = null;
        foreach (is_null($this->related_to) ? [] : json_decode($this->related_to) as $unit){
            if($unit->code == $unit_code){
                $unit_to_split = $unit;
                continue;
            }

            $new_merged_units[] = $unit;
        }

        $this->related_to = json_encode($new_merged_units);
        $this->save();
        if (!$destroy && !is_null($unit_to_split)){
            $data = [
                "code"=> $unit_to_split->code,
                "name"=> $unit_to_split->name,
                "lecture_hours"=> $this->lecture_hours,
                "lab_hours"=> $this->lab_hours,
                "lab_type_id"=> $this->lab_type_id
            ];

            if(!Unit::where("code", $unit_to_split->code)->exists()){
                $created_unit = Unit::create($data);

                return $created_unit;
            }
            return Unit::where("code", $unit_to_split->code)->first();
        }

        return null;
    }

    public function splitAllUnits($destroy = false){
        $merged_units = json_decode($this->related_to);
        $this->related_to = "[]";
        $this->save();
        if(!$destroy){
            $split_units = [];
            foreach ($merged_units as $unit){
                $data = [
                    "code"=> $unit->code,
                    "name"=> $unit->name,
                    "lecture_hours"=> $this->lecture_hours,
                    "lab_hours"=> $this->lab_hours,
                    "lab_type_id"=> $this->lab_type_id
                ];

                if(!Unit::where("code", $unit->code)->exists())
                    $split_units[] = Unit::create($data);
            }

            return $split_units;
        }

        return null;
    }

}
