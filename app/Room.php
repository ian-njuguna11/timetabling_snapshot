<?php

namespace Timetabler;

use Illuminate\Database\Eloquent\Model;

class Room extends Model
{
    protected $table = "rooms";
    protected $fillable = [
        'location_id', 'room_code', 'type', 'capacity', 'lab_type_id'
    ];

    function location(){
        return $this->hasOne(Location::class, 'id', 'location_id');
    }

    function labType(){
        return $this->hasOne(LabType::class, "id", "lab_type_id");
    }

    function sessions(){
        return $this->hasMany(Session::class, "room_id", "id");
    }

    function unoccupiedSessions(){
        return $this->sessions()->whereNull("unit_id");
    }
    
    function roomsWithSession(){
        return $this::with('sessions')->get();
    }
    
    function roomsWithSessionPeriod(){
        return $this->with('sessions.period')->get();
    }
    
    function roomsWithSessionPeriodTime(){
        return $this->with('sessions.period.day')->get();
    }
}
