@extends('layouts.datatable')
@section("title", "Generation in Progress")
@section('csscontent')
    <style>
        .loader {
            border: 5px solid #f3f3f3;
            border-radius: 50%;
            border-top: 5px solid #3498db;
            width: 30px;
            height: 30px;
            -webkit-animation: spin 2s linear infinite; /* Safari */
            animation: spin 2s linear infinite;
        }
        /* Safari */
        @-webkit-keyframes spin {
            0% { -webkit-transform: rotate(0deg); }
            100% { -webkit-transform: rotate(360deg); }
        }
        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }
    </style>
@endsection
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
            <div class="card-title"></div>
            <div class="container">
                <div class="row justify-content-start">
                    <div class="loader"></div>
                    <div id="status"></div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-md-12">
                        <table class="table" id="timetable">
                            <thead>
                            <tr>
                                <th>Day</th>
                                <th>Time</th>
                                <th>Unit</th>
                                <th>Group</th>
                                <th>Room</th>
                            </tr>
                            </thead>
                            <tbody id="tableBody">

                            </tbody>
                        </table>
                    </div>

                </div>

            </div>
        </div>
    </div>

@endsection
@section('sockets')
    <script src="{{ asset('js/app.js') }}"></script>
@endsection
@section('jscontent')
    <script>
        $(document).ready(function(){
            var table = $('#timetable').dataTable();
            console.log(table);
            window.Echo.private('messages')
                .listen('BroadcastSimpleMessage', (event) => {
                    console.log(event.message);
                    var message = JSON.parse(event.message.message);
                    if(message.type === "timetable-generator"){
                        $('#status').html(message.message);
                    }
                })
                .listen('SessionSaved', (event) => {
                    //console.log(event);
                    var session = event.session;
                    var day = session.period.day.day;
                    var time = session.period.time;
                    var unit = session.unit.code;
                    var room = session.room.room_code;
                    var group = session.group;
                    table.fnAddData([day, time, unit, group, room]);
                })
                .listen('TimetableGenerated', (event) => {
                    //console.log(event);
                    $('#status').html("Timetable generation completed");
                })
                .listen('GenerationFailed', (event) => {
                    console.log(event)
                })
                .listen('PDFGenerated', (event) => {
                    //console.log(event)
                    window.location = "{{url('timetable')}}";
                })
                .listen('PDFGenerationFailed', (event) => {
                    console.log(event);
                });
        });
    </script>
@endsection