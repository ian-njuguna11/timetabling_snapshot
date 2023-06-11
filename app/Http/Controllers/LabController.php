<?php

namespace Timetabler\Http\Controllers;

use Illuminate\Http\Request;
use Timetabler\LabType;
use Timetabler\Location;

class LabController extends Controller
{
    public function create(Request $request){
        $this->validate($request,[
            "type"=> 'required'
        ]);

        if(LabType::firstOrCreate(["type"=> $request->type])){
            return back()->with(['info'=>"Lab type added."]);
        }

        return back()->withErrors(["error"=> "Unable to add type"]);
    }

    public function update_lab($id)
    {

        $data = LabType::find($id);

        return view('location/edit_lab',compact('data'));
    }

    public function update(Request $request){

        $this->validate($request,[
            "type"=> 'required',
            "lab-id" => 'required'
        ]);



        if($type = LabType::find($request->input('lab-id'))){
            $type->type = $request->input('type');
            $type->save();

            return redirect('lab-types')->with(["info"=> "Lab updates successfully"]);
            //return back()
        }

        return back()->withErrors(["error"=> "The specified laboratory type does not exist!"]);
    }

    public function editLabs(Request $request)
    {
        $request->validate([
            'name' => 'required',
        ]);

        LabType::where('id',$request->id)->update([
            'type'=>$request->input('name'),
        ]);

        return redirect('lab-types');
    }
}
