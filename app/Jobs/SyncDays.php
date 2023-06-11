<?php

namespace Timetabler\Jobs;

use Illuminate\Bus\Queueable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Support\Facades\Redis;
use Timetabler\TimetableDay;

class SyncDays implements ShouldQueue
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
        $_ = TimetableDay::all();
        foreach($_ as $data){
            Redis::publish('sync-days', json_encode([
                'id' => $data->id,
                'timetable_id' => $data->timetable_id,
                'day' => $data->day,
                'period_length' => $data->period_length
            ]));
            
            echo 'Day' . $data->day . PHP_EOL;
            
        }
    }
}
