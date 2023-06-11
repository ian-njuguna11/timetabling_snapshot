<?php

namespace Timetabler\Console\Commands;

use Illuminate\Support\Facades\Redis as red;


use Illuminate\Console\Command;
use Illuminate\Support\Facades\Artisan;
use Timetabler\Lectures;

use GuzzleHttp\Client;

class redis extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'redis:pub';

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
        ini_set('memory_limit', '-1');
	    // # id 	first_name 	last_name 	deparment_ID 	is_HOD 	email
        
        $lc = Lectures::all();
        foreach($lc as $lec){
            red::publish('tt-lecturer', json_encode([
                'id' => $lec->id,
                'name' => $lec->first_name ." ". $lec->last_name,
                'department' => $lec->deparment_ID,
                'isHod' => $lec->is_HOD,
                'email' => $lec->email,
            ]));   
            
            echo  $lec->first_name ." ". $lec->last_name . PHP_EOL;        
        }
            
        // Create a client with a base URI
        
    }
}
