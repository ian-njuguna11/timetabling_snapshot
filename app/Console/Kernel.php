<?php

namespace Timetabler\Console;

use Illuminate\Console\Scheduling\Schedule;
use Illuminate\Foundation\Console\Kernel as ConsoleKernel;
use Timetabler\Console\Commands\AttendanceDbGrooming;

class Kernel extends ConsoleKernel
{
    /**
     * The Artisan commands provided by your application.
     *
     * @var array
     */
    protected $commands = [
        Commands\redis::class,
        Commands\SyncSessionsCommand::class,
        Commands\SyncProgramsCommand::class,
        Commands\SyncUnitsCommand::class,
        Commands\SyncRoomsCommands::class,
        Commands\SyncPeriodsCommand::class,
        Commands\SyncDaysCommand::class,
        Commands\SnycProgramLevels::class,
        Commands\SyncLevelUnitsPivot::class,
        AttendanceDbGrooming::class
    ];

    /**
     * Define the application's command schedule.
     *
     * @param  \Illuminate\Console\Scheduling\Schedule  $schedule
     * @return void
     */
    protected function schedule(Schedule $schedule)
    {
        // $schedule->command('inspire')
        //          ->hourly();
    }

    /**
     * Register the Closure based commands for the application.
     *
     * @return void
     */
    protected function commands()
    {
        require base_path('routes/console.php');
    }
}
