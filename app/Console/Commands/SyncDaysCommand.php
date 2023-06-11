<?php

namespace Timetabler\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\Redis;
use Timetabler\TimetableDay;

class SyncDaysCommand extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'redis:sync-days';

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
        $_ = TimetableDay::all();
        foreach($_ as $data){
            Redis::publish('sync-days', json_encode([
                'id' => $data->id,
                'timetable_id' => $data->timetable_id,
                'day' => $data->day,
                'period_length' => $data->period_length
            ]));
        }
    }
}
