<?php

namespace Timetabler\Http\Controllers;

use Illuminate\Support\Facades\Crypt;

use Illuminate\Http\Request;
use Timetabler\Program;
use Timetabler\School;
use Timetabler\Unit;
use Timetabler\Lectures;
use Timetabler\Timetable;

class hodProgamsController extends Controller
{
    public $site_department ;

    public function dashboard(){
    
        return view('auth.hod-login');

    }

    public function dept_programs(Request $request)
    {
        // return $request->dept_id;
        $dept_programs = Program::where('deparment_ID',Crypt::decryptString($request->dept_id))->get();
        $this->site_department = $dept_programs;

        $schools = School::all();
        return view('hod.programs', compact('dept_programs','schools') );
    

    }

    public function dept_units(Request $request){
        $dept_units = Unit::where('department_ID', 1)->get();
        // return $dept_units;
        return view('hod.unit', compact('dept_units'));
        // return $dept_units;
    }

    public function program_levels(Request $request){
        $program_levels = Program::with('levels')->where('deparment_ID', Crypt::decryptString($request->dept_id))->get();
        return view('hod.cohorts', compact('program_levels'));
        
    }

    public function lecturers(Request $request){
 
        // return $request->dept_id;

        $lecturers = Lectures::where('deparment_ID', Crypt::decryptString($request->dept_id))->get();

        // return $lecturers;

        $programs = School::with(
            'programs',
            'programs.levels',
            'programs.levels.units',
            'programs.levels.units.sessions',
            'programs.levels.units.sessions.room',
            'programs.levels.units.sessions.unit',
            'programs.levels.units.sessions.unit.levelsInSession',
            'programs.levels.units.sessions.period',
            'programs.levels.units.sessions.period.day'
            )
            ->get()->each(function($school){
                $programs = $school->programs->each(function($program) use ($school){
                    $program->school = $school->name;
                    $program->school_id = $school->id;
                });
                
                $school->programs = $programs;
    
                //return $school;
            })
            ->pluck('programs')->flatten();
        // dump($programs);
    
        foreach ($programs as $program){

            $school_name = $program->school;
            $program_name = $program->name;
            $units = $program->levels
                ->map(function($level){
                    $units = $level->units->each(function($unit) use ($level){
                        $unit->level = $level->level;
                    });
                    $level->units = $units;
                    return $level;
                })->pluck('units')->flatten()
                ->sortBy('level')
                ->groupBy('level');
                    
            return view('hod.lecturers',['school'=> $school_name, 'program'=> $program_name, 'levels'=> $units, 'lecturers'=>$lecturers]);
                            
        }

    }

    public function hodlecTimetable(Request $request)
    {
        # code...
        $lec_id = $this->lecID($request);

        $lc = Lectures::where("id",$lec_id)
            ->with(
            "Session",
            "Session.room",
            "Session.unit",
            "Session.period",
            "Session.period.day")->get();
            
        return view("hod.lec_timetable",["session" => $lc]);        
    }

    public function lecID($request)
    {
        $lec_units = Lectures::where("email",$request->email)->get("id");
        //    $unit = $lec_units->unit;
        $lec_id = $lec_units[0]->id;

        return $lec_id;
    }
    
    public function assignLec(Request $req)
    {
        $lecId = $req->lecID;
        
        $lec_name = Lectures::find($lecId);
        
        $programs = School::with(
            'programs',
            'programs.levels',
            'programs.levels.units',
            'programs.levels.units.sessions',
            'programs.levels.units.sessions.room',
            'programs.levels.units.sessions.unit',
            'programs.levels.units.sessions.unit.levelsInSession',
            'programs.levels.units.sessions.period',
            'programs.levels.units.sessions.period.day'
            )
            ->get()->each(function($school){
                $programs = $school->programs->each(function($program) use ($school){
                    $program->school = $school->name;
                    $program->school_id = $school->id;
                });
                
                $school->programs = $programs;
    
                //return $school;
            })
            ->pluck('programs')->flatten();
        // dump($programs);
    
        foreach ($programs as $program){

            $school_name = $program->school;
            $program_name = $program->name;
            $units = $program->levels
                ->map(function($level){
                    $units = $level->units->each(function($unit) use ($level){
                        $unit->level = $level->level;
                    });
                    $level->units = $units;
                    return $level;
                })->pluck('units')->flatten()
                ->sortBy('level')
                ->groupBy('level');
                    
            return view('lecturers.asssign', compact("lecId","lec_name"), ['school'=> $school_name, 'program'=> $program_name, 'levels'=> $units]);
                            
        }
        // return view("lecturers.asssign",["lecturerID" => $req->lecID]);
    }

}
