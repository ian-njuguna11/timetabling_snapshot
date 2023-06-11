<?php

namespace Timetabler\Jobs;

use Illuminate\Bus\Queueable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Support\Facades\Redis;
use Timetabler\Program;

class SyncPrograms implements ShouldQueue
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
        ini_set('memory_limit', '-1');
        
        $prog_data = Program::all();
        foreach($prog_data as $prog){
            Redis::publish('sync-programs', json_encode([
                'id' => $prog->id,
                'name' => $prog->name,
                'semesters' => $prog->semesters,
                'years' => $prog->years,
                'program_code' => $prog->program_code,
                'school_id' => $prog->school_id,
                'deparment_ID' => $prog->deparment_ID,
            ]));
            
            echo "Program " .$prog->name . PHP_EOL;
            
        }
    }
}
