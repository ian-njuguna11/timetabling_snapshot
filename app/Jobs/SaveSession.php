<?php

namespace Timetabler\Jobs;

use Illuminate\Bus\Queueable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Timetabler\Events\SessionSaved;
use Timetabler\Session;

class SaveSession implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    /**
     * Create a new job instance.
     *
     * @return void
     */
    protected $data;
    public function __construct($data)
    {
        //
        $this->data = json_decode($data);
    }

    /**
     * Execute the job.
     *
     * @return void
     */
    public function handle()
    {
        //
        $unit_id = $this->data->unit_id;
        $period_id = $this->data->period_id;
        $room_id = $this->data->room_id;
        $group = $this->data->group;
        $groups = $this->data->groups;

        //echo "$period_id, $room_id, $unit_id, $group";

        $session = Session::where('period_id', $period_id)
            ->where('room_id', $room_id)
            ->first();

        $session->unit_id = $unit_id;
        $session->group = $group;
        $session->groups = $groups;
        $session->save();

        event(new SessionSaved($session));
    }
}
