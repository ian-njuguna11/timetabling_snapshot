<!DOCTYPE html>
<html lang="{{ app()->getLocale() }}">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="{{asset('img/logo1.png')}}">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app.name', 'Laravel') }}</title>

    <!-- Styles -->
    {{--<link href="{{ asset('css/app.css') }}" rel="stylesheet">--}}
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <style>
        .next-page {
            page-break-after: always;
        }

    </style>
</head>
<body>
<div id="app">

    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-10">
                @foreach($schools as $key=> $school)
                    <h4>{{$key}}</h4>
                    @foreach($school->sortBy('levelsInSession.level')->groupBy('levelsInSession.level') as $key=>$sessions)
                        <h5>{{$key}}</h5>
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
                                <th>Program</th>
                            </tr>
                            </thead>
                            <tbody>
                            {{--<tr>
                                <td rowspan="{{$sessions->where('period.day.day', "Monday")->count() + 1}}">Monday</td>
                            </tr>--}}
                            @foreach($sessions->where('period.day.day', "Monday")->sortBy('period.time') as $session)
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
                            {{--<tr>
                                <td rowspan="{{$sessions->where('period.day.day', "Tuesday")->count() + 1}}">Tuesday</td>
                            </tr>--}}
                            @foreach($sessions->where('period.day.day', "Tuesday")->sortBy('period.time') as $session)
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
                            @foreach($sessions->where('period.day.day', "Wednesday")->sortBy('period.time') as $session)
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
                            @foreach($sessions->where('period.day.day', "Thursday")->sortBy('period.time') as $session)
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
                            @foreach($sessions->where('period.day.day', "Friday")->sortBy('period.time') as $session)
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
                            @foreach($sessions->where('period.day.day', "Saturday")->sortBy('period.time') as $session)
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
                @endforeach

            </div>
        </div>
    </div>
</div>
</body>
</html>