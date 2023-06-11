<?php

namespace Timetabler;

use Illuminate\Database\Eloquent\Model;

class TimetableDay extends Model
{
    protected $table = "timetable_days";
    protected $fillable = [
        "timetable_id", "day"
    ];

    function timetable(){
        return $this->belongsTo(Timetable::class, "timetable_id", "id");
    }

    function periods(){
        return $this->hasMany(Period::class, "day_id", "id");
    }

    protected static function boot()
    {
        parent::boot(); // TODO: Change the autogenerated stub

        /*static::created(function($day){
            if($day->day == "Wednesday"){
                Period::create(["time"=> "7.00 - 10.00", "day_id"=> $day->id]);
                Period::create(["time"=> "13.00 - 16.00", "day_id"=> $day->id]);
                Period::create(["time"=> "16.00 - 19.00", "day_id"=> $day->id]);
            }else{
                Period::create(["time"=> "7.00 - 10.00", "day_id"=> $day->id]);
                Period::create(["time"=> "10.00 - 13.00", "day_id"=> $day->id]);
                Period::create(["time"=> "13.00 - 16.00", "day_id"=> $day->id]);
                Period::create(["time"=> "16.00 - 19.00", "day_id"=> $day->id]);
            }
        });*/
    }
}