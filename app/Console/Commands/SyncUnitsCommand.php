<?php

namespace Timetabler\Console\Commands;

use Illuminate\Support\Facades\Redis;


use Illuminate\Console\Command;
use Timetabler\Unit;

class SyncUnitsCommand extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'redis:sync-units';

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
        }
    }
}
