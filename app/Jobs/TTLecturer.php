<?php

namespace Timetabler\Jobs;

use Illuminate\Bus\Queueable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Support\Facades\Artisan;
use Timetabler\Console\Commands\redis as tt_lecturer;

use Illuminate\Support\Facades\Redis;
use Timetabler\Lectures;
use Timetabler\Room;

class TTLecturer implements ShouldQueue
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
	    // # id 	first_name 	last_name 	deparment_ID 	is_HOD 	email
        
        $lc = Lectures::all();
        foreach($lc as $lec){
            Redis::publish('tt-lecturer', json_encode([
                'id' => $lec->id,
                'name' => $lec->first_name ." ". $lec->last_name,
                'department' => $lec->deparment_ID,
                'isHod' => $lec->is_HOD,
                'email' => $lec->email,
            ]));       
            
            echo $lec->first_name ." ". $lec->last_name . PHP_EOL;
            
        }
    }
}
