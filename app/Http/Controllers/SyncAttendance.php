<?php

namespace Timetabler\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Artisan;
use Timetabler\Console\Commands\SyncLevelUnitsPivot;
use Timetabler\Jobs\AttendanceDbGrooming;
use Timetabler\Jobs\SynAttendance as sa;
use Timetabler\Jobs\SyncDays;
use Timetabler\Jobs\SyncLevelUnitsPivot as JobsSyncLevelUnitsPivot;
use Timetabler\Jobs\SyncPeriods;
use Timetabler\Jobs\SyncPrograms;
use Timetabler\Jobs\SyncProgramsLevels;
use Timetabler\Jobs\SyncRooms;
use Timetabler\Jobs\SyncSessions;
use Timetabler\Jobs\SyncUnits;
use Timetabler\Jobs\TTLecturer;

class SyncAttendance extends Controller
{
    
    
    
    
    // function appCall()
    // {
    //     $this->attendanceDbGrooming(); 
    //     sleep(5);
        
    //     // //1
    //     $this->SyncPrograms();
    //     sleep(5);
        
        
        
    //     //2
    //     $this->SyncProgramsLevels();
    //     sleep(5);
        
        
    //     //3
    //     $this->SyncUnits();
    //     sleep(5);
        
        
    //     //4
    //     $this->JobsSyncLevelUnitsPivot();
    //     sleep(5);
        
        
    //     //6       
    //     $this->SyncDays();
    //     sleep(5);
        
        
        
    //     //5
    //     $this->TTLecturer();
    //     sleep(5);
        
        
    //     //7        
    //     $this->SyncPeriods();
    //     sleep(5);
        
        

    //     //8
    //     $this->SyncRooms();
    //     sleep(5);
        
        
        
        
    //     $this->sessions();
        
    //     sleep(5);
        
    //     return back()->with('info', 'Timetable Synced Successfully');
    // }
    
    
    public function appCall()
    {
        # code...
        
        // sa::withChain([
        //     new TTLecturer,
        //     new SyncDays,
        //     new SyncUnits,
        //     new SyncPrograms,
        //     new SyncProgramsLevels,
        //     new SyncRooms,
        //     new SyncPeriods,
        //     new JobsSyncLevelUnitsPivot,
        //     new SyncSessions
        // ])->dispatch()->delay(5);
        
        sa::dispatch();
        AttendanceDbGrooming::dispatch()->delay(2);
        TTLecturer::dispatch()->delay(4);
        SyncDays::dispatch()->delay(6);
        SyncUnits::dispatch()->delay(8);
        SyncPrograms::dispatch()->delay(10);
        SyncRooms::dispatch()->delay(12);
        SyncPeriods::dispatch()->delay(14);
        SyncProgramsLevels::dispatch()->delay(16);
        JobsSyncLevelUnitsPivot::dispatch()->delay(18);
        SyncSessions::dispatch()->delay(20);
        
        return back()->with('info', 'Timetable Synced Successfully');        
    }
    
    function attendanceDbGrooming()
    {
    //    AttendanceDbGrooming::dispatch();
        Artisan::call('redis:att-grooming');
    }
    
    
    // function sync(){
    //     sa::withChain([
    //        new TTLecturer,
    //        new SyncDays,
    //        new SyncUnits,
    //        sleep(5),
    //        new SyncPrograms,
    //        new SyncProgramsLevels,
    //        new SyncRooms,
    //        new SyncPeriods,
    //        new JobsSyncLevelUnitsPivot,
    //     ])->dispatch();
    // }
    
    function TTLecturer(){
        // TTLecturer::dispatch(); 
        Artisan::call('redis:pub');
        
        
    }
    
    function SyncDays(){
        // SyncDays::dispatch();
        Artisan::call('redis:sync-days');
    }
    
    function SyncUnits(){
        // SyncUnits::dispatch();
        Artisan::call('redis:sync-units');
    }
    
    function SyncPrograms(){
        // SyncUnits::dispatch(); 
        Artisan::call('redis:sync-program');
    }
    
    function SyncProgramsLevels(){
        // SyncProgramsLevels::dispatch();
        Artisan::call('redis:sync-program_levels');
    }
    
    function SyncRooms(){
        SyncRooms::dispatch();
    }
    
    function SyncPeriods(){
        // SyncPeriods::dispatch();
        Artisan::call('redis:sync-periods');
        
        
    }
    
    
    function JobsSyncLevelUnitsPivot(){
        // JobsSyncLevelUnitsPivot::dispatch();
        Artisan::call('redis:sync-level-units ');
    }
    
    function sessions()
    {
        // SyncSessions::dispatch();
        Artisan::call('redis:sync-session');
    }
    
}
