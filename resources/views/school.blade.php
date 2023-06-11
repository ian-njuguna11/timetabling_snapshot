@extends('layouts.datatable')
@section('Page-Title')
    {{$school->name}} LOCATION
@endsection 
@section('navcontent')
    <li class="active">
        <a href="{{url("schools")}}">Schools</a>
    </li>
    <li>
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
    <li>
        <a href="{{url('timetable')}}">Timetable</a>
    </li>
@endsection
@section('content')
    {{-- <a href="{{url("programs")}}" class="btn btn-primary"><span class="oi oi-caret-left"></span> Go Back</a> --}}
    <div class="card mt-22">
        <div class="card-body">
            <h5 class="header">{{$school->name}}</h5>
            <br />   
            <h6 class="header">Lecture Buildings</h6>

            <table class="display dataTable table-striped">
                <thead>
                    <tr>
                        <th style="width: 5%">
                            <!-- <input type="checkbox" id="addedLocations"> -->
                        </th>
                        <th>Location</th>
                        <!-- <th>Number of rooms</th> -->
                    </tr>
                </thead>
                <tbody>
                @foreach($school->locations as $location)
                    <tr id="addedLocationRow{{$location->id}}">
                        <td>
                            <input type="checkbox" id="addedLocation{{$location->id}}">
                        </td>
                        <td>{{$location->location}}</td>
                        <td></td>
                    </tr>
                @endforeach
                </tbody>
                
            </table>
            <br>
            <div class="row justify-content-start">
                <button class="btn btn-danger btn-sm" onclick="removeSelectedLocations()"><i class="fas fa-trash"> &nbsp; &nbsp
                </i>Remove Selected</button>
            </div>

        </div>
    </div>

    <div class="card mt-22">
        <div class="card-body">
            <div class="col-md-12">
                <div class="col-md-12">
                    <h6 class="header">Select Buildings</h6>
                    <table class="display dataTable table-striped" id="locationsTable">
                        <thead>
                        <tr>
                            <th style="width:5%">#</th>
                            <th>Location</th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach($locations as $location)
                            <tr id="locationRow{{$location->id}}">
                                <td><input type="checkbox" id="location{{$location->id}}"></td>
                                <td>{{$location->location}}</td>
                            </tr>
                        @endforeach
                        </tbody>
                    </table>
                    <br>
        
                    <div class="row justify-content-start">
                        <button class="btn btn-sm btn-kabarak" onclick="checkSelectedLocations()"><span class="fas fa-plus"></span>&nbsp; Add Selected Buildings</button>
                        &nbsp;&nbsp; &nbsp;&nbsp;
                        <a class="btn btn-sm btn-kabarak"  href="{{ url('buildings') }}"><span class="fas fa-plus"></span>&nbsp;&nbsp;AddBuilding</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    
    <br>
    <br>
    <br>
           
@endsection
@section('jscontent')
    <script>
        function selectAddedLocations(){
            @foreach($school->locations as $location)
                if($('#addedLocations').is(':checked')){
                    $('#addedlocation{{$location->id}}').prop('checked', true);
                }else{
                    $('#addedLocation{{$location->id}}').prop('checked', false);
                }
            @endforeach
        }
        function removeSelectedLocations(){
            var selected_locations = [];
            @foreach($locations as $location)
            if($('#addedLocation{{$location->id}}').is(':checked')){
                selected_locations.push(parseInt({{$location->id}}));
            }
             @endforeach

            var csrf = '{{csrf_field()}}';
            var open_form = '<form action="{{url('remove-lecture-locations/'.$school->id)}}" method="post">';
            var close_form = '</form>';
            var locations = "<input type='text' name='locations' value='"+selected_locations+"'/>";
            $(open_form + csrf + locations + close_form).appendTo('body').submit().remove();
        }
        function checkSelectedLocations(){
            var selected_locations = [];
            @foreach($locations as $location)
            if($('#location{{$location->id}}').is(':checked')){
                selected_locations.push(parseInt({{$location->id}}));
            }
             @endforeach
            var csrf = '{{csrf_field()}}';
            var open_form = '<form action="{{url('add-lecture-locations/'.$school->id)}}" method="post">';
            var close_form = '</form>';
            var locations = "<input type='text' name='locations' value='"+selected_locations+"'/>";
            $(open_form + csrf + locations + close_form).appendTo('body').submit().remove();
        }
        function checkAddedLocations(){
            @foreach($locations as $location)
            if($('#addedLocationRow{{$location->id}}').length != 0){
                $('#locationRow{{$location->id}}').remove();
            }
            @endforeach
        }
        function displayLocations(){
            $('#locations').show();
            $('#showLocations').hide();
            $('#hideLocations').show();
        }
        function hideLocations(){
            $('#locations').hide();
            $('#showLocations').show();
            $('#hideLocations').hide();
        }
        $(document).ready( function () {
            checkAddedLocations();
            //hideLocations();
            @foreach($school->locations as $location)
            $('#addedLocations{{$location->id}}').change(function(){
                selectAddedLocations();
            });
            @endforeach
        } );
    </script>
@endsection