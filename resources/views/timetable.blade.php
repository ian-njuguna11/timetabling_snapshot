@extends('layouts.datatable')
@section('Page-Title')
Generate Timetable
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
<div class="col-md-12">
            <!-- DIRECT CHAT PRIMARY -->
            <div class="card card-primary card-outline direct-chat direct-chat-warning">
              <div class="card-header">
                <h3 class="card-title">Timetable</h3>

                
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <!-- Conversations are loaded here -->
                <div class="direct-chat-messages">
                  <!-- Message. Default to the left -->
                  <div class="direct-chat-msg">
                    <div class="direct-chat-infos clearfix">
                      <span class="direct-chat-name float-left">Generate</span>
                    </div>
                    <!-- /.direct-chat-infos -->
                    <!-- /.direct-chat-img -->
                    
                    <!-- /.direct-chat-text -->
                  </div>
                  <div class="direct-chat-msg right">
                    
                    <!-- /.direct-chat-infos -->
                    <!-- /.direct-chat-img -->
                    <div class="direct-chat-text">
                    Click below to generate a new timetable
                    </div>
                    <!-- /.direct-chat-text -->
                  </div>
                  <!-- /.direct-chat-msg -->

                  
                  <!-- /.direct-chat-msg -->
                </div>
              </div>
              <!-- /.card-body -->
              <div class="card-footer">
              <div class="row justify-content-start">
                  <div class="col-md-8 offset-4">
                    <a href="{{url('timetable/create')}}" class="btn btn-info btn-sm">Generate new timetable</a>
                  </div>
                </div>
              </div>
              <!-- /.card-footer-->
            </div>
            <!--/.direct-chat -->
          </div>
    {{-- <div class="card mt-22">
        <div class="card_title">
            <h5 class="">Available timetable</h5>
        </div>
        <div class="card-body">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-10">
                        @foreach($timetables as $description=>$timetable_docs)

                            <h3>{{$description}}</h3>
                            <div class="row justify-content-center">
                                <div class="col-md-10">
                                    @foreach($timetable_docs->groupBy('school_name') as $school=>$docs)
                                        <h6>{{$school}}</h6>

                                        <div class="row justify-content-center">
                                            <div class="col-md-10">
                                                @foreach($docs as $doc)
                                                    <div class="row">
                                                        <a href="{{url('timetable/download-pdf/'.$doc->id)}}">{{$doc->program->name}}</a>
                                                    </div>
                                                @endforeach
                                            </div>
                                        </div>


                                    @endforeach
                                </div>
                            </div>

                        @endforeach
                    </div>

                    
                </div>
            </div>
        </div>
    </div> --}}

@endsection