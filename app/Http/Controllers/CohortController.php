<?php

namespace Timetabler\Http\Controllers;

use Illuminate\Http\Request;
use Timetabler\Program;

class CohortController extends Controller
{
    public function index(){
        // $s_programs = Program::

        $program = Program::with("levels")->get();
        $programs = Program::with("levels")->get();
        $data = [
            'programs'=> $programs,
            'program'=> $program,
            
        ];
        return view("cohorts", $data);
    }

    public function filterCohort(Request $request){
        $program = Program::with("levels")->get();

        // return $program[0]->program_code;
        $programs = Program::with("levels")->where("program_code",$program[0]->program_code)->get();
        
        $data = [
            'programs'=> $programs,
            'program'=> $program,
            
        ];
        $filtered_cohorts = $programs->sortBy("name")->unique();
        // return view("cohorts", compact("filtered_cohorts"));
        return view("cohorts", $data);
    }
}
