<?php

namespace Timetabler;

use Illuminate\Database\Eloquent\Model;

class Lectures extends Model
{
    //
    protected $table = "lectures";
    
    protected $fillable = [
        "first_name",
        "last_name",
        "is_HOD",
        "email",
        "deparment_ID"
    ];
    
    protected $hidden = [
        "password",
        
    ];
    
    public function unit()
    {
        return $this->hasMany(Unit::class, "lecturer_id","id");;
    }

    public function Session()
    {
        return $this->hasMany(Session::class, "lecture_id","id");
    }

    function department()
    {
       return $this->belongsTo(department::class, "deparment_ID","id");
    }
    
}
