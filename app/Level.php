<?php

namespace Timetabler;

use Illuminate\Database\Eloquent\Model;

class Level extends Model
{
    protected $table = "program_levels";
    protected $fillable = [
        'program_id', 'level', "semester_number", "in_session"
    ];

    function program(){
        return $this->belongsTo(Program::class, "program_id", "id");
    }

    function units(){
        return $this->belongsToMany(Unit::class,
            "levels_units_pivot","level_id", "unit_id");
    }

    function school(){
        return $this->program()->first()->school()->first();
    }

    function locations(){
        return $this->school()->locations->pluck('id')->flatten()->toArray();
    }
}
