<?php

namespace Timetabler\Console\Commands;

use Timetabler\Session;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\Redis;

class SyncSessionsCommand extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'redis:sync-session';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return mixed
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
        }
        
        
    }
}
