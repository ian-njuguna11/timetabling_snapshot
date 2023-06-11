
<div class="col-md-10">
    <h4>{{$school}}</h4>
    <h5>{{$program}}</h5>
    @foreach($levels as $level => $units)
        <h5>{{$level}}</h5>
        <table class="table">
            <thead>
            <tr>
                <th>Day</th>
                <th>Time</th>
                <th>Unit</th>
                <th>Room</th>
                {{-- <th>Room Capacity</th> --}}
                <th>Group</th>
                {{-- <th>No. of students</th> --}}
                <th>Programs</th>
            </tr>
            </thead>
            <tbody>
            @foreach($units->pluck('sessions')->flatten()->where('period.day.day', "Monday")->sortBy('period.time') as $session)
                <tr>
                    <td>Monday</td>
                    <td>{{$session->period->time}}</td>
                    <td>{{$session->unit->code}} {{is_null($session->room->lab_type_id) ? '': '(practical)'}}</td>
                    <td>{{$session->room->room_code}}</td>
                    {{-- <td>{{$session->room->capacity}}</td> --}}
                    <td>{{$session->group === 'Non' ? '' : $session->group}}</td>
                    {{-- <td>{{($session->unit->levelsInSession->sum("num_students") - $session->unit->levelsInSession->sum("num_students") % $session->groups)/ $session->groups}}</td> --}}
                    <td>
                        @foreach($session->unit->levelsInSession as $key=>$level)
                            @if($key == 0)
                                {{$level->program->program_code}}
                            @else
                                {{"/ ".$level->program->program_code}}
                            @endif
                        @endforeach
                    </td>
                </tr>
            @endforeach
            @foreach($units->pluck('sessions')->flatten()->where('period.day.day', "Tuesday")->sortBy('period.time') as $session)
                <tr>
                    <td>Tuesday</td>
                    <td>{{$session->period->time}}</td>
                    <td>{{$session->unit->code}} {{is_null($session->room->lab_type_id) ? '': '(practical)'}}</td>
                    <td>{{$session->room->room_code}}</td>
                    {{-- <td>{{$session->room->capacity}}</td> --}}
                    <td>{{$session->group === 'Non' ? '' : $session->group}}</td>
                    {{-- <td>{{($session->unit->levelsInSession->sum("num_students") - $session->unit->levelsInSession->sum("num_students") % $session->groups)/ $session->groups}}</td> --}}
                    <td>
                        @foreach($session->unit->levelsInSession as $key=>$level)
                            @if($key == 0)
                                {{$level->program->program_code}}
                            @else
                                {{"/ ".$level->program->program_code}}
                            @endif
                        @endforeach
                    </td>
                </tr>
            @endforeach
            {{--<tr>
                <td rowspan="{{$sessions->where('period.day.day', "Wednesday")->count() + 1}}">Wednesday</td>
            </tr>--}}
            @foreach($units->pluck('sessions')->flatten()->where('period.day.day', "Wednesday")->sortBy('period.time') as $session)
                <tr>
                    <td>Wednesday</td>
                    <td>{{$session->period->time}}</td>
                    <td>{{$session->unit->code}} {{is_null($session->room->lab_type_id) ? '': '(practical)'}}</td>
                    <td>{{$session->room->room_code}}</td>
                    {{-- <td>{{$session->room->capacity}}</td> --}}
                    <td>{{$session->group === 'Non' ? '' : $session->group}}</td>
                    {{-- <td>{{($session->unit->levelsInSession->sum("num_students") - $session->unit->levelsInSession->sum("num_students") % $session->groups)/ $session->groups}}</td> --}}
                    <td>
                        @foreach($session->unit->levelsInSession as $key=>$level)
                            @if($key == 0)
                                {{$level->program->program_code}}
                            @else
                                {{"/ ".$level->program->program_code}}
                            @endif
                        @endforeach
                    </td>
                </tr>
            @endforeach
            {{--<tr>
                <td rowspan="{{$sessions->where('period.day.day', "Thursday")->count() + 1}}">Thursday</td>
            </tr>--}}
            @foreach($units->pluck('sessions')->flatten()->where('period.day.day', "Thursday")->sortBy('period.time') as $session)
                <tr>
                    <td>Thursday</td>
                    <td>{{$session->period->time}}</td>
                    <td>{{$session->unit->code}} {{is_null($session->room->lab_type_id) ? '': '(practical)'}}</td>
                    <td>{{$session->room->room_code}}</td>
                    {{-- <td>{{$session->room->capacity}}</td> --}}
                    <td>{{$session->group === 'Non' ? '' : $session->group}}</td>
                    {{-- <td>{{($session->unit->levelsInSession->sum("num_students") - $session->unit->levelsInSession->sum("num_students") % $session->groups)/ $session->groups}}</td> --}}
                    <td>
                        @foreach($session->unit->levelsInSession as $key=>$level)
                            @if($key == 0)
                                {{$level->program->program_code}}
                            @else
                                {{"/ ".$level->program->program_code}}
                            @endif
                        @endforeach
                    </td>
                </tr>
            @endforeach
            {{--<tr>
                <td rowspan="{{$sessions->where('period.day.day', "Friday")->count() + 1}}">Friday</td>
            </tr>--}}
            @foreach($units->pluck('sessions')->flatten()->where('period.day.day', "Friday")->sortBy('period.time') as $session)
                <tr>
                    <td>Friday</td>
                    <td>{{$session->period->time}}</td>
                    <td>{{$session->unit->code}} {{is_null($session->room->lab_type_id) ? '': '(practical)'}}</td>
                    <td>{{$session->room->room_code}}</td>
                    {{-- <td>{{$session->room->capacity}}</td> --}}
                    <td>{{$session->group === 'Non' ? '' : $session->group}}</td>
                    {{-- <td>{{($session->unit->levelsInSession->sum("num_students") - $session->unit->levelsInSession->sum("num_students") % $session->groups)/ $session->groups}}</td> --}}
                    <td>
                        @foreach($session->unit->levelsInSession as $key=>$level)
                            @if($key == 0)
                                {{$level->program->program_code}}
                            @else
                                {{"/ ".$level->program->program_code}}
                            @endif
                        @endforeach
                    </td>
                </tr>
            @endforeach
            {{--<tr>
                <td rowspan="{{$sessions->where('period.day.day', "Saturday")->count() + 1}}">Saturday</td>
            </tr>--}}
            @foreach($units->pluck('sessions')->flatten()->where('period.day.day', "Saturday")->sortBy('period.time') as $session)
                <tr>
                    <td>Saturday</td>
                    <td>{{$session->period->time}}</td>
                    <td>{{$session->unit->code}} {{is_null($session->room->lab_type_id) ? '': '(practical)'}}</td>
                    <td>{{$session->room->room_code}}</td>
                    {{-- <td>{{$session->room->capacity}}</td> --}}
                    <td>{{$session->group === 'Non' ? '' : $session->group}}</td>
                    {{-- <td>{{($session->unit->levelsInSession->sum("num_students") - $session->unit->levelsInSession->sum("num_students") % $session->groups)/ $session->groups}}</td> --}}
                    <td>
                        @foreach($session->unit->levelsInSession as $key=>$level)
                            @if($key == 0)
                                {{$level->program->program_code}}
                            @else
                                {{"/ ".$level->program->program_code}}
                            @endif
                        @endforeach
                    </td>
                </tr>
            @endforeach
            </tbody>
        </table>
        <div class="next-page"></div>
    @endforeach
</div>