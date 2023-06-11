<?php

namespace Timetabler\Jobs;

use Exception;
use Illuminate\Bus\Queueable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Timetabler\Events\BroadcastSimpleMessage;
use Timetabler\Events\GenerationFailed;
use Timetabler\Timetable;
use Timetabler\Timetable\TimetableGenerator;

class FillTimetable implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    public $timeout = 600;
    public $tries = 1;
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
        $message = [
            "type"=> "timetable-generator",
            "message"=> "Generating timetable..."
        ];
        event(new BroadcastSimpleMessage(json_encode($message)));

        TimetableGenerator::run();
    }

    public function failed(Exception $exception)
    {
        event(new GenerationFailed());
        $timetable = Timetable::with('days', 'days.periods')
            ->get()->last();
        $timetable->in_progress = false;
        $timetable->save();
    }
}
