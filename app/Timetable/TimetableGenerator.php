<?php
/**
 * Created by PhpStorm.
 * User: kshem
 * Date: 3/31/19
 * Time: 3:35 PM
 */

namespace Timetabler\Timetable;


use Illuminate\Support\Collection;
use stdClass;
use Symfony\Component\Console\Output\ConsoleOutput;
use Timetabler\Jobs\SaveSession;
use Timetabler\Room;
use Timetabler\Session;
use Timetabler\Timetable;
use Timetabler\Unit;

class TimetableGenerator
{
    
    use GenerateV2;
    
    public function __construct()
    {
        $this->console = new ConsoleOutput();
    }

    public static function run(){
        $generator = new TimetableGenerator();
        echo "New instance started";
        return $generator->generateV2();
    }

    private function canAddUnit($period, $unit, $room_id){
        if($period->units->contains('id', $unit->id) ||
            $period->units->contains('room_id', $room_id)){
            return false;
        }
        $levels = $unit->levelsInSession->pluck('id')->flatten()->toArray();
        if(count(array_intersect($levels, $period->levels)) > 0){
            return false;
        }

        if($period->units->count() >= $period->sessions->count()){
            return false;
        }

        return true;
    }

    private function getAvailableRooms($period, $rooms){
        $occupied_rooms = $period->units->pluck('room_id')->flatten()->toArray();
        $available_rooms = $rooms->whereNotIn('id', $occupied_rooms);
        return $available_rooms;
    }

    private function addUnit($period, $unit, $room_id, $group, $num_groups = 1){
        if($this->canAddUnit($period, $unit, $room_id)){ // Perform an additional check to ensure all the constraints are passed
            $unit->room_id = $room_id;
            $unit->group = $group;
            $period->units->push($unit);
            $period->available_rooms = $period->available_rooms->diff($room_id);
            $period->levels = array_merge($period->levels,
                $unit->levelsInSession->pluck('id')->flatten()->toArray());

            $data = [
                "period_id"=> $period->id,
                "room_id"=> $room_id,
                "unit_id"=> $unit->id,
                "group"=> $group,
                "groups"=> $num_groups
            ];
            dispatch(new SaveSession(json_encode($data)));

            $this->printLn("Added $unit->name, Group $group, Room $room_id, Period $period->id");
            return true;
        }

        return false;
    }

    private function findRooms(Collection $periods, Collection $rooms, $lab_type, $unit){
        $available_rooms = new Collection();
        foreach ($periods as $period){

           $rooms->whereIn('id', $period->available_rooms)
                ->where('lab_type_id', null)
                ->whereIn('location_id', $unit->locations())
                ->each(function($room) use($period, $available_rooms, $unit){

                   if(!is_null($unit) && $this->canAddUnit($period, $unit, $room->id)){
                       $room_desc = new stdClass();
                       $room_desc->capacity = $room->capacity;
                       $room_desc->period_id = $period->id;
                       $room_desc->room_id = $room->id;

                       $available_rooms->push($room_desc);
                   }
                });
                /*->sortBy('capacity',SORT_REGULAR,true)
                ->groupBy('capacity');*/

            //$available_rooms = $available_rooms->merge($compatible_rooms);
        }

        return $available_rooms->sortBy('capacity',SORT_REGULAR,true);
    }

    private function findLabs(Collection $periods, Collection $rooms, $lab_type, $unit){
        $available_rooms = new Collection();
        foreach ($periods as $period){

            $rooms->whereIn('id', $period->available_rooms)
                ->where('lab_type_id', $lab_type)
                ->whereIn('location_id', $unit->locations())
                ->each(function($room) use($period, $available_rooms, $unit){

                    if(!is_null($unit) && $this->canAddUnit($period, $unit, $room->id)){
                        $room_desc = new stdClass();
                        $room_desc->capacity = $room->capacity;
                        $room_desc->period_id = $period->id;
                        $room_desc->room_id = $room->id;

                        $available_rooms->push($room_desc);
                    }
                });
            /*->sortBy('capacity',SORT_REGULAR,true)
            ->groupBy('capacity');*/

            //$available_rooms = $available_rooms->merge($compatible_rooms);
        }

        return $available_rooms->sortBy('capacity',SORT_REGULAR,true);
    }

    private function assignLabs(Collection $periods, Collection $rooms, $unit){
        $available_labs = $this->findLabs($periods, $rooms, $unit->lab_type_id, $unit);

        if($available_labs->count() == 0)
            return;

        // Get the room with the largest capacity
        $max_capacity = $available_labs->first()->capacity;

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

        $assigned_labs = $available_labs->where('capacity',
            '>=', self::intdiv($unit->total_num, $groups) )
            ->unique('period_id')->sortBy('capacity')->take($groups);

        $group = 'A';

        foreach ($assigned_labs as $assigned_lab){
            if($groups === 1){
                $group = 'Non';
            }
            $this->addUnit($periods->where('id', $assigned_lab->period_id)->first(),
                $unit, $assigned_lab->room_id, $group, $groups);

            $group++;
        }
    }


    private function getRoom($capacity){

    }

    public function generate(){
        $units = Unit::with('levelsInSession')
            ->whereHas('levelsInSession')
            ->get();
        $sorted_units = $units->map(function($unit){
            $unit->total_num = $unit->levelsInSession->sum("num_students");
            return $unit;
        })->sortBy('total_num',SORT_REGULAR,true);

        $sessions = Timetable::with('days', 'days.periods', 'days.periods.sessions')
            ->get()->last()
            ->days->pluck('periods')->flatten()
            ->pluck('sessions')->flatten()
            ->sortBy('room.capacity', SORT_REGULAR,true)
            ->groupBy('room.capacity')->map(function($group){
                    return $group->unique('period.id');
                });

        $sorted_units->each(function($unit){

            $this->printLn("Current unit: $unit->name");
            /*$rooms = Room::with('unoccupiedSessions',
                'unoccupiedSessions.period',
                'unoccupiedSessions.period.occupiedSessions')
                ->whereHas("unoccupiedSessions")
                ->where('lab_type_id', $unit->lab_type_id)
                ->get();*/

            $this->printLn("Checking unoccupied session");
            $unoccupied_sessions = Timetable::with('days', 'days.periods', 'days.periods.sessions',
                'days.periods.unoccupiedSessions',
                'days.periods.unoccupiedSessions.period'
                )
                ->whereHas("days.periods.unoccupiedSessions")
                ->get()->last()
                ->days->pluck('periods')->flatten()
                ->pluck('unoccupiedSessions')->flatten()
                ->where('room.lab_type_id', $unit->lab_type_id)
                ->sortBy('room.capacity', SORT_REGULAR,true)
                ->groupBy('room.capacity')->map(function($group) use($unit){
                    return $group->unique('period.id')->map(function($session) use($unit){
                        $session->period->levels = $session->period->levelsAssignedSessions();
                        if($unit->levelsInSession->whereIn('id', $session->period->levels)->count() > 0)
                            return null;
                        return $session;
                    })->filter();
                });

            $this->printLn("Done");

            // Sort from largest to the smallest
            /*$sorted_and_grouped = $unoccupied_sessions
                ->sortBy('room.capacity', SORT_REGULAR,true)
                ->groupBy('room.capacity')
                ->map(function($group){
                    return $group->unique('period.id');
                });*/

            $this->printLn("Grouping");

            foreach ($unoccupied_sessions as $key=>$grouped_sessions){
                $total_num_sessions = self::intdiv($unit->total_num, $key + 1) + 1;

                if($grouped_sessions->count() < $total_num_sessions){
                    //$this->printLn("continuing");
                    continue;
                }

                $group = 'A';
                $assigned_sessions = $grouped_sessions->random($total_num_sessions);
                foreach ($assigned_sessions as $assigned_session){
                    $assigned_session->unit_id = $unit->id;
                    $assigned_session->group = $group;
                    $assigned_session->save();

                    $this->printLn("Assigned Group $group");

                    $group++;
                }

                //$this->printLn("Breaking");
                break;
            }
            $this->printLn("Done grouping");
        });
    }

    private static function intdiv($a, $b){
        return ($a - $a % $b) / $b;
    }

    private function printLn($message){
        $this->console->writeln($message);
    }
    
    public static function addSession(Session $session){
        $periods = Timetable::with('days', 'days.periods', 'days.periods.sessions',
            'days.periods.sessions.unit', 'days.periods.sessions.unit.levelsInSession')
            ->get()->last()
            ->days->pluck('periods')->flatten();

        $assigned_period = null;
        foreach ($periods as $period){
            $sessions = $period->sessions;

            // We need to check if the session students have another session at the same time
            $exists = false;
            //$period_levels = [];

            $period_levels = $sessions->pluck('unit')->flatten()
                ->pluck('levelsInSession')->flatten()
                ->pluck('id')->toArray();
            //echo var_dump();

            /*foreach ($sessions as $period_session){
                $levels = Unit::with("levelsInSession")
                    ->where('id', $period_session->unit_id)->first()
                    ->levelsInSession->pluck('id')->toArray();
                array_merge($period_levels, $levels);
            }*/

            $session_levels = Unit::with("levelsInSession")
                ->where('id', $session->unit_id)->first()
                ->levelsInSession->pluck('id')->toArray();

            //self::printLn(dd($period_levels));
            if(count($period_levels) != 0 && count(array_intersect($period_levels, $session_levels)) > 0)
                $exists = true;

            if($exists || count($sessions->where('unit_id', $session->unit_id)) != 0 ||
                count($sessions->where('room_id',  $session->room_id)) != 0 ){
                continue;
            }
            $assigned_period = $period;
            break;
        }

        if($assigned_period == null){
            return;
        }

        $session->period_id = $assigned_period->id;
        $session->save();
        
        // .... event publish.......
        
        
       
    }
    
}