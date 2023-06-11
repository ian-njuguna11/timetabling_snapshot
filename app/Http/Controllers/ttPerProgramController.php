<?php

namespace Timetabler\Http\Controllers;

use Illuminate\Http\Request;

use Illuminate\Bus\Queueable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Support\Facades\App;
use Timetabler\Events\BroadcastSimpleMessage;
use Timetabler\Events\PDFGenerated;
use Timetabler\GeneratedDoc;
use Timetabler\School;
use Timetabler\Timetable;
use Timetabler\Lectures;
use stdClass;

use Timetabler\Level;


class ttPerProgramController extends Controller
{
  public function log()
  {

    $sessions = Timetable::with(
      'days',
      'days.periods',
      'days.periods',
      'days.periods.occupiedSessions',
      'days.periods.occupiedSessions.unit',
      'days.periods.occupiedSessions.unit.levelsInSession',
      'days.periods.occupiedSessions.unit.levelsInSession.program',
      'days.periods.occupiedSessions.room',
      'days.periods.occupiedSessions.period',
      'days.periods.occupiedSessions.period.day')
      ->get()->last()
      ->days->pluck('periods')->flatten()
      ->pluck('occupiedSessions')->flatten()
      ->map(function($session){
          $session->levelsInSession = $session->unit->levelsInSession[0];
          $session->school = $session->levelsInSession->school();
          return $session;
      })->groupBy('school.name');
    return view('pdf.timetable', ['schools'=> $sessions]);
  }

  public function levels()
  {
    # code...
    $lvls = Level::all();
    // return $lvls;
    foreach($lvls as $lv){
      $lv->update(["in_session"=>null]);
      // return Level::find($lv->id)->in_session;
    }
    // return "true";
  }

}
// function($lecturer){
//   // dd($lecturer); 
//   $lecturerOBJ = new stdClass();
  
//   $lecturerOBJ->lecturerName = $lecturer->first_name. " " . $lecturer->last_name;
//   $lecturerOBJ->lecturerEmail = $lecturer->email;
//   $lecturerOBJ->lecturerDepartment = $lecturer->department->name;

//   $sessions = $lecturer->Session;
//   foreach($sessions as $session) {
//       $session_instances = json_decode($session);
      
//       $lecturerOBJ->lectureRoom = $session_instances->room->room_code;
//       $lecturerOBJ->lectureUnit = $session_instances->unit->code;
//       $lecturerOBJ->lecturePeriod = $session_instances->period->time;
//       $lecturerOBJ->lecturePeriod = $session_instances->period->day->day;

//       // dump($lecturerOBJ);
//       return $lecturerOBJ;
//   }

  
// }



// "id": 103,
// "period_id": 10,
// "unit_id": 1,
// "lecture_id": 2,
// "room_id": 4,
// "group": "Non",
// "groups": 1,
// "created_at": "2022-06-28 12:35:49",
// "updated_at": "2022-07-07 19:43:13"