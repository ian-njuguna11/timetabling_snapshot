<?php

namespace Timetabler\Jobs;

use Illuminate\Bus\Queueable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Support\Facades\App;
use Timetabler\Events\BroadcastSimpleMessage;
use Timetabler\Events\PDFGenerated;
use stdClass;
use Timetabler\Room;
use Timetabler\Session;

class GeneratePDFPerRoom implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    /**
     * Create a new job instance.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Execute the job.
     *
     * @return void
     */
    public function handle()
    {
       // $rooms = Room::with()
       $message = [
        "type"=> "timetable-generator",
        "message"=> "Generating pdf timetable for each rooms..."
        ];
        event(new BroadcastSimpleMessage(json_encode($message)));

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

        foreach ($rooms as $key=> $room){
            $timetable_hash_name = $key.".pdf";

            // md5($key.time()).

            $pdf = App::make('snappy.pdf.wrapper');
            $pdf->loadView('pdf.room_timetable', ['roomName'=> $key, 'rooms'=> $room]);
            $pdf->setPaper('A4', 'landscape')->setOption('margin-bottom', 10)->setOption('margin-top', 10);
            //$pdf->setOption('no-pdf-compression',true);
            //return
            $pdf->save("public/generated/rooms/".$timetable_hash_name, true);

            /*GeneratedDoc::create([
                "school_id"=> $program->school_id,
                "program_id"=> $program->id,
                "description"=> $timetable->description,
                "document_name"=> $timetable_hash_name
            ]);*/
        }
        
        $message = [
            "type"=> "timetable-generator",
            "message"=> "Room Documents Generated."
        ];
        event(new BroadcastSimpleMessage(json_encode($message)));

        event(new PDFGenerated());

    }
}
