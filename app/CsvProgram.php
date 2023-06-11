<?php

namespace Timetabler;

use App\Program;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithHeadingRow;

class CsvProgram implements ToModel, WithHeadingRow
{
    /**
    * @param array $row
    *
    * @return \Illuminate\Database\Eloquent\Model|null
    */
    public function model(array $row)
    {
        return new Program([
            'name' =>  $row["name"],
            'semesters' =>  $row["semesters"],
            'years' =>  $row["years"],
            'program_code' =>  $row["program_code"],
            'school_id' =>  $row["school_id"],
        ]);


    }
}