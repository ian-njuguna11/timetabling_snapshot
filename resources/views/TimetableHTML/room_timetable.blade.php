@extends('layouts.datatable')
@section('Page-Title')
Programs Timetable
@endsection

@section('content')
@foreach ($rooms as $key=> $room)

    <div class="card">
        <div class="card-header">
            <div class="card-title">
                <h4>{{$key}}</h4>
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
        <div class="card-body">
            @foreach($room as $day => $roomSessions)
            <br />
            <h5>{{$day}}</h5>
            <table id="example3" class="table">
                <thead>
                    <tr>
                        <th style="width: 10%">Time</th>
                        <th style="width: 10%">Unit</th>
                        <th style="width: 10%">Group</th>
                        <th style="width: 10%">No. of students</th>
                        <th style="width: 10%">Programs</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($roomSessions as $session)
                    <tr>
                        <td>{{$session->time}}</td>
                        <td>{{$session->unit}} {{$session->type == 'lab' ? "(practical)" : "" }}</td>
                        <td>{{$session->group}}</td>
                        <td>{{$session->totalStudents}}</td>
                        <td>{{$session->programs}}</td>

                    </tr>   
                    @endforeach
                </tbody>
            </table>
        @endforeach
        </div>
    </div>
@endforeach

<br><br><br>

@endsection