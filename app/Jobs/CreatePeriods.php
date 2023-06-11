<?php

namespace Timetabler\Jobs;

use Illuminate\Bus\Queueable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Timetabler\Period;

class CreatePeriods implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    protected $day;
    protected $period;
    /**
     * Create a new job instance.
     *
     * @return void
     */
    public $tries = 1;
    public function __construct($day, $period)
    {
        //
        $this->day = $day;
        $this->period = $period;
    }

    /**
     * Execute the job.
     *
     * @return void
     */
    public function handle()
    {
        Period::create(["time"=> $this->period, "day_id"=> $this->day]);
    }
}
