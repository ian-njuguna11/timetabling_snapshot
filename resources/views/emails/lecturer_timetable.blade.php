 

{{-- <img id="imgkabuLogo" class="" src="{{asset('dist/img/kabu-logo.jpeg')}}" alt="KABULogo" height="60" width="60"> --}}

<style>
        
    body{
        margin-left: 30%;
        font-family: arial;
        font-size: 14px;
    }
    
    table,
    th,
    td {
        border-collapse: collapse;
        padding: 15px;
    }
    
   tr:nth-child(even) {
    background-color: #f2f2f2;
    }   
    
    #imgkabuLogo{
        margin-left: 20%;
    }
    
    #staffName{
        margin-left: 17%;
    }
</style> 

{{-- <img src="{{asset('dist/img/kabu-logo.jpeg')}}" alt="KABULogo" height="60" width="60"> --}}


@foreach($session as $lecturer)
<div class="card">
    <div class="card-header">

        <div id="staffName" class="card-title">
        <h4> {{ $lecturer->first_name }} {{ $lecturer->last_name }}</h4>

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
                    <th>Time</th>
                    <th>Unit</th>
                    <th>Room</th>
                    <th>Day</th>
                    {{-- <th>Programs</th> --}}
                </tr>
            </thead>
            <tbody>
                @foreach($lecturer->session as $session)
                <tr>

                    {{-- <p>{{ $session->unit["code"] }}</p> --}}
                    <td  >{{$session->period->time}}</td>
                    <td >{{$session->unit["code"]}} {{$session->type == 'lab' ? "(practical)" : "" }}</td>
                    <td  >{{$session->room->room_code}}</td>
                    <td  >{{$session->period->day->day}}</td>
                    {{-- <td>{{$session->programs}}</td> --}}

                </tr>   
                @endforeach
            </tbody>
        </table>
        
    </div>

</div>
@endforeach
