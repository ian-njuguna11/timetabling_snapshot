<?php

namespace Timetabler;

use Illuminate\Database\Eloquent\Model;

class HOD extends Model
{
    // id	name	email	role	email_verified_at	password
    // remember_token	lecturer_ID	deparment_ID	created_at	updated_at
    protected $table = 'h_o_d_s';
    protected $fillable = ["name","email","password"];

    function lecturers(){
        return $this->hasOne(lectures::class,"name","email","password");
    }

    function departments(){
        return $this->hasOne(departments::class,"name","school_ID");
    }
}
