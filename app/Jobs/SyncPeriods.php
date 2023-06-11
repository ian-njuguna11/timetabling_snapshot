<?php

namespace Timetabler\Jobs;

use Illuminate\Bus\Queueable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Support\Facades\Redis;
use Timetabler\Period;

class SyncPeriods implements ShouldQueue
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
        //
        
        $period_data = Period::all();
        
        
        // day_id 	time 	id 	 	
        foreach($period_data as $data){
            Redis::publish('sync-periods',json_encode([
                "id" => $data->id,
                "day_id" => $data->day_id,
                "time" => $data->time
            ]));
            
            echo "Syncing Periods: time: " . $data->time . PHP_EOL;
            
        }
        
    }
}
