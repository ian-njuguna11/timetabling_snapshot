@extends('layouts.app-admin-lte')
@section("title", "Generation in Progress")
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
            <h4 class="card-title">A PDF of the timetable is being generated</h4>
            <div class="container">
                <div class="row justify-content-center">

                    <h5>It won't take long :)</h5><br>
                    <div id="result">

                    </div>
                </div>
                <div class="row justify-content-center">
                    <div id="status"></div>
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
            window.Echo.private('messages')
                .listen('PDFGenerated', (event) => {
                    var link = "<div class='alert alert-info'>PDF Generated." +
                        " <a href='{{url('')}}'>Download</a> " +
                        "</div>";

                    $('#result').append(link);
                })
                .listen('PDFGenerationFailed', (event) => {
                    var link = "<div class='alert alert-danger'>PDF Generation failed" +
                        "</div>";

                    $('#result').append(link);
                });
        });
    </script>
@endsection