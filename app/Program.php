<?php

namespace Timetabler;

use Illuminate\Database\Eloquent\Model;

class Program extends Model
{
    protected $table = "programs";
    protected $fillable = [
        "name", "semesters", "years","program_code", "school_id", "deparment_ID"
    ];

    function school(){
        return $this->belongsTo(School::class, "school_id", "id");
    }

    function department(){
        return $this->belongsTo(department::class, "deparment_id", "id");
    }

    function levels(){
        return $this->hasMany(Level::class, "program_id");
    }

    function generatedTimetables(){
        return $this->hasMany(GeneratedDoc::class, "program_id", "id");
    }

    protected static function boot()
    {
        parent::boot(); // TODO: Change the autogenerated stub

        static::created(function($program){
            $semester_number = 1;
            for ($i = 1; $i <= $program->years; $i++ ){
                for($k = 1; $k <= $program->semesters; $k++){
                    $level = [
                        'program_id'=> $program->id,
                        'level'=> "Year $i Semester $k",
                        "semester_number"=> $semester_number
                    ];

                    Level::create($level);

                    $semester_number++;
                }
            }
        });
    }
}
