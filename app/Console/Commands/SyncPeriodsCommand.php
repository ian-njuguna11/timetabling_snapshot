<?php

namespace Timetabler\Console\Commands;

use Illuminate\Console\Command;
use Timetabler\Period;

use Illuminate\Support\Facades\Redis;

class SyncPeriodsCommand extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'redis:sync-periods';

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
        $period_data = Period::all();
        
        
        // day_id 	time 	id 	 	
        foreach($period_data as $data){
            Redis::publish('sync-periods',json_encode([
                "id" => $data->id,
                "day_id" => $data->day_id,
                "time" => $data->time
            ]));
        }
        
        
    }
}

