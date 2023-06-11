<?php

namespace Timetabler\Jobs;

use Illuminate\Bus\Queueable;
use Illuminate\Http\Request;
use Illuminate\Queue\SerializesModels;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Timetabler\Events\BroadcastSimpleMessage;
use Timetabler\Events\GenerationFailed;
use Timetabler\Timetable;
use Timetabler\Timetable\TimetableGenerator;
use Timetabler\TimetableDay;

class GenerateTimetable implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    public $timeout = 600;
    public $tries = 1;

    protected $request;
    /**
     * Create a new job instance.
     *
     * @return void
     */
    public function __construct($request)
    {
        //
        $this->request = (object) $request;
    }

    /**
     * Execute the job.
     *
     * @return void
     */
    public function handle()
    {
        $request = $this->request;

        $message = [
            "type"=> "timetable-generator",
            "message"=> "Preparing data..."
        ];
        event(new BroadcastSimpleMessage(json_encode($message)));

        $timetable = Timetable::create(["description"=> $request->description]);

        if(!$timetable){
            //$timetable->periods = $request->periods;
            //dispatch(new CreateTimetableDay($timetable, $request->periods));
            //event(new TimetableCreated($timetable));

            event(new GenerationFailed());
            return;
        }

        $timetable->in_progress = true;
        $timetable->save();

        $periods = json_decode($request->periods);

        if(isset($request->mon)){
            //dd(array_keys((array)$periods->periods_mon));

            $day = TimetableDay::create(["day"=>"Monday", "timetable_id"=> $timetable->id]);

            if($day){
                foreach ($periods->periods_mon as $period){
                    dispatch(new CreatePeriods($day->id, $period->time));
                }
            }

        }

        if(isset($request->tue)){
            $day = TimetableDay::create(["day"=>"Tuesday", "timetable_id"=> $timetable->id]);

            if($day){
                foreach ($periods->periods_tue as $period){
                    dispatch(new CreatePeriods($day->id, $period->time));
                }
            }
        }
        if(isset($request->wed)){
            $day = TimetableDay::create(["day"=>"Wednesday", "timetable_id"=> $timetable->id]);

            if($day){
                foreach ($periods->periods_wed as $period){
                    dispatch(new CreatePeriods($day->id, $period->time));
                }
            }
        }
        if(isset($request->thur)){
            $day = TimetableDay::create(["day"=>"Thursday", "timetable_id"=> $timetable->id]);

            if($day){
                foreach ($periods->periods_thur as $period){
                    dispatch(new CreatePeriods($day->id, $period->time));
                }
            }
        }
        if(isset($request->fri)){
            $day = TimetableDay::create(["day"=>"Friday", "timetable_id"=> $timetable->id]);

            if($day){
                foreach ($periods->periods_fri as $period){
                    dispatch(new CreatePeriods($day->id, $period->time));
                }
            }
        }
        if(isset($request->sat)){
            $day = TimetableDay::create(["day"=>"Saturday", "timetable_id"=> $timetable->id]);

            if($day){
                foreach ($periods->periods_sat as $period){
                    dispatch(new CreatePeriods($day->id, $period->time));
                }
            }
        }
    }
}
