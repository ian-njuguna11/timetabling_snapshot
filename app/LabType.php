<?php

namespace Timetabler;

use Illuminate\Database\Eloquent\Model;

class LabType extends Model
{
    protected $table = "lab_types";
    protected $fillable = [
        'type'
    ];

    function rooms(){
        return $this->hasMany(Room::class, 'lab_type_id');
    }

    function units(){
        return $this->hasMany(Unit::class, "lab_type_id");
    }
}
