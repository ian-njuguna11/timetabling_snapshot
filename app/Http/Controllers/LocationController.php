<?php

namespace Timetabler\Http\Controllers;

use Illuminate\Http\Request;
use Timetabler\LabType;
use Timetabler\Location;
use Timetabler\School;

class LocationController extends Controller
{
    public function create(Request $request){
        $this->validate($request,[
            "location"=> 'required'
        ]);

        if(Location::firstOrCreate(["location"=> $request->location])){
            return back()->with(['info'=>"Location added."]);
        }


        return back()->withErrors(["error"=> "Unable to add location"]);
    }

    
    public function get(Request $request){}

    public function destroy($id){
        $labs = LabType::find($id);

        $labs->rooms()->delete();
        $labs->units()->delete();

        LabType::destroy($id);
        return redirect('lab-types');
    }

    public function edit($id)
    {

        $program = Location::all();

        $row = Location::where('id', $id)
            ->first();

        $params = [
            'name' => $row->name,
        ];

        $data = Location::find($id);

        return view('edit_location',['data' => $data],$params);

    }


    public function updateLocation(Request $request)
    {
        $request->validate([
            'name' => 'required',
        ]);

        Location::where('id',$request->id)->update([
            'location'=>$request->input('name'),
        ]);

        return redirect('buildings');
    }
    public function delete($id){
        //        Location::destroy($id)->School;
                Location::destroy($id);
                return redirect('buildings');
            }
        
}
