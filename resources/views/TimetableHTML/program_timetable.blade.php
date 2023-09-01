@extends('layouts.datatable')

@section('Page-Title')
Programs Timetable
@endsection

@section('content')

<div class="flex" style="margin-bottom:10px; margin-top:-10px">
    
    <a class="btn-kabarak btn-sm btn" href="{{ url('app/call') }}"><span
            class="fas fa-sync"></span> &nbsp; Publish Timetable To Attandence. </a>
    <br>
    <br>
    <div id = "alert">
        @if ($message = Session::get('info'))
            <div class="alert alert-success">
                <button type="button" data-dismiss="alert" class="close">
                    x
                </button>
                <strong style="color:white;">{{ $message }}</strong>
            </div>
        @endif
    </div>


    {{-- @include('alert') --}}
</div>


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
    <div class="card-body d-flex flex-column">
        

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
                    <th style="width: 10%">
                        Action.
                    </th>
                </tr>
            </thead>
            <tbody>
                @foreach($units->pluck('sessions')->flatten()->where('period.day.day', "Monday")->sortBy('period.time')
                as $session)
                <tr>
                    <td>Monday</td>
                                       
                    @include('TimetableHTML.partials.changeClassTime')
                </tr>
                @endforeach

                @foreach($units->pluck('sessions')->flatten()->where('period.day.day', "Tuesday")->sortBy('period.time')
                as $session)
                <tr>
                    <td>Tuesday</td>
                    
                    @include('TimetableHTML.partials.changeClassTime')
                </tr>
                @endforeach
                @foreach($units->pluck('sessions')->flatten()->where('period.day.day',
                "Wednesday")->sortBy('period.time') as $session)
                <tr>
                    <td>Wednesday</td>
                   
                    @include('TimetableHTML.partials.changeClassTime')
                </tr>
                @endforeach

                @foreach($units->pluck('sessions')->flatten()->where('period.day.day',
                "Thursday")->sortBy('period.time') as $session)
                <tr>
                    <td>Thursday</td>
                    
                    @include('TimetableHTML.partials.changeClassTime')
                </tr>
                @endforeach
                @foreach($units->pluck('sessions')->flatten()->where('period.day.day', "Friday")->sortBy('period.time')
                as $session)
                <tr>
                    <td>Friday</td>
                    
                    @include('TimetableHTML.partials.changeClassTime')
                    
                </tr>
                @endforeach

                @foreach($units->pluck('sessions')->flatten()->where('period.day.day',
                "Saturday")->sortBy('period.time') as $session)
                <tr>
                    <td>Saturday</td>
                    
                    @include('TimetableHTML.partials.changeClassTime')
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

@section('jscontent')
    <script>        
        function allocateClassTime(e){   
            
            var session_obj = "allocateClassTime" + e;
            
            
            // $("#"+session_obj).text("Hello");
            $.get('/session_query' + "/" + e, function(responseText){
                 console.log(responseText);
            })
            
            console.log(e);
        }
    </script>
    
@endsection



<br><br><br>
@endsection

@section('sockets')
<script type="module">
        import Echo from 'laravel-echo';

window.io = require('socket.io-client');

const echo = new Echo({
    broadcaster: 'socket.io',
    host: window.location.hostname + ':6001', // Replace with your WebSocket server URL
});
// Example: Listening to a channel and event
echo.channel('ala').listen('alala', (data) => {
    console.log('Received event:', data);
});
</script>
@endsection