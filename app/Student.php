<?php

namespace Timetabler;

use Illuminate\Database\Eloquent\Model;

class Student extends Model
{
    public function program()
    {
       return $this->belongsTo(Program::class);
    }
    
   
}
