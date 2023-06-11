<?php

namespace Timetabler\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Timetabler\LabType;
use Timetabler\Level;
use Timetabler\Program;
use Timetabler\Unit;
use Timetabler\User;

use DB;

class LevelsController extends Controller
{
    public function index(Request $request){
        $program_id = $request->program_id;
        $program = Program::with("levels", "levels.units", "levels.units.lab_type")->where('id', $program_id)->first();

        $units = Unit::all();

        $programUnits = Program::with("levels.units")->where('id', $program_id)->first();;

        $labs = LabType::all();
        $data = [
            "program"=> $program,
            "units"=> $units,
            "labs"=> $labs,
            "programUnits" => $programUnits,
        ];

        // $level = Level::all();
        // dd($level);

        //dd($data);
        return view("levels", $data);
    }

    public function create(Request $request){
        $this->validate($request, [
            "level"=> 'required|max:20'
        ]);

        $data = [
            "program_id"=> $request->program_id,
            "level"=> $request->level
        ];

        if(Level::firstOrCreate($data)){
            return back()->with(["info"=> "Level created."]);
        }

        return back()->withErrors(["error"=> "Could not add level!"]);
    }

    public function update(Request $request){
        $this->validate($request, [
            "num_students"=> 'required|min:0'
        ]);
        $level = Level::find($request->level_id);
        if($level){
            $level->num_students = $request->num_students;
            if($request->has('in_session')){
                $level->in_session = true;
            }else{
                $level->in_session = false;
            }
            $level->save();

            return back()->with(["info"=> "Level updated."]);
        }

        return back()->withErrors(["error"=> "Could not perform an update on the level!"]);
    }
    /**
     * Returns a level specified by level id
     */
    public function getLevel(Request $request){
        if($level = Level::find($request->id)){
            return view("", ["level"=> $level]); // TODO: Specify a view
        }

        // The level does not exist
        return back()->withErrors(["error"=> "The specified level does not exist!"]);
    }

    /**
     * Returns all the levels of a specified program represented by an id
     */
    public function getLevels(Request $request){
        $levels = Level::where("program_id", $request->program_id)->get();

        return view("", ["levels"=> $levels]); //TODO: Specify a view
    }

    /**
     * Assigns a given unit to a specified level.
     * Remember, a unit can be taken by different groups at the same time
     * and a level can also have several units. Therefore, a Many to Many
     * relationship is required. This relationship is aided by 'levels_units_pivot' table.
     *
     * We are going to create units elsewhere so this function will only
     * define a relationship between a level and a unit.
     */

    
    public function addUnit(Request $request){

        //dd($request);
        $level_id = $request->level_id;
        $units = explode(',', $request->units);

        $level = Level::find($level_id);
        $unit = Unit::find($units);
        // We need to ensure that both the level and the unit exists
        if($level && $unit){

            $level->units()->attach($unit);
            return back()->with(["info"=> "Unit added successfully."]);
        }

        return back()->withErrors(["error"=> "Could not assign the unit to the level!"]);
    }


    public function removeUnits(Request $request){
        $level_id = $request->level_id;
        $units = explode(',', $request->units);

        $level = Level::find($level_id);
        $unit = Unit::find($units);
        // We need to ensure that both the level and the unit exists
        if($level && $unit){

            $level->units()->detach($unit);
            return back()->with(["info"=> "Units removed successfully."]);
        }

        return back()->withErrors(["error"=> "Could not remove units from the stage!"]);
    }


    public function remove(Request $request){
        /*
        * There are foreign key constraints and therefore, before deleting any level
        * record we need to remove all the related data (or at least remove the relationship).
        */

        if($level = Level::find($request->id)){
            // Remove the relationships first
            $level->units()->detach();

            // Delete the model now
            $level->delete();

            return back()->with(["info"=> "Level deleted."]);
        }
        return back()->withErrors(["error"=> "The level does not exist!"]);
    }
}