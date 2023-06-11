<?php

namespace Timetabler\Jobs;

use Illuminate\Bus\Queueable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Timetabler\Events\BroadcastSimpleMessage;
use Timetabler\Events\TimetableGenerated as OnComplete;

class TimetableGenerated implements ShouldQueue
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
        $message = [
            "type"=> "timetable-generator",
            "message"=> "Timetable generated..."
        ];
        event(new BroadcastSimpleMessage(json_encode($message)));
        //event(new OnComplete());
        
    }
}
