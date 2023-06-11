@extends('layouts.datatable')
@section('Page-Title')
Room Timetable
@endsection

@section('content')

{{-- @if(Session::has('success'))
    <div class="alert alert-success">
        {{Session::get('success')}}
    </div>
@endif   --}}

<div id = "alert">
    @if ($message = Session::get('success'))
        <div class="alert alert-success">
            <button type="button" data-dismiss="alert" class="close">
                x
            </button>
            <strong style="color:white;">{{ $message }}</strong>
        </div>
    @endif
</div>


<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>

@foreach($session as $lecturer)

    @if (count($lecturer->session)>0)
    <div class="card">
        <div class="card-header">
    
            <div class="card-title">
            <h4> {{ $lecturer->first_name }} {{ $lecturer->last_name }} </h4>
    
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
           
            {{-- @foreach ($lecturer->session as $session)
                <p>{{ $session }}</p>
            @endforeach --}}
    
            {{-- <p>{{ $lecturer }}</p> --}}
            <table id="example3" class="display dataTable table-striped">
                <thead>
                    <tr>
                        <th>Day</th>
                        <th>Time</th>
                        <th>Unit</th>
                        <th>Room</th>
                        <th>Group</th>
                        {{-- <th>Programs</th> --}}
                    </tr>
                </thead>
                <tbody>
                    @foreach($lecturer->session as $session)
                    <tr>
                        {{-- <p>{{ $session }}</p> --}}
                        {{-- <p>{{ $session->unit["code"] }}</p> --}}
                        <td>{{$session->period->day->day}}</td>
                        <td>{{$session->period->time}}</td>
                        <td>{{$session->unit["code"]}} {{$session->type == 'lab' ? "(practical)" : "" }}</td>
                        <td>{{$session->room->room_code}}</td>
                        <td>{{$session->group}}</td>
                        {{-- <td>{{$sessiroom->room_codeon->programs}}</td> --}}
                        
                        
    
                    </tr>   
                    @endforeach
                        
                    
                </tbody>
            </table>
            <a href="send-email-pdf/{{ $lecturer->id }}">
                <buttton style="margin-top: 10px " class="btn btn-primary btn-sm" >Dispatch to Lecturer as Email
                    &nbsp;
                    <i class='fa fa-send'></i>
                </buttton>
            </a>
            
        </div>
        
    </div>
    @endif
@endforeach
<br><br><br>
@endsection


