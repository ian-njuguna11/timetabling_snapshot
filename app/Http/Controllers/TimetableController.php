<?php

namespace Timetabler\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Redis;
use stdClass;
use PDF2;
use Mail;
use Mpdf\Tag\Br;
use phpDocumentor\Reflection\Types\Boolean;
use RealRashid\SweetAlert\Facades\Alert;
use Timetabler\Events\AssignLecturerSessionSync;
use Timetabler\Events\TimetableCreated;
use Timetabler\GeneratedDoc;
use Timetabler\Jobs\CreatePeriods;
use Timetabler\Jobs\CreateTimetableDay;
use Timetabler\Jobs\FillTimetable;
use Timetabler\Jobs\GeneratePDF;
use Timetabler\Jobs\GeneratePDFPerProgram;
use Timetabler\Jobs\GeneratePDFPerRoom;
use Timetabler\Jobs\GenerateTimetable;
use Timetabler\Jobs\TimetableGenerated;
use Timetabler\Period;
use Timetabler\Session;
use Timetabler\Timetable;
use Timetabler\TimetableDay;
use Timetabler\Room;
use Timetabler\Http\Controllers\NotificationController;
use Timetabler\Jobs\AssignLecturerSyncJob;
use Timetabler\School;
use Timetabler\Lectures;
use Timetabler\Program;
use Timetabler\Unit;

use function GuzzleHttp\Promise\each;


class TimetableController extends Controller
{
    public function index(){
        //$timetables = Timetable::all();
        //return view('timetable', ['timetables' => $timetables]);

        $docs = GeneratedDoc::with('school', 'program')
            ->get()
            ->each(function($doc){
                $doc->school_name = $doc->school->name;
                //$doc->room_name = $doc->room->room_name;
            })
            ->groupBy('description');

        return view('timetable', ['timetables' => $docs]);
        }

    public function createIndex(){
        return view('create_timetable');
    }


    public function downloadPDF(Request $request){
        $doc = GeneratedDoc::with('program')
            ->where('id', $request->file_id)
            ->first();
        if(!$doc){
            abort(404);
        }
        return response()->download(public_path('generated/'.$doc->document_name),
            str_replace(" ", "_", $doc->program->name).".pdf");
    }

    public function generate(Request $request){
        //dd($request);

        /* Remove the currently generated timetable from the database
         * And reset AUTO_INCREMENT to 1
         *
         * This is important so we can keep only one copy of the generated timetables in
         * the database and avoid accumulating too much unnecessary data in the database.
         *
         * All generated timetables are put in PDF format
         *
         */

        DB::statement("SET foreign_key_checks=0");

        Timetable::truncate();
        DB::statement("ALTER TABLE timetables AUTO_INCREMENT = 1;");

        TimetableDay::truncate();
        DB::statement("ALTER TABLE timetable_days AUTO_INCREMENT = 1;");

        Session::truncate();
        DB::statement("ALTER TABLE sessions AUTO_INCREMENT = 1;");

        Period::truncate();
        DB::statement("ALTER TABLE periods AUTO_INCREMENT = 1;");

        DB::statement("SET foreign_key_checks=1");

        GenerateTimetable::dispatch($request->all())
            //->delay(now()->addSeconds(5))
            ->chain([
                new FillTimetable(),
                new TimetableGenerated(),
                new GeneratePDFPerProgram(),
                new GeneratePDFPerRoom()
            ]);

        //$this->dispatch(new GenerateTimetable($request->all()));

        //dd("Check if it works");
        return redirect(url('programs-timetable'));
    }

    public function progress(){
        return view('');
    }


    //RoomPDF Download

    public function downloadPdfRoom($room_pdf){
//        return response()->file(public_path('generated\rooms\Auditorium799be4bfe7e484b980550774589eeb29.pdf'));
        $path = public_path('generated/rooms/'.$room_pdf);
        return response()->download($path);

    }

    public function all_files(){
        $path = public_path('generated/rooms');
        $files = scandir($path);

        foreach ($files as $key){
            $file_parts = pathinfo($key);
        }

        $file_parts['extension'];
        $cool_extensions = Array('pdf','docx');

        if (in_array($file_parts['extension'], $cool_extensions)){
//            FUNCTION1
            return view('rooms_download', ['files' => $files]);
        } else {
//                    FUNCTION2
            return "not a pdf";
        }



//        return
}

    public function downloadRoomTimetable(){
        $files=GeneratedDoc::all();
        return view('rooms_download', ['files' => $files]);
    }
    
    public function downloadRoomPDF(Request $request) {
        $room_doc = GeneratedDoc::with('room')
            ->where('id', $request->file_id)
            ->first();
        if(!$room_doc){
            abort(404);
        }
        return response()->download(public_path('generated/rooms/'.$room_doc->document_name),
            str_replace(" ", "_", $room_doc->room->code).".pdf");
    }

    // public function display_room_pdf(){
    //     $files = Storage::files("public");
    //     $images=array();
    //     foreach ($files as $key => $value) {
    //         $value= str_replace("public/","",$value);
    //         array_push($images,$value);
    //     }
    //     return view('rooms_download', ['images' => $images]);

    // }

    public function renderRoomTimetable()
    {
    
            $rooms = Session::with("room",
                "unit",
                "unit.levelsInSession",
                "unit.levelsInSession.program",
                'period',
                'period.day')->whereHas('unit')->get()
                ->map(function($session){
                    $refinedSession = new stdClass();
    
                    $refinedSession->name = $session->room->room_code;
                    $refinedSession->type = $session->room->type;
                    $refinedSession->capacity = $session->room->capacity;
                    $refinedSession->unit = $session->unit->code;
                    $refinedSession->time = $session->period->time;
                    $refinedSession->day = $session->period->day->day;
                    $refinedSession->group = $session->group;
                    $refinedSession->totalStudents = $session->unit->levels->sum("num_students");
    
                    $programs = '';
    
                    $session->unit->levels->each(function($level) use (&$programs){
                        $programs .= $level->program->program_code." ";
                    });
    
                    $refinedSession->programs = $programs;
    
    
                    return $refinedSession;
                })
                ->groupBy("name")
                ->map(function($rooms){
                    return $rooms->groupBy("day");
                });

                return view('TimetableHTML.room_timetable', ['rooms'=> $rooms]);
            


    }

    public function renderProgramTimetable()
    {
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

        return view("TimetableHTML.program_timetable",['school'=> $school_name, 'program'=> $program_name, 'levels'=> $units]);

        // foreach($units as $session){
        //     $json_units = json_decode($session);
        //     // dump($json_units[0]->sessions);
        //     dump($json_units[0]->sessions[0]->unit);
        // }
            
    }
    }

    public function renderLecturer()
    {
        $lc = Lectures::with(
            "Session",
            "Session.room",
            "Session.unit",
            "Session.period",
            "Session.period.day")->get();
    
        return view("TimetableHTML.lecturer_timetable",["session" => $lc]);
    }
    
    
    public function assignlec(Request $request)
    {
        // {lec_ID}/{sess_id}
        
        // return array($request->lec_ID, $request->sess_id) ;
        $lec_sess = [];
        $new_session = Session::find($request->sess_id);
        $lec_check = Lectures::find($request->lec_ID);
        
        $lec_other_session = $lec_check->Session;
        $lec_id = $request->lec_ID;
        $crash = false;
        
        // return $lec_other_session;
        
        $lecturers_session = Session::where("lecture_id", $request->lec_ID)->get();
        
        if(count($lecturers_session) == 0){
        //    dump("first time assign"); 
            $new_session->update([
                "lecture_id" => $lec_id,
            ]);
            
           
            
            
            AssignLecturerSyncJob::dispatch($new_session->id, $lec_id);
            
            Alert::success('Action Success! ', 'Successfully, assigned ')->autoclose(6500); 
            return redirect("hods/assign_specific_lec/".$lec_id);  
        }
        
        if($lecturers_session){
            foreach($lecturers_session as $session){
                if(($session->period->day->day == $new_session->period->day->day) && ($session->period->time == $new_session->period->time)){
                        
                    echo nl2br($session->period->day->day . " == " .$new_session->period->day->day . "  and" . 
                                $session->period->time ."==" . $new_session->period->time . " ---same day same time-----"."\n");
                        
                    Alert::warning('Warning Title', 'Clash was detected could not assign lecture.')->autoclose(9000000000000);   
                    $crash =true;
                    break;
                    
                            
                }else{
                
                    echo nl2br($session->period->day->day . " != " .$new_session->period->day->day . "  and" . 
                    $session->period->time ."!=" . $new_session->period->time . " ---no conflict-----"."\n"); 
                   
                    Alert::success('Action Success! ', 'Successfully, assigned ')->autoclose(6500); 
                
                }
            }
            
            
        }
        
        if($crash == true){
            
            // dump("clash detected");
            return redirect("hods/assign_specific_lec/".$lec_id);  
            
            
        }elseif($crash == false){
            $new_session->update([
                "lecture_id" => $lec_id,
            ]);
            
            // dd("here");
            AssignLecturerSyncJob::dispatch($new_session->id, $lec_id);
            
            
             return redirect("hods/assign_specific_lec/".$lec_id);  
            
        }
        
    
        
        
        
                            
        // return $session;
        // return $lecturers_session;
        
    }
    
    
    // ->each(function($session, $key) use ($new_session, $lec_other_session, $lec_id) {
    //     // echo $session->period->day->day;
    //     // echo $new_session->period->day->day;
        
    //     if(($session->period->day->day == $new_session->period->day->day) && ($session->period->time == $new_session->period->time)){
                
    //         echo nl2br($session->period->day->day . " == " .$new_session->period->day->day . "  and" . 
    //                     $session->period->time ."==" . $new_session->period->time . " ---same day same time-----"."\n");
                        
    //         // $clash = true;
            
    //         // if($clash){
                
    //             Alert::warning('Warning Title', 'Clash was detected could not assign lecture.')->autoclose(9000000000000);   
    //             return false;
                    
                    
    //     }else{
        
    //         echo nl2br($session->period->day->day . " != " .$new_session->period->day->day . "  and" . 
    //         $session->period->time ."!=" . $new_session->period->time . " ---no conflict-----"."\n"); 
    //         // return response()->json(array('success' => true, 'res'=>$session->period->day->));
        
    //         $new_session->update([
    //             "lecture_id" => $lec_id,
    //         ]);
    //         Alert::success('Action Success! ', 'Successfully, assigned '.$new_session->lecture->first_name)->autoclose(6500); 
        
    //     }
        
    //     // // echo $new_session;
    //     // if(!$lec_other_session){
    //     //     // echo "no data"; 
                
    //     // }elseif($lec_other_session){
    //     //     // echo "we have data";
           
    //     // }
        
    // });
    
    
    public function assignPostLec(Request $req)
    {
        # code...
        return response()->json(array('success' => true, 'session'=>$req->session, 'lecId'=>$req->lecId));
        
    }
    
    

    public function assign(Request $request)
    {   
        $lecturers_session = Session::where("lecture_id",$request->lecId)->get();
        $l_name = "";
        
         /*check lec crushes 
            1.against their timeline,
            2.against other lecturers .
        */ 
        foreach($request->session as $session){
            $sess = Session::find($session);
            
            $sess->update([
                "lecture_id"=>$request->lecId,
            ]);
            
            
            $lec_name = $sess->lecture->first_name." ".$sess->lecture->last_name;
            $l_name = $lec_name;
            
            Alert::success('Action Success! ', 'Successfully, assigned '.$l_name)->autoclose(4500); 
            
            // Alert::warning('Warning Title', 'Warning Message')->autoclose(9000000000000);
            // Alert::info('Info Title', 'Info Message')->autoclose(9000000000000);
            // Alert::question('Question Title', 'Question Message')
            

        }
        
        // return view();
        
        // return back();
        return response()->json(array('success' => true, 'lecId'=>$request->lecId, 'lecturers_session'=>$lecturers_session, 'rqSS' => $request->session, "lec_name" =>$l_name ));
        
                // ->redirect("assign_specific_lec/".$request->lecId);
    }
            // Alert::info('Info Title', 'Info Message')->autoclose(9000000000000);
            // Alert::question('Question Title', 'Question Message')
            
    
    public function checkClash($session)
    {
                
    }
    
    public function dispatchRoomsEmail()
    {
        # code...
        $data["email"] = "philipmatunda@gmail.com";
        $data["title"] = "From Kabarak Timetabling System.";
        $data["body"] = "This is Demo";
        
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
    
            // return view("TimetableHTML.program_timetable",['school'=> $school_name, 'program'=> $program_name, 'levels'=> $units]);
            $pdf = PDF2::loadView('emails.program_timetable',['school'=> $school_name, 'program'=> $program_name, 'levels'=> $units]);
        
            Mail::send('emails.timetable_email_dispatch', $data, function($message)use($data, $pdf) {
                $message->to($data["email"], $data["email"])
                        ->subject($data["title"])
                        ->attachData($pdf->output(), "text.pdf");
            });
      
            dd('Mail sent successfully');
    
            // foreach($units as $session){
            //     $json_units = json_decode($session);
            //     // dump($json_units[0]->sessions);
            //     dump($json_units[0]->sessions[0]->unit);
            // }
                
        }
    }
    
    public function dispatchToUsers(Request $request)
    {
        # code...
        $data["email"] = "njugunaayan@gmail.com";
        $data["title"] = "From Kabarak Timetabling System.";
        $data["body"] = "This is Demo";
        
        $lecturer = Lectures::find($request->lec_id);
        
        $lc = Lectures::where('id', $request->lec_id)
            ->with(
            "Session",
            "Session.room",
            "Session.unit",
            "Session.period",
            "Session.period.day")->get();
        
        //  return $lc;       
                // return view('emails.room_timetable', ['rooms'=> $rooms]);
  
        $pdf = PDF2::loadView("emails.lecturer_timetable",["session" => $lc]);
        
        
        
        Mail::send('emails.timetable_email_dispatch', $data, function($message)use($data, $pdf, $lecturer) {
            $message->to("injuguna@kabarak.ac.ke", $data["email"])
                    ->subject($data["title"])
                    ->attachData($pdf->output(), $lecturer->first_name.$lecturer->last_name.".pdf");
        });
        
        // Session::flash('email_sent', 'Email sent successfully to ..!!' .$lecturer);

        // return redirect();
        return redirect("all_lecturers_timetable")->withSuccess('Email sent successfully to ' .$lecturer->first_name. " ".$lecturer->last_name . " @ ". $lecturer->email ." ..!");
        
  
        // dd('Mail sent successfully');
    }
    
        // return $room->roomsWithSession();
        // return $room->roomsWithSessionPeriod();
        // return $room->roomsWithSessionPeriodTime()->first();
        // return $session->emptySessions($room);
    
    public function allocateClassTime(Room $room, Session $session)
    {
        
    }
    
   
    
    function freesClassTImes(Request $request, Period $period){
        
        $session_to_change = $this->session_query_generic(new Session());
        // return json_encode($session_to_change);
        $request->session()->put('without_session_to_change', '');
                
        $free_sessions = $this->freeSessions($period);
        
        
    return view("TimetableHTML.free_periods.freesCLassTime", compact('free_sessions', 'session_to_change'));
    

    }
    
    public function session_query(Session $session){        
        return  response()->json($session);
    }
    
    public function session_query_generic(Session $session){
        
        $session_query_generic = new stdClass();
        $session_query_generic->id = $session->id;
        $session_query_generic->period = is_null($session->period) ? " " : $session->period ;
        $session_query_generic->unit_name = is_null($session->unit) ? " " : $session->unit->name;      
        $session_query_generic->unit_code = is_null($session->unit) ? " ": $session->unit->code;      
        $session_query_generic->lecturer_name = is_null( $session->lecture) ? " " :  $session->lecture;      
        $session_query_generic->room_code = is_null($session->room)? " ": $session->room->room_code;      
        
        return $session_query_generic;
        
    }
    
    public function availableFreeSessions(Request $request, Session $session, Period $period){
        
        $session_to_change = $this->session_query_generic($session);
        // return json_encode($session_to_change);
        
        // dd( $this->freeSessions($period));
        // return $this->freeSessions($period);
        
        $request->session()->put('state_message', ' ');
        
        // $sess = new Session();
        
        $free_sessions = $session->unoccupiedSessions()->get();
        //  $this->freeSessions($period);
        
        // dump($free_sessions);
        // return $free_sessions;
        
        
        return view('TimetableHTML.free_periods.freesCLassTimeGen', compact('free_sessions', 'session_to_change'));
        
    }
    
    public function freeClassPeriod(Period $period){
        return response()->json($period);
    }
    
    //free Sessions...
    public function freeSessions(Period $period){
        return $period::with(
            'unoccupiedSessions',
            'unoccupiedSessions.room',
            'unoccupiedSessions.period',
            'unoccupiedSessions.period.day')->get()->map(function($item, $key){
                
                $free_sess = new  stdClass();
                
                $free_sess->id = $item->id;
                // $free_sess->room_id = $item;
                $free_sess->day = $item->day->day;
                $free_sess->time = $item->time;
                $free_sess->room = $item;
                // $free_sess->room_id = $item_;
                $free_sess->room_code  = $item->unoccupiedSessions;
                // ->pluck('room')->each(function($item, $key){
                //    return $item->id;
                // }) ;
                                
                return $free_sess;
                
            });
    }
   
   // Todo: student in refference time...
   public function areStudentsInaProgramFree(Unit $unit, Period $period,Session $session, Room $room){
    
        // return $session;
    
        $all_programs = Unit::where('id', $unit->id)->with(
            'levelsInSession',
            'levelsInSession.program',           
        )->get()->map(function($item){
            return $item->levelsInSession->map(function($item){
                
                $units_lv_insession = new stdClass();
                $units_lv_insession->level_id = $item->id;
                $units_lv_insession->level = $item->level;
                $units_lv_insession->program_id = $item->program->id;
                $units_lv_insession->program_name = $item->program->name;
                $units_lv_insession->program_code = $item->program->program_code;
                
                return $units_lv_insession;
            });   
        });
        
        // return $all_programs;
        $programms_taking = json_decode(...$all_programs);
        // return $programms_taking;
        
        
        // $in_program_arr = $this->allTTObject(1);        
        // return $in_program_arr[0];
        
        foreach($programms_taking as $in_program){
            
            // dump( json_encode($in_program));
            
            //get all session being taken by associative programs
            $in_program_arr = $this->allTTObject($in_program->program_id);   
            
            // return $in_program_arr[0]; 
            
            
            //iter through the programs take sessoions check if period is already occupied
            foreach($in_program_arr[0] as $prg_obj){
                
                // return $prg_obj->period_id;
                if(  $prg_obj->period_id ==  $period->id){
                    return "Period is occupied By program " . $prg_obj->period_id ." " . $period->id;
                } else{
                    
                    $session->update([
                        'period_id' =>  $period->id,
                        'room_id' => $room->id
                    ]);
                    
                    return  " program changed  to   " . $period->day->day . " " . $period->time ;
                }
                
                
            }
            
            // dump($in_program_arr);
            
            // return $in_program_arr[0];
            
            // return json_encode(...$in_program_arr);
            
        }
        
   }
   
   
   // Todo: student in refference time...
   public function updateSessionPeriodId(Period $period,Session $session, Room $room, Session $to_session){
    
        
        $all_programs = Unit::where('id', $session->unit_id)->with(
            'levelsInSession',
            'levelsInSession.program',           
        )->get()->map(function($item){
            return $item->levelsInSession->map(function($item){
                
                $units_lv_insession = new stdClass();
                $units_lv_insession->level_id = $item->id;
                $units_lv_insession->level = $item->level;
                $units_lv_insession->program_id = $item->program->id;
                $units_lv_insession->program_name = $item->program->name;
                $units_lv_insession->program_code = $item->program->program_code;
                
                return $units_lv_insession;
            });   
        });
        
        // return $all_programs;
        $programms_taking = json_decode(...$all_programs);
        // return $programms_taking;
        
        
        // $in_program_arr = $this->allTTObject(1);        
        // return $in_program_arr[0];
        
        $crash = false;
        
        $message = "";
        
        foreach($programms_taking as $in_program){            
            // dump( json_encode($in_program));
            
            //get all session being taken by associative programs
            $in_program_arr = $this->allTTObject($in_program->program_id);   
            
            // return $in_program_arr[0]; 
            
            //iter through the programs take sessoions check if period is already occupied
            foreach($in_program_arr[0] as $prg_obj){
                
                // echo nl2br( "Period is occupied By program " . $prg_obj->period_id ." " . $period->id . "\n") ;
            
               
                // echo nl2br( $prg_obj);
                if(  $prg_obj->period_id ==  $period->id){
                    $crash  = true;
                    
                    echo nl2br( "Period is occupied By program " . $prg_obj->period_id ." " . $period->id . "\n");
                    var_dump($crash);
                    // return "Period is occupied By program " . $prg_obj->period_id ." " . $period->id;
                    break;
                } else{
                    var_dump( $crash);
                    echo nl2br( "Period is occupied By program " . $prg_obj->period_id ." " . $period->id . "\n");
                    
                    // return  " program changed  to " . $period->day->day . " " . $period->time ;
                }
                
                
            }
            
            if($crash == true){
                $message =   "Period is occupied By program " . $prg_obj->period_id ." " . $period->id . "\n";
                break;
            }else{
                
                // HOW TO MOVE SESSIONS:
                
                
                // return  $session->lecture_id;
                // dd($session->lecture_id);
                
                // echo nl2br( $session->lecture_id);
               
                
                // $to_session->update([
                //     'period_id' =>  $period->id,
                //     'room_id' => $room->id,
                    
                //     // 'lecture_id' =>  $session->lecture_id,
                //     // 'unit_id' =>  $session->unit_id,
                // ]);
                
                
                // $session->update([
                //     'unit_id' => null,
                //     'lecture_id' => null
                // ]);
                
                $message =  "Session_lecturer: ". $session->lecture_id . " ". $session->unit_id;
                " program changed  to " . $period->day->day . " " . $period->time ;
                
                break;
            }
        
        }
        
        return $message;
        // view('TimetableHTML.free_periods.freesCLassTime', compact('message'));
        // $message;
        
        // if($crash){
        //     return  "Period is occupied By program " . $prg_obj->period_id ." " . $period->id . "\n"
        // }else{
        //     return  " program changed  to " . $period->day->day . " " . $period->time ;
        // }
        
    }
        
        
        
        // return $this->allTTObject(2);        
   
   public function allTTObject($program_id){
        $program_taking_unit = School::with(
           'programs',
           'programs.levels',
           'programs.levels.units',
           'programs.levels.units.sessions',
           'programs.levels.units.sessions.unit',
           'programs.levels.units.sessions.unit.levelsInSession',
           'programs.levels.units.sessions.period',
           'programs.levels.units.sessions.period.day'
            )->get()->map(function($item) use ($program_id) {
              return $item->programs->where('id', $program_id )->pluck('levels')->flatten()->map(function($item, $key){
                return $item->units->pluck('sessions')->flatten()->map(function($item){
                    //return new object....
                    
                    $programs = new stdClass();
                    $programs->period_id = $item->period_id;
                    $programs->levels = $item->unit->levelsInSession;
                    
                    return $programs;
                });
              });
        });
        
        return json_decode(...array($program_taking_unit[0]));
   }
   
   // Todo: room in refference time...
     
   
   
   //Re-Thinking IT...
   public function isSessionAssignedToLec(Session $session){
        return $session;
   }
   
   //TODO: if students are free...
   public function moveLecture($session, $to_session){
        $initial_session = Session::find($session);
        $to_session = Session::find($to_session);
        
        $lecturer_id = $initial_session->lecture_id;
        $period_id = $initial_session->period_id;
   
        
        // room enough
        if($initial_session->room->capacity > $to_session->room->capacity){
            return "Room is not Enough";
        };
        
        
        // $initial_session->room->capacity;
        // if($initial_session->room)
    
        //determine if lec is free
        $all_sesions_with_lecturers = Session::where('lecture_id', $lecturer_id)
                                        ->where('period_id', $period_id)->get(); 
                                
        if(count($all_sesions_with_lecturers) > 0 && $initial_session->period->time == $to_session->period->time){
            $message = "Lecturer not free at this time";
            return  $message;
            // "not_free" . $initial_session->period->time . "==". $to_session->period->time;
        }else{
            // Here "lec_is_free";
            //we move the session
            $initial_session_unit_id = $initial_session->unit_id;
            $initial_session_lecture_id= $initial_session->lecture_id;
            $initial_session_group = $initial_session->group;
            
            //update the to_sesion with init sesion ...params
            $to_session->update([
                'unit_id' => $initial_session_unit_id,
                'lecture_id' => $initial_session_lecture_id,
                'group' => $initial_session_group,
            ]);
            
            //release the init sesion
            $initial_session->update([
                'unit_id' => null,
                'lecture_id' => null,
                'group' => null,
            ]);
            
            $message = "Succefully moved lecture on " . $to_session->period->day->day . " at " . $to_session->period->time . " : Venue  " . $to_session->room->room_code . ".";
            return $message;   
            
        }
   }
   
   //room capacity..
   public function isRoomEnough(){
    
   }
   
   // Todo: lecture in refference time...
   public function isLecturerFree($lecturer, $period){
    // return $lecturer ;
    // return $period;
    // $all_sesions_with_lecturers = $lecturer->with('Session','Session.period','Session.period.day')->get();
   
                                
    // return response()->json($all_sesions_with_lecturers);
   }
   
   public function renderapiProgramTimetable(Request $request)
    {
        
        // return "request";
        
       return School::with(
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

        // foreach ($programs as $program){
        // $school_name = $program->school;
        // $program_name = $program->name;
        // $units = $program->levels
        //     ->map(function($level){
        //         $units = $level->units->each(function($unit) use ($level){
        //             $unit->level = $level->level;
        //         });
        //         $level->units = $units;
        //         return $level;
        //     })->pluck('units')->flatten()
        //     ->sortBy('level')
        //     ->groupBy('level');
            
        //     // dump($units);

        //      return view("TimetableHTML.program_timetable",['school'=> $school_name, 'program'=> $program_name, 'levels'=> $units]);

        // // foreach($units as $session){
        // //     $json_units = json_decode($session);
        // //     // dump($json_units[0]->sessions);
        // //     dump($json_units[0]->sessions[0]->unit);
        // // }
            
        // }
    }
   


}