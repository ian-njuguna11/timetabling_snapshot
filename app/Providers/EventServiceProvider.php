<?php

namespace Timetabler\Providers;

use Illuminate\Support\Facades\Event;
use Illuminate\Foundation\Support\Providers\EventServiceProvider as ServiceProvider;

class EventServiceProvider extends ServiceProvider
{
    /**
     * The event listener mappings for the application.
     *
     * @var array
     */
    protected $listen = [
        'Timetabler\Events\Event' => [
            'Timetabler\Listeners\EventListener',
        ],'Timetabler\Events\TimetableCreated' => [
            'Timetabler\Listeners\TimetableCreatedListener',
        ],
        
        
    ];

    /**
     * Register any events for your application.
     *
     * @return void
     */
    public function boot()
    {
        parent::boot();

        //
    }
}
