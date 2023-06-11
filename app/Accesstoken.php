<?php

namespace Timetabler;

use Illuminate\Database\Eloquent\Model;

class Accesstoken extends Model
{
    //
    
    protected $guarded = [];
    
    function user()
    {
        return $this->belongsTo(User::class);
    }
}
