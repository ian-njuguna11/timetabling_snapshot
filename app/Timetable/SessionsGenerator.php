<?php
/**
 * Created by PhpStorm.
 * User: kshem
 * Date: 3/27/19
 * Time: 9:15 AM
 */

namespace Timetabler\Timetable;


use InvalidArgumentException;
use Timetabler\Room;
use Timetabler\Session;
use Timetabler\Unit;

class SessionsGenerator
{
    /*
     * We need to create sessions first before we can organize them in a timetable.
     * A session is composed of a unique unit, room and group.
     * A group is the students taking a given unit. If the number of students taking a
     * given unit is greater than the largest room available they will be split into
     * different groups.
     * */

    public static function createSession($period){
        Room::all()->each(function($room) use($period){
            $session = Session::create(["room_id"=> $room->id, "period_id"=> $period->id]);
        });
    }
}