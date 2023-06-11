<?php

namespace Timetabler\Http\Controllers;

use Illuminate\Http\Request;
use Timetabler\LabType;
use Timetabler\Lectures;
use Timetabler\Program;
use Timetabler\Unit;
use Timetabler\School;

class UnitController extends Controller
{
    public function create(Request $request){
        $this->validate($request,[
            "code"=> 'required|max:10|unique:units',
            "name"=> 'required|max:150',
            "lecture_hours"=> 'required|numeric',
            "lab_hours"=> 'required|numeric',
            "lecturer" => 'required|numeric',
            "lab_type"=> 'required_unless:lab_hours,0'
        ]);

        $data = [
            "code"=> preg_replace('/\s/', '', strtoupper($request->code)),
            "name"=> strtoupper($request->name),
            "lecture_hours"=> $request->lecture_hours,
            "lab_hours"=> $request->lab_hours,
            "lecturer_id" => $request->lecturer,
            "lab_type_id"=> $request->lab_hours == "0" ? null : $request->lab_type
        ];

        if(Unit::where('code', $data['code'])->first()){
            return back()->withErrors(["error"=> "The specified unit code exists!"]);
        }

        if(Unit::create($data)){
            return back()->with(["info"=> "Unit created."]);
        }

        return back()->withErrors(["error"=> "Could not create unit!"]);
    }



    /**
     * Retrieve a specified unit
     */
    public function getUnit(Request $request){
        $unit = Unit::find($request->id);


        return view("", ["unit"=> $unit]); // TODO: Specify the view
    }

    /**
     * Get all the units
     */
    public function getUnits(Request $request){
        $units = Unit::orderBy("code")->get();
        $labs = LabType::all();
        $programs = Program::all();
        $lecturers = Lectures::all();
        
        // return $lecturers;

        return view("units", ["units"=> $units, "labs"=> $labs,"programs"=>$programs, "lecturers" => $lecturers]);
    }

    public function mergeUnits(Request $request){
        $merge_to = $request->merge_to;
        $units = explode(',', $request->units);

        $merge_to_unit = Unit::find($merge_to);

        if(!$merge_to_unit){
            return back()->withErrors(["error"=>"An error occurred!"]);
        }

        $merge_to_unit->mergeUnits($units);
        $merge_to_unit->save();

        return back();
    }

    public function splitUnit(Request $request){
        $unit_code = $request->unit_code;
        $unit = Unit::find($request->unit_id);

        if($unit){
            $unit->splitUnit($unit_code);
        }

        return back();
    }

    public function splitUnits(Request $request){
        $unit = Unit::find($request->id);
        if($unit){
            $unit->splitAllUnits();
        }

        return back();
    }

    public function remove(Request $request){
        /*
         * There are foreign key constraints and therefore, before deleting any unit
         * record we need to remove all the related data (or at least remove the relationship).
         */
        if($unit = Unit::find($request->id)){
            // Remove all relationships first
            // $unit->levels()->count();

            $level_check = !is_null(
                $unit->levels()
                     ->where('unit_id', $request->id)
                     ->first()

            
            );


            if($level_check){

                // return "Units Has Programs";
                return redirect()->back()->with('alert','Units Has Programs');
                
            }else{
                $unit->delete();
                return redirect('units');
            }

          
        }
        // else{
        //       // We can now delete the model
        //       $unit->delete();

        //       return back()->with(["info"=> "Unit deleted!"]);
        // }

        
            
            return back()->withErrors(["error"=> "Error. The Unit does not exist!"]);
          
    

    }

    public function createUnits(Request $request){
        $request->validate([
            "code"=>'required',
            "name"=>'required',
            "lecture_hours"=>'required',
        ]);

        Unit::firstOrCreate([
            'code'=>$request->input('code'),
            "name"=>$request->input('name'),
            'lecture_hours'=>$request->input('lecture_hours'),
            "lab_hours"=>$request->input('lab_hours'),
            'lab_type_id'=>'2 - Skill Lab 11'
        ]);

        return redirect('units');
    }

    public function editUnits(Request $request,$id){

        $units = Unit::orderBy("code")->get();
        $labs = LabType::all();
        $programs = Program::all();
        

        // return view("units", ["units"=> $units, "labs"=> $labs,"programs"=>$programs]);


        $program = Unit::all();

        $row = Unit::where('id', $id)
            ->first();

        $params = [
            'Info' => $row,
            'Title' => 'Edit',
            // 'name' => $row->name,
            // 'Program' => $row->id
        ];

        $data = Unit::find($id);

        return view('edit_unit',['data' => $data],["units"=> $units, "labs"=> $labs,"programs"=>$programs],$params);
    }

    public function update(Request $request){

        $request->validate([
            'name' => 'required',
        ]);

        $lab = LabType::where('type',$request->input('lab_type_id'))->get('id');
        

        if($request->input('lab_hours') == 0){
            Unit::where('id',$request->id)->update([
                'name'=>$request->input('name'),
                'code'=>$request->input('code'),
                'lecture_hours'=>$request->input('lecture_hours'),
                // 'lab_hours'=>"n/a",
                // 'name'=>$request->input('name'),
                // 'name'=>$request->input('name'),
    
            ]);
        }else{
            Unit::where('id',$request->id)->update([
                'name'=>$request->input('name'),
                'code'=>$request->input('code'),
                'lecture_hours'=>$request->input('lecture_hours'),
                'lab_hours'=>$request->input('lab_hours'),
                // 'lab_type_id'=>$lab[3]->id,
                // 'lab_type_id'=>$request->input('lab_type'),
    
            ]);
        }


        return redirect('units');
    }
}