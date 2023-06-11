<?php

namespace Timetabler\Console\Commands;

use Illuminate\Console\Command;
use Timetabler\Level;

use Illuminate\Support\Facades\Redis;

class SnycProgramLevels extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'redis:sync-program_levels';

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
        
        $_ = Level::all();
        
        foreach($_ as $__){
            Redis::publish('sync-program_levels', json_encode([
                'id' => $__->id,
                "program_id" => $__->program_id,
                "department_ID" => $__->program_id,	
                "semester_number" =>$__->semester_number,	
                "level" =>$__->level,
                "num_students" =>$__->num_students,
                "in_session" =>$__->in_session 
            ]));
        }
    }
}
