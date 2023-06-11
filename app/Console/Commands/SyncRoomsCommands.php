<?php

namespace Timetabler\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\Redis;
use Timetabler\Room;

class SyncRoomsCommands extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'redis:sync-rooms';

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
        
        // Full texts
        // id 	location_id 	room_code 	type 	
        // lab_type_id
        
        ini_set('memory_limit', '-1');
        
        $room_data = Room::all();
        
        foreach($room_data as $data){
            Redis::publish('sync-rooms', json_encode([
                "id" => $data->id,
                "location_id" => $data->location_id,
                "room_code" => $data->room_code,
                "type" => $data->type,
                "lab_type_id" => $data->lab_type_id,
                "capacity" => $data->capacity
            ]));  
        }
        
    }
}
