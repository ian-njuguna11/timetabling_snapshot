<?php

namespace Timetabler\Jobs;

use Illuminate\Bus\Queueable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Support\Facades\Redis;
use Timetabler\Session;

class SyncSessions implements ShouldQueue
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
        ini_set('memory_limit', '-1');
        $session_data = Session::all();
        
# period_id 	unit_id 	lecture_id 	room_id 	group 	groups 	created_at 	updated_at 	
        
        foreach($session_data as $session){
            Redis::publish('sync-sessions', json_encode([
                "id" => $session->id,
                "period_id" => $session->period_id,
                "unit_id" => $session->unit_id,
                "lecture_id" => $session->lecture_id,
                "room_id" => $session->room_id,
                "group" => $session->group,
                "groups" => $session->groups,
            ]));    
            
            echo "Syncing sessions ....." . PHP_EOL;
            
        }
    }
}
