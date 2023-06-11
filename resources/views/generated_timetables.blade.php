@extends('layouts.datatable')
@section("title", "Programs")
@section('navcontent')
    <li>
        <a href="{{url("schools")}}">Schools</a>
    </li>
    <li >
        <a href="{{url("programs")}}">Programs</a>
    </li>
    <li>
        <a href="{{url("units")}}">Units</a>
    </li>
    <li>
        <a href="{{url('cohorts')}}">Cohorts</a>
    </li>
    <li>
        <a href="{{url('rooms')}}">Rooms</a>
    </li>
    <li class="active">
        <a href="{{url('timetable')}}">Timetable</a>
    </li>
@endsection
@section('content')
    <div class="card">
        <div class="card-body">
            <div class="container">
                <div class="row justify-content-start">
                    <a href="{{url('timetable/create')}}" class="btn btn-primary">Generate new timetable</a>
                    <a href="{{url('room_timetable/create')}}" class="btn btn-primary">Generate new room timetable</a>
                </div>
                
                <div class="row justify-content-center">
                    <div class="col-md-10">
                        <table class="table">
                            <thead>
                            <tr>
                                <th>Timetable description</th>
                                <th>Actions</th>
                            </tr>
                            </thead>
                            <tbody>
                            @foreach($timetables as $timetable)
                                <tr>
                                    <td>{{$timetable->description}}</td>
                                    <td>
                                        <a href="{{url('timetable/download-pdf')}}" class="btn btn-primary">PDF Download</a>
                                    </td>
                                    <td>
                                        <a href="{{url('timetable/download-room-pdf/{file_id}')}}" class="btn btn-primary">PDF Download</a>
                                    </td>
                                </tr>
                            @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

@endsection