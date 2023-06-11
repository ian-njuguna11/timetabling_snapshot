<?php

namespace Timetabler\Http\Controllers;

use Timetabler\Lectures;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use PhpParser\Node\Stmt\Static_;
use Timetabler\department;
use Timetabler\Hide;
use Timetabler\Program;
use Timetabler\User;
use function GuzzleHttp\Psr7\str;
use Timetabler\School;


class LecturerController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //department main page
        $lecturers = Lectures::all();
        $departments = department::all();

        return view('lecturers', compact('lecturers', 'departments'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request)
    {
        Lectures::firstOrCreate([
            "first_name" => $request->first_name,
            "last_name" => $request->last_name,
            "email" => $request->lec_email,
            "deparment_ID"=>$request->department,
            "password" => Hash::make($request->password),
        ]);

        User::firstOrCreate([
            "name" => $request->first_name,
//            "last_name" => $request->last_name,
            "email" => $request->lec_email,
//            "deparment_ID"=>$request->department,
            "role" => "4",
            "password" => Hash::make($request->password),
        ]);


        return back();
    }

    public function timetable(){
        return view('lecturer-timetable');
    }

    public function assignHOD(Request $request)
    {
        $lecturer = lectures::where('id',$request->lec_id)->get();
        $lec_dpt_ID = $lecturer[0]->deparment_ID;

        //change Role
        $lec_email = $lecturer[0]->email;
        User::where('email',$lec_email)->update(['role'=>'5']);

        $others = Lectures::where('deparment_ID',$lec_dpt_ID)->update(['is_HOD'=>'0']);

        Lectures::where('id',$request->lec_id)->update(['is_HOD'=>'1']);
        return back();
    }

    /**
     * Update the specified resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @param \Timetabler\lectures $lectures
     * @return \Illuminate\Http\Response
     */
    public function update($id, Request $request, lectures $lectures)
    {

    $lecturer = Lectures::find($id);
    $department = Department::find($lecturer->department_id);
    $all_department = Lectures::all();

    return view('edit_lecturer',compact('lecturer','department','all_department'));

    }

    public function editLecturer(Request $request)
    {

       $data = $request->validate([
            'first_name' => 'required',
            'last_name' => 'required',
            'email' => 'required',
        ]);

//       return $data;

        lectures::where('id',$request -> input( 'lec_id' ))->update($data);

        return redirect('lecturers');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param \Timetabler\lectures $lectures
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $deleteLec = Lectures::find($id);
        $deleteLec->delete();
        return view('lecturers')->with('destroyLecturer',"Data was successfully deleted;");
    }

    public function getImport()
    {
        return view('import-lecturers');
    }

    public function lecturerTimetable(){
        $lecturers = Lectures::all();
        $departments = department::all();

        return view('lecturer-timetable', compact('lecturers', 'departments'));
    }

    

    public function renderProgramTimetable(Request $request)
    {
        $lecturers = Lectures::all();
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
            
            // dump($units);

        return view("programs-timetable",['school'=> $school_name, 'program'=> $program_name, 'levels'=> $units, 'lecturers'=> $lecturers]);

        // foreach($units as $session){
        //     $json_units = json_decode($session);
        //     // dump($json_units[0]->sessions);
        //     dump($json_units[0]->sessions[0]->unit);
        // }
            
    }
    }

    // public function lecUnits(Request $request)
    // {

    
    //     return view("lecturers.lec_units", ["units" => $lec->unit]);
    // }

    public function lecTimetable(Request $request)
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
            
        return view("lecturers.lec_timetable",["session" => $lc]);
        
    }


    public function lecID($request)
    {
        $lec_units = Lectures::where("email",$request->email)->get("id");
        //    $unit = $lec_units->unit;
        $lec_id = $lec_units[0]->id;

        return $lec_id;
    }
    
    
    public function getLecturers(Request $request){
        
        $lc = Lectures::where("id",$request->lec_id)
            ->with(
                "department",
                "Session",
                "Session.room",
                "Session.unit",
                "Session.period",
                "Session.period.day")->get();
            
            return response()->json($lc);
            
    }
    
    public function getPrograms(Program $program){
        dd('no');
        
        $lc = Lectures::where("id",$program->lec_id)
            ->with(
                "department",
                "Session",
                "Session.room",
                "Session.unit",
                "Session.period",
                "Session.period.day")->get();
            
            return $program->all();
            // response()->json($lc);
            
    }
    
}