<?php

namespace Timetabler\Http\Controllers;
use Illuminate\Http\Request;
use Timetabler\LabType;
use Timetabler\Location;
use Timetabler\Program;
use Timetabler\Room;
use Timetabler\School;

class SchoolsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $schools = School::all();

        return view('schools', compact('schools'));
    }

    public function school_program(Request $request){
        $schools = School::all();

        $school_programs = School::with('programs')
        // $schools = School::all()
            ->where('id',2)
            ->first();

        $data = [
            
            'school'=>$school_programs
        ]  ;      
        return view('school_program',['schools'=>$schools, 'school_programs'=>$school_programs], $data);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request)
    {
        $this->validate($request, [
            "name"=> ['required', 'string', 'max:255']
        ]);

        $school = School::firstOrCreate(["name"=> strtoupper($request->name)]);

        if($school)
           
            return back()->with(['info'=> "School added successfully!"]);

        return back()->withErrors(["error"=> "An error occurred!"]);
    }

    public function getPrograms(Request $request){

        $school = School::with('programs')
        // $schools = School::all()
            ->where('id', $request->school_id)
            ->first();

        return view('school_programs', ['school'=> $school]);

    }
    

    public function createProgram(Request $request){

        return view('school_programs');

        $this->validate($request,[
            'name' => 'required|max:120',
            'semesters'=> 'required|min:1',
            'years'=> 'required|min:1',
            'school_id'=> 'required',
            'program_code'=>'required',
            'new_school'=> ['required_if:school,0']
        ]);

        $school_id = $request->school;
        if($request->school == 0){
            $school = School::create(["name"=> strtoupper($request->new_school)]);

            $school_id = $school->id;
        }

        $data = [
            'name'=>" Program name",
            'semesters'=> 2,
            'years'=> 3,
            'school_id'=> 1
        ];

        $program = Program::create($data);

        return view('programs', ['school'=> $school]);

        if($program){

            if($request->has('program_code')){
                $program->program_code = $request->program_code;
                $program->save();
            }

            return back()->with(["info"=> "Program created successfully."]);
        }

        return back()->withErrors(["error"=> "An error occurred!"]);
    }

    public function addLocations(Request $request){
        // dd($request->locations);
        $school_id = $request->school_id;
        $location_ids = explode(',', $request->locations);

        $school = School::find($school_id);
        $locations = Location::find($location_ids);

        if($school && $locations){
            $school->locations()->attach($locations);

            return back()->with(['info'=> 'Locations Removed']);
        }

        return back()->withErrors(['error'=> 'An error occurred while Removing locations']);
    }

    public function removeLocations(Request $request){
        // dd($request->location_code);
        $school_id = $request->school_id;
        $location_ids = explode(',', $request->locations);

        $school = School::find($school_id);
        $locations = Location::find($location_ids);

        if($school && $locations){
            $school->locations()->detach($locations);

            return back()->with(['info'=> 'Locations Added']);
        }

        return back()->withErrors(['error'=> 'An error occurred while adding locations']);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($school_id)
    {
        $school = School::with('locations')
            ->where('id', $school_id)
            ->first();

        $locations = Location::all();

        return view('school', ['school'=>$school, 'locations'=>$locations]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Contracts\Foundation\Application|\Illuminate\Contracts\View\Factory|\Illuminate\Http\Response|\Illuminate\View\View
     */
    //@ian-development
    public function destroy($id)
    {
        $school_orm = Program::where('school_id',$id)->get();


        if($school_orm->count() > 0){

            // return 'school has programs unable to delete';
            return redirect()->back()->with('alert','school has programs unable to delete');

        }else{

            School::destroy($id);
            return redirect('schools');

        }



    }

    public function destroyProgram($id){
//        Program::destroy($id);
        return redirect('units');
    }

    public function locationsLTE(){
        $rooms = Room::with("location", "labType")->get();
        $locations = Location::all();
        $labs = LabType::all();
        $data = [
            'rooms'=> $rooms,
            'locations'=> $locations,
            'labs'=> $labs
        ];
        return view('location.locations',$data);
    }
    public function labTypes(){
        $rooms = Room::with("location", "labType")->get();
        $locations = Location::all();
        $labs = LabType::all();
        $data = [
            'rooms'=> $rooms,
            'locations'=> $locations,
            'labs'=> $labs
        ];
        return view('location.lab-types',$data);
    }

    public function update_school($id)
    {

        // 

        $row = School::where('id', $id)
            ->first();

        $params = [
            'Info' => $row,
            'Title' => 'Edit',
            'name' => $row->name,
            'Program' => $row->id
        ];

        $data = School::find($id);

        return view('edit_school',['data' => $data],$params);

    }


    public function editSchool(Request $request)
    {
        $request->validate([
            'name' => 'required',
        ]);

        School::where('id',$request -> input( 'school_id' ))->update([
            'name'=>$request->input('name'),
        ]);

        return redirect('schools');

    }


    public function update_location($id)
    {
        $location = Location::all();
        $row = Location::where('id', $id)
            ->first();
        $params = [
            'Location' => $row->id
        ];

        $data = Location::find($id);

        return view('edit_location',['data' => $data],$params);

    }

    public function editLocation(Request $request)
    {
        $request->validate([
            'location' => 'required',
        ]);

        Program::where('id',$request->id)->update([
            'location'=>$request->input('location'),
        ]);

        return redirect('location.locations');
    }
}
