<?php

namespace Timetabler\Jobs;

use Illuminate\Bus\Queueable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Support\Facades\Redis;
use Timetabler\LevelUnits;

class SyncLevelUnitsPivot implements ShouldQueue
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
        
         $_ = LevelUnits::all();
        
         foreach($_ as $__){
            Redis::publish('sync-level-units', json_encode([
             "id" => $__->id,
             "unit_id" => $__->unit_id,
             "level_id" => $__->level_id,
             
            ]));
            
            echo "Syncing Level Units Pivot: ... " . PHP_EOL;
            
         }
    }
}
