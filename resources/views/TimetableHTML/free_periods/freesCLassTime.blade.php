@extends('layouts.datatable')
@section('Page-Title')
    Free Slots Timetable
@endsection

@section('content')
    <div class="input-group float-lefts" style="margin-bottom:7px; margin-left:-10px;">

        &nbsp;&nbsp;&nbsp;
        <div class="mt-22 input-group-prepend">
            <span class="input-group-text" id=""><span class="fas fa-search"></span>&nbsp; Search for free slot</span>
        </div>
        <input placeholder="search by Room, Day, Time and Capacity " id="myInput" type="text" class="form-control">
        {{-- <input type="text" class="form-control"> --}}
    </div>
    @if (session()->has('without_session_to_change'))
        {{ session()->forget('state_message') }}
        {{ session()->forget('without_session_to_change') }}
    @elseif (session()->has('state_message'))
        <div style="width: 40%" class="card">
            <div class="card-header">
                <div class="card-title">
                    <p>
                        Period Day: {{ $session_to_change->period->day->day }}
                        <br>
                        Unit Name: {{ $session_to_change->unit_name }}
                        <br>
                        Unit Code: {{ $session_to_change->unit_code }}
                        <br>
                        Lecturer Name:
                        {{ isset($session_to_change->lecturer_name->first_name) ? $session_to_change->lecturer_name->first_name . ' ' . $session_to_change->lecturer_name->last_name : 'Not Assigned' }}
                        <br>
                        Room Name: {{ $session_to_change->room_code }}
                    </p>
                </div>
            </div>
        </div>
    @endif

    @foreach ($free_sessions as $key => $value)
        <div class="card">
            <div class="card-header">
                <div class="card-title">
                    <h4>{{ $value->day }}</h4>

                    <h4>{{ $value->time }}</h4>
                </div>
                <div class="card-tools">
                    <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                        <i class="fas fa-minus"></i>
                    </button>
                    <button type="button" class="btn btn-tool" data-card-widget="remove" title="Remove">
                        <i class="fas fa-times"></i>
                    </button>
                </div>
            </div>
            <div class="card-body">
                <table class="table">
                    <thead>
                        <tr>
                            <th>Day</th>
                            <th>Time</th>
                            <th>Room</th>
                            <th>Capacity</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    @foreach ($value->room_code as $r_code)
                        <tbody id="myTable">
                            <tr>
                                <td>{{ $value->day }}</td>
                                <td>{{ $value->time }}</td>
                                <td>{{ $r_code->room->room_code }}</td>
                                <td>{{ $r_code->room->capacity }}</td>
                                <td>
                                    <p style="color: green">Free</p>
                                </td>
                                {{-- <td>

                                    <a onclick="allocateClassPeriodQuery({{ $r_code->period_id }},{{ $r_code->room_id }}, {{ !isset($session_to_change->lecturer_name->id) ? ' Session_Unsigned' : $session_to_change->lecturer_name->id }})"
                                        id="{{ 'allocateClassTime' . $value->time }}" class="btn-sm btn-secondary">

                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                            fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                                            <path
                                                d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
                                            <path fill-rule="evenodd"
                                                d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z" />
                                        </svg>

                                        Allocate Class Time
                                    </a>

                                </td> --}}
                            </tr>

                        </tbody>
                    @endforeach
                </table>

            </div>
        </div>
       
    @endforeach
    <br><br><br>
@endsection

@section('jscontent')
    <script>
        var session_initial = {{ $session_to_change->id }};
        //lec_id 
        var lec_id;
        var room_id;
        var sess_id;
        
        function allocateClassPeriodQuery(sess_id, room_id, to_sess){ 
            console.log(session_initial) 
            // is session assigned to a lecturer  
            $.get('/isSessionAssignedToLec/' + session_initial, function(e){
                // console.log(e.lecture_id)
                if(e.lecture_id == null){
                    swal("Lecture Not Assigned to a Lecturer.",
                        "Please Assign, Lecture before moving.",
                        "warning", {
                        dangerMode: true,
                        buttons: true,
                        closeOnClickOutside: false,
                        timer: 5000,
                    });
                }else{
                    //id the free session.... my freeSessions() in TimetablingController I think is wrong....
                    // var m_url = ;
                    $.get('/moveLecture/'+ session_initial + '/to/' + to_sess, function(e){
                        // console.log(e.lecture_id)
                        var message = String(e);
                        
                        swal(message, " ", "success", {
                        button: "Close",
                    
                        });
                    });   
               
                }
            });       
        }
 

        function myFunction() {
            var input, filter, table, tr, td, i, txtValue;
            input = document.getElementById("myInput");
            filter = input.value.toUpperCase();
            table = document.getElementById("example2");
            tr = table.getElementsByTagName("tr");
            for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td")[0];
                if (td) {
                    txtValue = td.textContent || td.innerText;
                    if (txtValue.toUpperCase().indexOf(filter) > -1) {
                        tr[i].style.display = "";
                    } else {
                        tr[i].style.display = "none";
                    }
                }
            }
        }
    </script>
    <script>
        $(document).ready(function() {
            $("#myInput").on("keyup", function() {
                var value = $(this).val().toLowerCase();
                $("#myTable tr").filter(function() {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                });
            });
        });
    </script>
@endsection
