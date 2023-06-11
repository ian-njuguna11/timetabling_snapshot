<?php


namespace Timetabler\Timetable;

use Illuminate\Support\Collection;
use stdClass;
use Symfony\Component\Console\Output\ConsoleOutput;
use Timetabler\Jobs\SaveSession;
use Timetabler\Room;
use Timetabler\Session;
use Timetabler\Timetable;
use Timetabler\Unit;


trait GenerateV2{
    
    public function generateV2(){
        $rooms = Room::with('location')->get();

        $timetable = Timetable::with('days', 'days.periods')
            ->get()->last();
            
        $periods = $timetable->days->pluck('periods')->flatten()
            ->each(function($period) use($rooms){
                $period->levels = [];
                $period->available_rooms = $rooms->pluck('id')->flatten();
                $period->units = new Collection();
            });

        //dd($this->findRooms($periods, $rooms, null)->unique("period_id")->take(3));

        $units = Unit::with('levelsInSession')
            ->whereHas('levelsInSession')
            ->get()
            ->map(function($unit){
                $unit->total_num = $unit->levelsInSession->sum("num_students");
                return $unit;
            })->sortBy('total_num',SORT_REGULAR,true);

        //$unassigned_units = [];


        $units->each(function($unit) use ($periods, $rooms){

            // Get sorted by capacity available rooms for each period
            // All constraints are checked by the function
            $available_rooms = $this->findRooms($periods, $rooms, $unit->lab_type_id, $unit);

            $this->printLn("Found rooms: ".$available_rooms->count());
            if($available_rooms->count() == 0 || $unit->total_num == 0)
                return;

            // Get the room with the largest capacity
            $max_capacity = $available_rooms->first()->capacity;

            // Check if total number of students can fit any of the available rooms
            $groups = 1; // Default group number
            if($unit->total_num > $max_capacity){
                while(true){
                    ++$groups;
                    if(self::intdiv($unit->total_num, $groups) > $max_capacity){
                        continue;
                    }

                    break;
                }
            }

            $assigned_rooms = $available_rooms->where('capacity',
                '>=', self::intdiv($unit->total_num, $groups) )
                ->unique('period_id')->sortBy('capacity')->take($groups);

            $group = 'A';

            foreach ($assigned_rooms as $assigned_room){
                if($groups === 1){
                    $group = 'Non';
                }
                $this->addUnit($periods->where('id', $assigned_room->period_id)->first(),
                    $unit, $assigned_room->room_id, $group, $groups);

                $group++;
            }

            if(!is_null($unit->lab_type_id)){
                $this->assignLabs($periods, $rooms, $unit);
            }

        });

        $timetable->in_progress = false;
        $timetable->save();

        return;
    }
    
}