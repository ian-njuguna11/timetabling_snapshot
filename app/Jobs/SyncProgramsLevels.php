<?php

namespace Timetabler\Jobs;

use Illuminate\Bus\Queueable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Support\Facades\Redis;
use Timetabler\Level;

class SyncProgramsLevels implements ShouldQueue
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
        $_ = Level::all();
        
        foreach($_ as $__){
            Redis::publish('sync-program_levels', json_encode([
                'id' => $__->id,
                "program_id" => $__->program_id,
                "department_ID" => $__->program_id,	
                "semester_number" =>$__->semester_number,	
                "level" =>$__->level,
                "num_students" =>$__->num_students,
                "in_session" =>$__->in_session 
            ]));
            
            echo "Program Level Number of  students " . $__->num_students . PHP_EOL;
            
        }
    }
}
