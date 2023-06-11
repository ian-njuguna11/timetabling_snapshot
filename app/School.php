<?php

namespace Timetabler;

use Illuminate\Database\Eloquent\Model;

class School extends Model
{
    protected $table = 'schools';
    protected $fillable = ['name'];

    function programs(){
        return $this->hasMany(Program::class, "school_id", "id");
    }

    function departments(){
        return $this->hasMany(department::class, "school_id", "id");
    }

    function locations(){
        return $this->belongsToMany(Location::class, 'school_location_pivot',
            'school_id', 'location_id');
    }

    function generatedTimetables(){
        return $this->hasMany(GeneratedDoc::class, "school_id", "id");
    }
}
