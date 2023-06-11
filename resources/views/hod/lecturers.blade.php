@extends('layouts.datatable_hod')
@section('Page-Title')
    Lecturerssss
@endsection
@section('content')
    <!-- Main content -->
    <section class="content m-10">
        

        <div class="card mt-22">
            <div class="card_title">
                <h5 class="">Available lecturer</h5>
            </div>
                <div class="card-body p-0">
                    <table id="example3" class="display dataTable table-striped">
                        <thead>
                        <tr>
                            <th style="width: 10%">
                              #
                            </th>
                            <th style="width: 20%">
                                first name
                            </th>
                            <th style="width: 20%">
                                Last name
                            </th>
                            {{-- <th style="width: 20%">
                                Department
                            </th> --}}
                            <th class="float-right" style="width: 20%">
                                Actions
                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach($lecturers as $lecturer)
                            
                                <tr>
                                    <td>
                                        <a>{{$lecturer->id}} </a>
                                    </td>

                                    <td>
                                        <a>{{$lecturer->first_name}}</a>
                                    </td>
                                    <td>
                                        <a>{{$lecturer->last_name}}</a>
                                    </td>
                                    {{-- <td>
                                        <a>{{$lecturer->deparment_ID}}</a>
                                    </td> --}}


                                    <td class="project-actions text-left float-right">
                                        <input type="number" name="lecId" id="lecId" value="{{ $lecturer->id }}" hidden>
                                        {{-- data-toggle="modal" data-target="#assignSession" --}}
                                        <a href="{{url("hods/assign_specific_lec/$lecturer->id")}}" id="assginBtn" class="btn btn-info btn-sm">
                                            <i class="fas fa-pencil-alt">
                                            </i>

                                            Assign Lectures
                                        </a>

                                        <a class="btn btn-info btn-sm" href="{{url('viewupdateDepartment/'.$lecturer->id)}}">
                                            <i class="fas fa-pencil-alt">
                                            </i>
                                            Edit
                                        </a>
                                        
                                        <a class="btn btn-danger btn-sm" data-toggle="modal" data-target="#delete-{{$lecturer->id}}">
                                            <i class="fas fa-trash">
                                            </i>
                                            Delete
                                        </a>

                                        <div class="modal fade" id="delete-{{$lecturer->id}}">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header bg-danger-normal">
                                                        <h4 class="modal-title">Confirm delete</h4>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <p>Do you really want to delete these records? This process cannot be undone. &hellip;</p>
                                                    </div>
                                                    <div class="modal-footer justify-content-between">
                                                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                                                        <a href="{{url('destroyDepartment/'.$lecturer->id)}}"><button type="button" class="btn btn-danger">Delete</button></a>
                                                    </div>
                                                </div>
                                                <!-- /.modal-content -->
                                            </div>
                                            <!-- /.modal-dialog -->
                                        </div>
                                        <!-- /.modal -->
                                    </td>
                                </tr>
                        @endforeach
                        </tbody>
                    </table>
                </div>
        <!-- /.card-body -->
            <br>
            <br>
        </div>
        <!-- /.card -->


        {{-- @include("layouts.assignSession") --}}
            <!-- Modal -->
    <div class="modal fade" id="assignSession" role="dialog">
        <div class="modal-dialog modal-lg">
    
        <!-- Modal content-->
        <form enctype="multipart/form-data" action="/profile" method="POST">
    
        <div class="modal-content">
        <div class="modal-header" style="background-color: maroon">
            <h4 style="color: white" > Assign To / Status  </h4>    
            <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">  
            
            <div class='notifications top-right'></div>
            

            <h4>{{$school}}</h4>
            <h5>{{$program}}</h5>
            
            <div class="card-body p-0">


                @foreach($levels as $level => $units)

                <div style="margin-left: 2%">
                    <br>
                    <h5>{{$level}}</h5>
                </div>
                <table class="table">
                    <thead>
                        <tr>
                            <th style="width: 3%" >Assign</th>
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
                                Programs
                            </th>
                            <th style="width: 10%">
                                Assign
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($units->pluck('sessions')->flatten()->where('period.day.day', "Monday")->sortBy('period.time')
                        as $session)
                        <tr>
                            <td>
                                {{-- <a href="{{ url("assign") }}" class="btn btn-sm btn-danger">Assign</a> --}}
                                <input name="assign" class="form-check-input" type="checkbox" value="{{ $session->id }}" id="flexCheckDefault">  
                            </td>
                            <td>Monday</td>
                            <td>{{$session->period->time}}</td>
                            <td>{{$session->unit->code}} {{is_null($session->room->lab_type_id) ? '': '(practical)'}}</td>
                            <td>{{$session->room->room_code}}</td>
                            <td>
                                @foreach($session->unit->levelsInSession as $key=>$level)
                                @if($key == 0)
                                {{$level->program->program_code}}
                                @else
                                {{"/ ".$level->program->program_code}}
                                @endif
                                @endforeach
                            </td>
                            
                            @if ($session->lecture_id == null)
                                <td id="{{"assignote".$session->id}}" class="btn btn-sm btn-danger">
                                    Not Assigned
                                </td> 
                            @else
                                <td id="{{"assignote".$session->id}}" class="btn btn-sm btn-kabarak">
                                   {{ $session->lecture->first_name }}
                                </td> 
                            @endif 
                            

                        </tr>
                        @endforeach
        
                        @foreach($units->pluck('sessions')->flatten()->where('period.day.day', "Tuesday")->sortBy('period.time')
                        as $session)
                        <tr>
                            <td>
                                {{-- <a href="{{ url("assign") }}" class="btn btn-sm btn-danger">Assign</a> --}}
                                <input name="assign" class="form-check-input" type="checkbox" value="{{ $session->id }}" id="flexCheckDefault">  
                            </td>
                            <td>Tuesday</td>
                            <td>{{$session->period->time}}</td>
                            <td>{{$session->unit->code}} {{is_null($session->room->lab_type_id) ? '': '(practical)'}}</td>
                            <td>{{$session->room->room_code}}</td>
                            <td>
                                @foreach($session->unit->levelsInSession as $key=>$level)
                                @if($key == 0)
                                {{$level->program->program_code}}
                                @else
                                {{"/ ".$level->program->program_code}}
                                @endif
                                @endforeach
                            </td>

                             @if ($session->lecture_id == null)
                                <td  id="{{"assignote".$session->id}}" class="btn btn-sm btn-danger">
                                    
                                    <a href="#" onclick="openModal()">    
                                        Not Assigned
                                    </a>
                                </td> 
                            @else
                                <td id="{{"assignote".$session->id}}" class="btn btn-sm btn-kabarak">
                                   {{ $session->lecture->first_name }}
                                </td> 
                            @endif 
                        </tr>
                        @endforeach
                        @foreach($units->pluck('sessions')->flatten()->where('period.day.day',
                        "Wednesday")->sortBy('period.time') as $session)
                        <tr>
                            <td>
                                {{-- <a href="{{ url("assign") }}" class="btn btn-sm btn-danger">Assign</a> --}}
                                <input name="assign" class="form-check-input" type="checkbox" value="{{ $session->id }}" id="flexCheckDefault">  
                            </td>
                            <td>Wednesday</td>
                            <td>{{$session->period->time}}</td>
                            <td>{{$session->unit->code}} {{is_null($session->room->lab_type_id) ? '': '(practical)'}}</td>
                            <td>{{$session->room->room_code}}</td>
                            <td>
                                @foreach($session->unit->levelsInSession as $key=>$level)
                                @if($key == 0)
                                {{$level->program->program_code}}
                                @else
                                {{"/ ".$level->program->program_code}}
                                @endif
                                @endforeach
                            </td>
                          @if ($session->lecture_id == null)
                                <td id="{{"assignote".$session->id}}" class="btn btn-sm btn-danger">
                                    Not Assigned
                                </td> 
                            @else
                                <td id="{{"assignote".$session->id}}" class="btn btn-sm btn-kabarak">
                                   {{ $session->lecture->first_name }}
                                </td> 
                            @endif
                        </tr>
                        @endforeach
        
                        @foreach($units->pluck('sessions')->flatten()->where('period.day.day',
                        "Thursday")->sortBy('period.time') as $session)
                        <tr>
                            <td>
                                {{-- <a href="{{ url("assign") }}" class="btn btn-sm btn-danger">Assign</a> --}}
                                <input name="assign" class="form-check-input" type="checkbox" value="{{ $session->id }}" id="flexCheckDefault">  
                            </td>
                            <td>Thursday</td>
                            <td>{{$session->period->time}}</td>
                            <td>{{$session->unit->code}} {{is_null($session->room->lab_type_id) ? '': '(practical)'}}</td>
                            <td>{{$session->room->room_code}}</td>
                            <td>
                                @foreach($session->unit->levelsInSession as $key=>$level)
                                @if($key == 0)
                                {{$level->program->program_code}}
                                @else
                                {{"/ ".$level->program->program_code}}
                                @endif
                                @endforeach
                            </td>
                            
                          @if ($session->lecture_id == null)
                                <td id="{{"assignote".$session->id}}" class="btn btn-sm btn-danger">
                                    Not Assigned
                                </td> 
                            @else
                                <td id="{{"assignote".$session->id}}" class="btn btn-sm btn-kabarak">
                                   {{ $session->lecture->first_name }}
                                </td> 
                            @endif
                        </tr>
                        @endforeach
                        @foreach($units->pluck('sessions')->flatten()->where('period.day.day', "Friday")->sortBy('period.time')
                        as $session)
                        <tr>
                            <td>
                                {{-- <a href="{{ url("assign") }}" class="btn btn-sm btn-danger">Assign</a> --}}
                                <input name="assign" class="form-check-input" type="checkbox" value="{{ $session->id }}" id="flexCheckDefault">  
                            </td>
                            <td>Friday</td>
                            <td>{{$session->period->time}}</td>
                            <td>{{$session->unit->code}} {{is_null($session->room->lab_type_id) ? '': '(practical)'}}</td>
                            <td>{{$session->room->room_code}}</td>
                            <td>
                                @foreach($session->unit->levelsInSession as $key=>$level)
                                @if($key == 0)
                                {{$level->program->program_code}}
                                @else
                                {{"/ ".$level->program->program_code}}
                                @endif
                                @endforeach
                            </td>
                          @if ($session->lecture_id == null)
                                <td id="{{"assignote".$session->id}}" class="btn btn-sm btn-danger">
                                    Not Assigned
                                </td> 
                            @else
                                <td id="{{"assignote".$session->id}}" class="btn btn-sm btn-kabarak">
                                   {{ $session->lecture->first_name }}
                                </td> 
                            @endif
                        </tr>
                        @endforeach
        
                        @foreach($units->pluck('sessions')->flatten()->where('period.day.day',
                        "Saturday")->sortBy('period.time') as $session)
                        <tr>
                            <td>
                                {{-- <a href="{{ url("assign") }}" class="btn btn-sm btn-danger">Assign</a> --}}
                                <input name="assign" class="form-check-input" type="checkbox" value="{{ $session->id }}" id="flexCheckDefault">  
                            </td>
                            <td>Saturday</td>
                            <td>{{$session->period->time}}</td>
                            <td>{{$session->unit->code}} {{is_null($session->room->lab_type_id) ? '': '(practical)'}}</td>
                            <td>{{$session->room->room_code}}</td>
                            <td>
                                @foreach($session->unit->levelsInSession as $key=>$level)
                                @if($key == 0)
                                {{$level->program->program_code}}
                                @else
                                {{"/ ".$level->program->program_code}}
                                @endif
                                @endforeach
                            </td>
                          @if ($session->lecture_id == null)
                                <td id="{{"assignote".$session->id}}" class="btn btn-sm btn-danger">
                                    Not Assigned
                                </td> 
                            @else
                                <td id="{{"assignote".$session->id}}" class="btn btn-sm btn-kabarak">
                                   {{ $session->lecture->first_name }}
                                </td> 
                            @endif
                        </tr>
                        @endforeach
                    </tbody>
                </table>
                <div class="next-page"></div>
                @endforeach
            </div>
            
            
        </div>
        {{-- <div class="modal-footer" style="background-color: maroon">
            <button type="submit" class="pull-right btn btn-sm btn-kabarak">Submit</button>
        </div> --}}
        </div>
        </form>
    
        </div>
        </div>
    </section>
    <!-- /.content -->

@endsection
@section('jscontent')
    <script>
  
    var pusher = new Pusher('{{env("MIX_PUSHER_APP_KEY")}}', {
       cluster: '{{env("PUSHER_APP_CLUSTER")}}',
       encrypted: true
     });
 
     var channel = pusher.subscribe('notify-channel');
     channel.bind('App\\Events\\Notify', function(data) {
       alert(data.message);
     });
   </script>

    <script type="text/javascript">
    
        function openModal(){

        $('#myModal').modal();
        }

        var lId ;
        function getLecId(lecId){
           lId = lecId;
        }

        var CSRF_TOKEN = $('meta[name="csrf-token"]').attr('content');
        var checkboxes = document.querySelectorAll("input[type=checkbox][name=assign]");
        let assignSessions = []

        checkboxes.forEach(function(checkbox) {
        checkbox.addEventListener('change', function() { 


                // var element = document.getElementById("assignote");
                // element.innerHTML = "Assigned!";

                assignSessions = 
                Array.from(checkboxes) // Convert checkboxes to an array to use filter and map.
                .filter(i => i.checked) // Use Array.filter to remove unchecked checkboxes.
                .map(i => i.value) // Use Array.map to extract only the checkbox values from the array of objects.
                
                console.log(assignSessions)

                $.ajax({
                    /* the route pointing to the post function */
                    url: '/assign',
                    type: 'POST',
                    /* send the csrf-token and the input to the controller */
                    data: {_token: CSRF_TOKEN, session:assignSessions , lecId:lId},
                    dataType: 'JSON',
                    /* remind that 'data' is the response of the AjaxController */
                    success: function(data) {
                        
                        for (let i = 0; i < assignSessions.length; i++) {
                    // text += cars[i] + "<br>";
                    // console.log("Session Id: "+assignSessions[i])
                            if(document.getElementById("assignote"+assignSessions[i])){
                                var element = document.getElementById("assignote"+assignSessions[i]);

                                element.innerHTML = data.lec_name+ " Assigned!";
                                element.style.backgroundColor="#00FF00";
                            }
                        } 
                        
                        // $("#assignote").html(data);                        
                        // console.log("Session: "+ data.session +"\n"+"LecID:  "+data.lecId); 
                        console.log("lecId: "+data.lecId);
                        console.log("Crush report: "+data.crush_e);
                        console.log(data.lecturers_session);
                        
                        console.log("lc_periodId: "+data.lc_periodId);
                        console.log("sess_pID: "+data.sess_pID);
                        console.log("reqSS: "+data.reqSS);
                        
                        
                        // console.log(data.l_sess);
                        // console.log(data.day);
                        // console.log(data.time);
                        // days
                        
                        
                        
                    },
                }); 

            })
        });

        </script>
    <script>
        $(function() {
            $("#example1").DataTable({
                "responsive": true,
                "lengthChange": false,
                "autoWidth": false,
                "buttons": ["copy", "csv", "excel", "pdf", "print", "colvis"]
            }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');
            $('#example2').DataTable({
                "paging": true,
                "lengthChange": false,
                "searching": false,
                "ordering": true,
                "info": true,
                "autoWidth": false,
                "responsive": true,
            });
            $('#quickForm').validate({
                rules: {
                    name: {
                        required: true,
                        name: true,
                    },
                },
                messages: {
                    name: {
                        required: "Please enter a school name ",
                        email: "Please enter a vaild school name "
                    },
                },
                errorElement: 'span',
                errorPlacement: function(error, element) {
                    error.addClass('invalid-feedback');
                    element.closest('.form-group').append(error);
                },
                highlight: function(element, errorClass, validClass) {
                    $(element).addClass('is-invalid');
                },
                unhighlight: function(element, errorClass, validClass) {
                    $(element).removeClass('is-invalid');
                }
            });
        });
        });
    </script>
    
    <script src="https://js.pusher.com/4.1/pusher.min.js"></script>

@endsection