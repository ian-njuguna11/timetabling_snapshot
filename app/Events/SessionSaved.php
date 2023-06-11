<?php

namespace Timetabler\Events;

use Illuminate\Broadcasting\Channel;
use Illuminate\Queue\SerializesModels;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Broadcasting\PresenceChannel;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;
use Timetabler\Session;

class SessionSaved implements ShouldBroadcast
{
    use Dispatchable, InteractsWithSockets, SerializesModels;


    public $session;
    /**
     * Create a new event instance.
     *
     * @return void
     */
    public function __construct(Session $session)
    {
        //
        $this->session = Session::with('period', 'unit', 'room', 'period.day')
            ->where('id', $session->id)
            ->first();
    }

    /**
     * Get the channels the event should broadcast on.
     *
     * @return \Illuminate\Broadcasting\Channel|array
     */
    public function broadcastOn()
    {
        return new PrivateChannel('messages');
    }
}
