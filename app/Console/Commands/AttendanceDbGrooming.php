<?php

namespace Timetabler\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\Redis;


class AttendanceDbGrooming extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'redis:att-grooming';

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
        Redis::publish('att-grooming', json_encode([
            "grooming" => true,
        ]));
        
    }
}
