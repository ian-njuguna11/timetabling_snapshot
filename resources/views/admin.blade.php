@extends('layouts.datatable')
@section("title", "Administrator")
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
    <li class="active">
        <a href="{{url('timetable')}}">Time table per Room</a>
    </li>
@endsection
@section('content')

@endsection