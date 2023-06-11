<?php

namespace Timetabler\Events;

use Illuminate\Broadcasting\Channel;
use Illuminate\Queue\SerializesModels;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Broadcasting\PresenceChannel;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;
use Timetabler\Timetable;

class TimetableCreated
{
    use Dispatchable, InteractsWithSockets, SerializesModels;

    public $timetable;

    public $tries = 1;
    /**
     * Create a new event instance.
     *
     * @return void
     */
    public function __construct(Timetable $timetable)
    {
        $this->timetable = $timetable;
        //
    }

    /**
     * Get the channels the event should broadcast on.
     *
     * @return Channel|array
     */
    public function broadcastOn()
    {
        return new PrivateChannel('channel-name');
    }
}
