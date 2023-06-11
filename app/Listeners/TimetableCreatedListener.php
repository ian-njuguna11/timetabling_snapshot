<?php

namespace Timetabler\Listeners;

use Symfony\Component\Console\Output\ConsoleOutput;
use Timetabler\Events\TimetableCreated;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use Timetabler\Timetable;

class TimetableCreatedListener implements ShouldQueue
{

    use InteractsWithQueue;

    /**
     * Create the event listener.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Handle the event.
     *
     * @param  TimetableCreated  $event
     * @return void
     */
    public function handle(TimetableCreated $event)
    {
        //$console = new ConsoleOutput();
        //$console->printLn(dd($event));

        var_dump($event);
    }
}
