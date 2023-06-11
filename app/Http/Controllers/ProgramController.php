<?php

namespace Timetabler\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Collection;
use PhpParser\Node\Expr\Cast\Object_;
use stdClass;
use Timetabler\department;
use Timetabler\Events\BroadcastSimpleMessage;
use Timetabler\Jobs\GenerateTimetable;
use Timetabler\Program;
use Timetabler\Room;
use Timetabler\School;
use Timetabler\Timetable;
use Timetabler\Unit;

class ProgramController extends Controller
{

    public function index(Request $request)
    {
        $programs = Program::with("levels", "levels.units", "school")->orderBy("school_id")->get();

        


        $schools = School::all();
        $departments = department::all();
        $data = [
            "programs" => $programs,
            "schools" => $schools,
            "departments" => $departments
        ];

        return view("programs", $data);
    }

    public function create(Request $request)
    {
        Program::create([
            "name" =>$request->name,
            "semesters" =>$request->semesters,
            "years" =>$request->years,
            "program_code" =>$request->program_code,
            "school_id" =>$request->school_id,
            "department_ID " =>$request->department_ID,
            ]

        );

        return back()->with('program_create', "Data created succesfully");



    }
    public function update(Request $request){
        $this->validate($request,[
            'name' => 'required|max:120'
        ]);

        if($program = Program::find($request->id)){
            $program->name = $request->name;
            $program->save();
            return back()->with(["info"=> "Update successful . "]);
        }

        return back()->withErrors(["error"=> "Unable to perform update!"]);
    }

    public function getProgram(Request $request){
        if($program = Program::find($request->id)){
            $data = [
                "program"=> $program
            ];
            return view("", $data); //TODO: Specify a view
        }
        // The program does not exist
        return back()->withErrors(["error"=> "The specified program does not exist!"]);
    }

    public function getPrograms(){
        $programs = Program::all();
        $data = [
            "program"=> $programs
        ];

        return view("", $data); //TODO: Specify a view
    }
    public function remove(Request $request){
        // TODO: There's a foreign key constraint and therefore, an error will occur if we don't destroy the
        // relationships first
        Program::destroy($request->id);

        return back();
    }

    public  function destroyProgram($id){
//        }
        /*
        *
        * There are foreign key constraints and therefore, before deleting any program
        * record we need to remove all the related data (or at least remove the relationship).
        */
        Program::destroy($id);
        return redirect('programs')->with('destroyProgram',"Data was successfully deleted;");
    }

    public function viewCreateProgram()
    {

        $programs = \Timetabler\Program::with("levels", "levels . units", "school")->get();
        $schools = School::all();

        return view('edit',compact("schools"));
    }

    public function updateProgram($id)
    {
        $data = Program::find($id);
        $schools = School::find($data->school_id);

        return view('edit_program',compact('data','schools'));
    }
    public function editProgram(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'semesters' => 'required',
            'years' => 'required',
            'program_code' => 'required',           
            'school_id' => 'required'
        ]);

        Program::where('id',$request->input('program_id'))->update([
            'name'=>$request->input('name'),
            'semesters' => $request->input('semesters'),
            'years' => $request->input('years'),
            'program_code' => $request->input('program_code'),
            'school_id' => $request->input('school_id'),
        ]);

        return redirect('programs');
    }

    public function programTimetable(){
        return view('programs-timetable');
    }
    
    
    
    
}