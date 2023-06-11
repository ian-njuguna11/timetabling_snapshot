<?php

namespace Timetabler\Jobs;

use Illuminate\Bus\Queueable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Support\Facades\Redis;
use Timetabler\Unit;

class SyncUnits implements ShouldQueue
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
        
        $unit_data = Unit::all();
        
	// id 	
    // code 	name 	lecture_hours
    // department_ID 	lecturer_id 	lab_hours 	
    // lab_type_id 
    // related_to 	
         
        foreach($unit_data as $data){
            Redis::publish('sync-units', json_encode([
                "id" => $data->id,
                "code" => $data->code,
                "name" => $data->name,
                "lecture_hours" => $data->lecture_hours,
                "department_ID" => $data->department_ID,
                "lecturer_id" => $data->lecturer_id,
                "lab_hours" => $data->lab_hours,
                "lab_type_id" => $data->lab_type_id,
                "related_to" => $data->related_to,
            ])); 
            
            echo "Unit " . $data->code. PHP_EOL;
            
        }
        
        
    }
    
}
