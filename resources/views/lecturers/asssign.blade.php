@extends('layouts.datatable_hod')
@section('Page-Title')
    Lecturers
@endsection
@section('content')
    <!-- Main content -->
    <section class="content m-10">
        

        <div class="card mt-22">
            <div class="card_title">
                <h5 class="">Assign {{ $lec_name->first_name." ".$lec_name->last_name }}</h5>
            </div>
                <div class="card-body p-32">
                    {{-- <div class="modal-body">   --}}
            
                        @include('sweet::alert')
                        
            
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
                                        {{-- <th style="width: 3%" >Assign</th> --}}
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
                                            Assign Status
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach($units->pluck('sessions')->flatten()->where('period.day.day', "Monday")->sortBy('period.time')
                                    as $session)
                                    <tr>
                                        {{-- <td>
                                            <a href="{{ url("assign") }}" class="btn btn-sm btn-danger">Assign</a>
                                            <input name="assign" class="form-check-input" type="checkbox" value="{{ $session->id }}" id="flexCheckDefault">  
                                        </td> --}}
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
                                            <td id="{{"assignote".$session->id}}">
                                                <a href="{{ url("hods/assign_specific_lec/assignlec/".$lecId."/".$session->id) }}"   class="btn-primary btn">Assign</a>
                                                
                                            </td> 
                                        @else
                                            <td id="{{"assignote".$session->id}}" class="btn btn-sm btn-kabarak">
                                               {{ $session->lecture->first_name." ". $session->lecture->last_name }}
                                            </td> 
                                        @endif 
                                        
            
                                    </tr>
                                    @endforeach
                    
                                    @foreach($units->pluck('sessions')->flatten()->where('period.day.day', "Tuesday")->sortBy('period.time')
                                    as $session)
                                    <tr>
                                        {{-- <td>
                                            {{--<a href="{{ url("assign") }}" class="btn btn-sm btn-danger">Assign</a> -}}
                                            <input name="assign" class="form-check-input" type="checkbox" value="{{ $session->id }}" id="flexCheckDefault">  
                                        </td> --}}
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
                                        <td id="{{"assignote".$session->id}}">
                                            <a href="{{ url("hods/assign_specific_lec/assignlec/".$lecId."/".$session->id) }}"   class="btn-primary btn">Assign</a>
                                            
                                        </td> 
                                        @else
                                        <td id="{{"assignote".$session->id}}" class="btn btn-sm btn-kabarak">
                                           {{ $session->lecture->first_name." ". $session->lecture->last_name }}
                                        </td> 
                                    @endif  
                                    </tr>
                                    @endforeach
                                    @foreach($units->pluck('sessions')->flatten()->where('period.day.day',
                                    "Wednesday")->sortBy('period.time') as $session)
                                    <tr>
                                        {{-- <td>
                                            <a href="{{ url("assign") }}" class="btn btn-sm btn-danger">Assign</a>
                                            <input name="assign" class="form-check-input" type="checkbox" value="{{ $session->id }}" id="flexCheckDefault">  
                                        </td> --}}
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
                                            <td id="{{"assignote".$session->id}}">
                                                <a href="{{ url("hods/assign_specific_lec/assignlec/".$lecId."/".$session->id) }}"   class="btn-primary btn">Assign</a>
                                                
                                            </td> 
                                        @else
                                            <td id="{{"assignote".$session->id}}" class="btn btn-sm btn-kabarak">
                                               {{ $session->lecture->first_name." ". $session->lecture->last_name }}
                                            </td> 
                                        @endif 
                                    </tr>
                                    @endforeach
                    
                                    @foreach($units->pluck('sessions')->flatten()->where('period.day.day',
                                    "Thursday")->sortBy('period.time') as $session)
                                    <tr>
                                        {{-- <td>
                                            {{-- <a href="{{ url("assign") }}" class="btn btn-sm btn-danger">Assign</a> -}}
                                            <input name="assign" class="form-check-input" type="checkbox" value="{{ $session->id }}" id="flexCheckDefault">  
                                        </td> --}}
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
                                            <td id="{{"assignote".$session->id}}">
                                                <a href="{{ url("hods/assign_specific_lec/assignlec/".$lecId."/".$session->id) }}"   class="btn-primary btn">Assign</a>
                                                
                                            </td> 
                                        @else
                                            <td id="{{"assignote".$session->id}}" class="btn btn-sm btn-kabarak">
                                               {{ $session->lecture->first_name." ". $session->lecture->last_name }}
                                            </td> 
                                        @endif 
                                    </tr>
                                    @endforeach
                                    @foreach($units->pluck('sessions')->flatten()->where('period.day.day', "Friday")->sortBy('period.time')
                                    as $session)
                                    <tr>
                                        {{-- <td>
                                            {{-- <a href="{{ url("assign") }}" class="btn btn-sm btn-danger">Assign</a> -}}
                                            <input name="assign" class="form-check-input" type="checkbox" value="{{ $session->id }}" id="flexCheckDefault">  
                                        </td> --}}
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
                                            <td id="{{"assignote".$session->id}}">
                                                <a href="{{ url("hods/assign_specific_lec/assignlec/".$lecId."/".$session->id) }}"   class="btn-primary btn">Assign</a>
                                                
                                            </td> 
                                        @else
                                            <td id="{{"assignote".$session->id}}" class="btn btn-sm btn-kabarak">
                                               {{ $session->lecture->first_name." ". $session->lecture->last_name }}
                                            </td> 
                                        @endif 
                                    </tr>
                                    @endforeach
                    
                                    @foreach($units->pluck('sessions')->flatten()->where('period.day.day',
                                    "Saturday")->sortBy('period.time') as $session)
                                    <tr>
                                        {{-- <td>
                                            {{-- <a href="{{ url("assign") }}" class="btn btn-sm btn-danger">Assign</a> -}}
                                            <input name="assign" class="form-check-input" type="checkbox" value="{{ $session->id }}" id="flexCheckDefault">  
                                        </td> --}}
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
                                            <td id="{{"assignote".$session->id}}">
                                                <a href="{{ url("hods/assign_specific_lec/assignlec/".$lecId."/".$session->id) }}"   class="btn-primary btn">Assign</a>
                                                
                                            </td> 
                                        @else
                                            <td id="{{"assignote".$session->id}}" class="btn btn-sm btn-kabarak">
                                               {{ $session->lecture->first_name." ". $session->lecture->last_name }}
                                            </td> 
                                        @endif 
                                    </tr>
                                    @endforeach
                                </tbody>
                            </table>
                            <div class="next-page"></div>
                            @endforeach
                        </div>
                        
                        
                    {{-- </div> --}}
                </div>
        <!-- /.card-body -->
            <br>
            <br>
        </div>
        <!-- /.card -->


        {{-- @include("layouts.assignSession") --}}
            <!-- Modal -->
  
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

        // function getLecId(lecId){
        //    lId = lecId;
        // }

        var CSRF_TOKEN = $('meta[name="csrf-token"]').attr('content');
        var checkboxes = document.querySelectorAll("input[type=checkbox][name=assign]");
        let assignSessions = []

        checkboxes.forEach(function(checkbox) {
        checkbox.addEventListener('change', function() { 

                assignSessions = 
                Array.from(checkboxes) // Convert checkboxes to an array to use filter and map.
                .filter(i => i.checked) // Use Array.filter to remove unchecked checkboxes.
                .map(i => i.value) // Use Array.map to extract only the checkbox values from the array of objects.
                
                console.log("sessions: "+assignSessions)
                console.log("lec_id: "+lId)
                
                for (let i = 0; i < assignSessions.length; i++) {
                    var lId = {{$lecId}};
                    //
                    // text += cars[i] + "<br>";
                    // console.log("Session Id: "+assignSessions[i])
                            // if(document.getElementById("assignote"+assignSessions[i])){
                            //     var element = document.getElementById("assignote"+assignSessions[i]);

                            //     // element.innerHTML = data.lec_name+ " Assigned!";
                            //     // element.style.backgroundColor="#00FF00";
                            // }
                            
                            $.ajax({
                                /* the route pointing to the post function */
                                url: '/assignPostLec',
                                type: 'POST',
                                /* send the csrf-token and the input to the controller */
                                data: {_token: CSRF_TOKEN, session:assignSessions[i] , lecId:lId},
                                dataType: 'JSON',
                                /* remind that 'data' is the response of the AjaxController */
                                success: function(data) {
                                    // location.reload();
                                                            
                                    console.log("lecId: "+data.lecId);
                                    console.log("rqSS: "+data.rqSS);
                                    console.log("lecturers_session: "+ data.lecturers_session);  
                                    
                            },
                }); 
                            
                    
                } 
                
                // $.ajax({
                //         url: "assignlec/"+lId+"/"+assignSessions[i],
                //         type: 'GET',
                //         dataType: 'json', // added data type
                //         success: function(res) {
                //             console.log(res);
                //             alert(res);
                //         }
                //     });

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
