<?php

namespace Timetabler;

use Illuminate\Database\Eloquent\Model;

class Location extends Model
{
    protected $table = 'locations';
    protected $fillable = [
        "location"
    ];

    function schools(){
        return $this->belongsToMany(School::class, 'school_location_pivot',
            'location_id', 'school_id');
    }

    function rooms(){
        return $this->hasMany(Room::class, "location_id");
    }
}
