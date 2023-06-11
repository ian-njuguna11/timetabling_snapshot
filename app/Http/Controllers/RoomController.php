<?php

namespace Timetabler\Http\Controllers;

use Illuminate\Http\Request;
use Timetabler\LabType;
use Timetabler\Location;
use Timetabler\Room;
use Timetabler\School;
use Timetabler\CsvProgram;
use Maatwebsite\Excel\Facades\Excel;
use Illuminate\Support\Arr;

class RoomController extends Controller
{
    public function index()
    {
        $rooms = Room::with("location", "labType")->get();
        $locations = Location::all();
        $labs = LabType::all();
        $data = [
            'rooms' => $rooms,
            'locations' => $locations,
            'labs' => $labs
        ];
        return view("location.rooms", $data);
    }

    public function create(Request $request)
    {
        $room_per_building = Room::with('room_code');

        $this->validate($request, [
            "location_id" => 'required',
            "room_code" => 'required|max:50',
            "type" => 'required',
            "lab_type" => 'required_if:type,lab',
            "capacity" => 'required'
        ]);

        $data = [
            'location_id' => $request->location_id,
            'room_code' => $request->room_code,
            'type' => $request->type,
            'lab_type_id' => $request->type == 'lab' ? $request->lab_type : null,
            'capacity' => $request->capacity
        ];


        //Check for existing room

        $incoming_room_code = Arr::get($data, 'room_code');
        $location = Arr::get($data, 'location_id');
        $rooms = Room::all();
    
        foreach ($rooms as $room) {
            if ($room['room_code'] == $incoming_room_code && $room['location_id'] == $location){
                return back()->with(["error" => "Room alread added"]);

            }    
        }
        


        if (Room::updateOrCreate($data)) {
            return back()->with(["info" => "Room added successfully"]);
        }

        // dd($room_per_building);
        return back()->withErrors(["error" => "Unable to add a room!"]);
    }
    public function update(Request $request)
    {
    }
    public function get(Request $request)
    {
    }
    public function destroyRoom($id)
    {
        //
        Room::destroy($id);
        return redirect('rooms');
    }
    public function destroyLabtype($id)
    {
        LabType::destroy($id);
        return redirect('lab-types');
    }

    // handle csv uplaod

    public function upload_programs($id)
    {

        $data = School::find($id);

        return view('csv/programs', compact('data'));
    }

    /**
     * @return \Illuminate\Support\Collection
     */
    public function import(Request $request)
    {
        if ($request->hasFile('kartik-input-700')) {
            $csv = $request->file('kartik-input-700');
            var_dump($csv);
            exit;
            Excel::import(new CsvProgram, request()->file('file'));
        }
        return back();
    }




    public function editRooms($id)
    {


        $program = Room::all();

        $row = Room::where('id', $id)
            ->first();

        $params = [
            'Info' => $row,
            'Title' => 'Edit',
            'name' => $row->name,
            'Program' => $row->id
        ];

        $data = Room::find($id);

        return view('edit_rooms', ['data' => $data], $params);
    }

    public function updateRoom(Request $request)
    {
        $request->validate([
            'name' => 'required',
        ]);

        Room::where('id', $request->id)->update([
            'room_code' => $request->input('name'),
        ]);

        return redirect('rooms');
    }
}
