<?php

namespace Timetabler\Console\Commands;

use Illuminate\Support\Facades\Redis;
use Illuminate\Console\Command;
use Timetabler\Program;

class SyncProgramsCommand extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'redis:sync-program';

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
        
        $prog_data = Program::all();
        foreach($prog_data as $prog){
            Redis::publish('sync-programs', json_encode([
                'id' => $prog->id,
                'name' => $prog->name,
                'semesters' => $prog->semesters,
                'years' => $prog->years,
                'program_code' => $prog->program_code,
                'school_id' => $prog->school_id,
                'deparment_ID' => $prog->deparment_ID,
            ]));
        }
    }
}
