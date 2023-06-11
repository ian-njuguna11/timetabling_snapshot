<?php

namespace Timetabler;

use Illuminate\Database\Eloquent\Model;
use Timetabler\Timetable\SessionsGenerator;

class Timetable extends Model
{
    protected $table = "timetables";
    protected $fillable = [
        "description"
    ];

    function days(){
        return $this->hasMany(TimetableDay::class, "timetable_id", "id");
    }

    protected static function boot()
    {
        parent::boot(); // TODO: Change the autogenerated stub

        /*static::created(function($timetable){
            // Create five days of the week
            TimetableDay::create(["day"=>"Monday", "timetable_id"=> $timetable->id]);
            TimetableDay::create(["day"=>"Tuesday", "timetable_id"=> $timetable->id]);
            TimetableDay::create(["day"=>"Wednesday", "timetable_id"=> $timetable->id]);
            TimetableDay::create(["day"=>"Thursday", "timetable_id"=> $timetable->id]);
            TimetableDay::create(["day"=>"Friday", "timetable_id"=> $timetable->id]);

            //SessionsGenerator::generate();
        });*/
    }
}