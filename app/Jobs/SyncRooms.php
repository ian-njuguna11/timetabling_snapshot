<?php

namespace Timetabler\Jobs;

use Illuminate\Bus\Queueable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Support\Facades\Redis;
use Timetabler\Room;

class SyncRooms implements ShouldQueue
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
            
            echo "Room code " .$data->room_code . PHP_EOL; 
        }
        
    }
}
