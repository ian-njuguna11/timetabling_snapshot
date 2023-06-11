@extends('layouts.datatable')
@section('Page-Title')
Programs Timetable
@endsection
@section('content')

<div class="card">
    <div class="card-header">
        <div class="card-title">
            <h4>{{$school}}</h4>
            <h5>{{$program}}</h5>
        </div>
        <div class="card-tools">
            <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                <i class="fas fa-minus"></i>
            </button>
            {{-- <button type="button" class="btn btn-tool" data-card-widget="remove" title="Remove">
                <i class="fas fa-times"></i>
            </button> --}}
        </div>
    </div>
    <div class="card-body p-0">


        @foreach($levels as $level => $units)
        <div style="margin-left: 2%">
            <br>
            <h5>{{$level}}</h5>
        </div>
        <table class="table">
            <thead>
                <tr>
                    <th style="width: 8%" >
                        Day
                    </th>
                    <th style="width: 10%">
                        Time
                    </th>
                    <th style="width: 10%">
                        Unit
                    </th>
                    <th style="width: 10%">
                        Room
                    </th>
                    <th style="width: 10%">
                        Group
                    </th>
                    <th style="width: 10%">
                        Programs
                    </th>
                </tr>
            </thead>
            <tbody>
                @foreach($units->pluck('sessions')->flatten()->where('period.day.day', "Monday")->sortBy('period.time')
                as $session)
                <tr>
                    <td>Monday</td>
                    <td>{{$session->period->time}}</td>
                    <td>{{$session->unit->code}} {{is_null($session->room->lab_type_id) ? '': '(practical)'}}</td>
                    <td>{{$session->room->room_code}}</td>
                    <td>{{$session->group === 'Non' ? '' : $session->group}}</td>
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

                @foreach($units->pluck('sessions')->flatten()->where('period.day.day', "Tuesday")->sortBy('period.time')
                as $session)
                <tr>
                    <td>Tuesday</td>
                    <td>{{$session->period->time}}</td>
                    <td>{{$session->unit->code}} {{is_null($session->room->lab_type_id) ? '': '(practical)'}}</td>
                    <td>{{$session->room->room_code}}</td>
                    <td>{{$session->group === 'Non' ? '' : $session->group}}</td>
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
                @foreach($units->pluck('sessions')->flatten()->where('period.day.day',
                "Wednesday")->sortBy('period.time') as $session)
                <tr>
                    <td>Wednesday</td>
                    <td>{{$session->period->time}}</td>
                    <td>{{$session->unit->code}} {{is_null($session->room->lab_type_id) ? '': '(practical)'}}</td>
                    <td>{{$session->room->room_code}}</td>
                    <td>{{$session->group === 'Non' ? '' : $session->group}}</td>
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

                @foreach($units->pluck('sessions')->flatten()->where('period.day.day',
                "Thursday")->sortBy('period.time') as $session)
                <tr>
                    <td>Thursday</td>
                    <td>{{$session->period->time}}</td>
                    <td>{{$session->unit->code}} {{is_null($session->room->lab_type_id) ? '': '(practical)'}}</td>
                    <td>{{$session->room->room_code}}</td>
                    <td>{{$session->group === 'Non' ? '' : $session->group}}</td>
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
                @foreach($units->pluck('sessions')->flatten()->where('period.day.day', "Friday")->sortBy('period.time')
                as $session)
                <tr>
                    <td>Friday</td>
                    <td>{{$session->period->time}}</td>
                    <td>{{$session->unit->code}} {{is_null($session->room->lab_type_id) ? '': '(practical)'}}</td>
                    <td>{{$session->room->room_code}}</td>
                    <td>{{$session->group === 'Non' ? '' : $session->group}}</td>
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

                @foreach($units->pluck('sessions')->flatten()->where('period.day.day',
                "Saturday")->sortBy('period.time') as $session)
                <tr>
                    <td>Saturday</td>
                    <td>{{$session->period->time}}</td>
                    <td>{{$session->unit->code}} {{is_null($session->room->lab_type_id) ? '': '(practical)'}}</td>
                    <td>{{$session->room->room_code}}</td>
                    <td>{{$session->group === 'Non' ? '' : $session->group}}</td>
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
    <!-- /.card-body -->
</div>
</body>

<br><br><br>
@endsection