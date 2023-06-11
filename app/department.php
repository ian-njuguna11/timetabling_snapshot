<?php

namespace Timetabler;

use Illuminate\Database\Eloquent\Model;

class department extends Model
{
    //
    protected $table = 'departments';

    protected $primaryKey = 'deparment_ID';

    protected $fillable = ["name", "deparment_ID","school_ID"];

    function school(){
        return $this->belongsTo(School::class,"id","name");
    }

    function programs(){
        return $this->hasMany(Program::class,"id", "name", "deparment_ID");
    }   
    
    function lecturer(){
        return $this->hasMany(lecturers::class,"first_name","last_name","is_HOD","email","password","deparment_ID");
    } 
}
