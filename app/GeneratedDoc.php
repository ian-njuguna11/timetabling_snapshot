<?php

namespace Timetabler;

use Illuminate\Database\Eloquent\Model;

class GeneratedDoc extends Model
{
    protected $table = "generated_documents";
    protected $fillable = [
        "school_id", "program_id","room_id","description", "document_name"
    ];

    function school(){
        return $this->belongsTo(School::class, "school_id", "id");
    }

    function program(){
        return $this->belongsTo(Program::class, "program_id", "id");
    }
    function room(){
        return $this->belongsTo(Room::class, "room_id", "id");
    }
}
