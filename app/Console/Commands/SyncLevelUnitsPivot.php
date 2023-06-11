<?php

namespace Timetabler\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\Redis;
use Timetabler\LevelUnits;

class SyncLevelUnitsPivot extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'redis:sync-level-units';

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
        
        $_ = LevelUnits::all();
        
        foreach($_ as $__){
           Redis::publish('sync-level-units', json_encode([
            "id" => $__->id,
            "unit_id" => $__->unit_id,
            "level_id" => $__->level_id,
            
           ]));
        }
        
    }
}
