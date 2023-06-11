    <!-- Modal -->
    <div class="modal fade" id="assignSession" role="dialog">
    <div class="modal-dialog modal-lg">

    <!-- Modal content-->
    <form enctype="multipart/form-data" action="/profile" method="POST">

    <div class="modal-content">
    <div class="modal-header" style="background-color: maroon">
        <h4 style="color: white" > Assign  </h4>                
        <button type="button" class="close" data-dismiss="modal">&times;</button>
    </div>
    <div class="modal-body">
        <div class="writeinfo"></div>   

        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-10">
                    @foreach($schools as $key=> $school)
                        <h4>{{$key}}</h4>
                        @foreach($school->sortBy('levelsInSession.level')->groupBy('levelsInSession.level') as $key=>$sessions)
                            <h5>{{$key}}</h5>
                            <table class="table">
                                <thead>
                                <tr>
                                    <th>Assign</th>
                                    <th>Day</th>
                                    <th>Time</th>
                                    <th>Unit</th>
                                    <th>Program</th>
                                </tr>
                                </thead>
                                <tbody>
                                {{--<tr>
                                    <td rowspan="{{$sessions->where('period.day.day', "Monday")->count() + 1}}">Monday</td>
                                </tr>--}}
                                @foreach($sessions->where('period.day.day', "Monday")->sortBy('period.time') as $session)
                                    <tr>
                                        <td>
                                            <a href="{{ url("assign") }}" class="btn btn-sm btn-success">Assign</a>
                                            <input name="assign" class="form-check-input" type="checkbox" value="{{ $session->id }}" id="flexCheckDefault" hidden>  
                                        </td>
                                        <td>Monday</td>
                                        <td>{{$session->period->time}}</td>
                                        <td>{{$session->unit->code}} {{is_null($session->room->lab_type_id) ? '': '(practical)'}}</td>
                                        <td>
                                            @foreach($session->unit->levelsInSession as $key=>$level)
                                                @if($key == 0)
                                                    {{$level->program->program_code}}
                                                @else
                                                    {{"/ ".$level->program->program_code}}
                                                @endif
                                            @endforeach
                                        </td>
                                    </tr>
                                @endforeach
                                {{--<tr>
                                    <td rowspan="{{$sessions->where('period.day.day', "Tuesday")->count() + 1}}">Tuesday</td>
                                </tr>--}}
                                @foreach($sessions->where('period.day.day', "Tuesday")->sortBy('period.time') as $session)
                                    <tr>
                                        <td><input class="form-check-input chk-submit" type="checkbox" value="{{ $session->id }}" id="flexCheckDefault"></td>
                                        <td>Tuesday</td>
                                        <td>{{$session->period->time}}</td>
                                        <td>{{$session->unit->code}} {{is_null($session->room->lab_type_id) ? '': '(practical)'}}</td>
                                        {{-- <td>{{($session->unit->levelsInSession->sum("num_students") - $session->unit->levelsInSession->sum("num_students") % $session->groups)/ $session->groups}}</td> --}}
                                        <td>
                                            @foreach($session->unit->levelsInSession as $key=>$level)
                                                @if($key == 0)
                                                    {{$level->program->program_code}}
                                                @else
                                                    {{"/ ".$level->program->program_code}}
                                                @endif
                                            @endforeach
                                        </td>
                                    </tr>
                                @endforeach
                                {{--<tr>
                                    <td rowspan="{{$sessions->where('period.day.day', "Wednesday")->count() + 1}}">Wednesday</td>
                                </tr>--}}
                                @foreach($sessions->where('period.day.day', "Wednesday")->sortBy('period.time') as $session)
                                    <tr>
                                        <td><input class="form-check-input btn-submit" type="checkbox" value="{{ $session->id }}" id="flexCheckDefault"></td>
                                        <td>Wednesday</td>
                                        <td>{{$session->period->time}}</td>
                                        <td>{{$session->unit->code}} {{is_null($session->room->lab_type_id) ? '': '(practical)'}}</td>
                                        {{-- <td>{{($session->unit->levelsInSession->sum("num_students") - $session->unit->levelsInSession->sum("num_students") % $session->groups)/ $session->groups}}</td> --}}
                                        <td>
                                            @foreach($session->unit->levelsInSession as $key=>$level)
                                                @if($key == 0)
                                                    {{$level->program->program_code}}
                                                @else
                                                    {{"/ ".$level->program->program_code}}
                                                @endif
                                            @endforeach
                                        </td>
                                    </tr>
                                @endforeach
                                {{--<tr>
                                    <td rowspan="{{$sessions->where('period.day.day', "Thursday")->count() + 1}}">Thursday</td>
                                </tr>--}}
                                @foreach($sessions->where('period.day.day', "Thursday")->sortBy('period.time') as $session)
                                    <tr>
                                        <td><input class="form-check-input btn-submit" type="checkbox" value="{{ $session->id }}" id="flexCheckDefault"></td>
                                        <td>Thursday</td>
                                        <td>{{$session->period->time}}</td>
                                        <td>{{$session->unit->code}} {{is_null($session->room->lab_type_id) ? '': '(practical)'}}</td>
                                        {{-- <td>{{($session->unit->levelsInSession->sum("num_students") - $session->unit->levelsInSession->sum("num_students") % $session->groups)/ $session->groups}}</td> --}}
                                        <td>
                                            @foreach($session->unit->levelsInSession as $key=>$level)
                                                @if($key == 0)
                                                    {{$level->program->program_code}}
                                                @else
                                                    {{"/ ".$level->program->program_code}}
                                                @endif
                                            @endforeach
                                        </td>
                                    </tr>
                                @endforeach
                                {{--<tr>
                                    <td rowspan="{{$sessions->where('period.day.day', "Friday")->count() + 1}}">Friday</td>
                                </tr>--}}
                                @foreach($sessions->where('period.day.day', "Friday")->sortBy('period.time') as $session)
                                    <tr>
                                        <td><input class="form-check-input btn-submit" type="checkbox" value="{{ $session->id }}" id="flexCheckDefault"></td>
                                        <td>Friday</td>
                                        <td>{{$session->period->time}}</td>
                                        <td>{{$session->unit->code}} {{is_null($session->room->lab_type_id) ? '': '(practical)'}}</td>
                                        {{-- <td>{{($session->unit->levelsInSession->sum("num_students") - $session->unit->levelsInSession->sum("num_students") % $session->groups)/ $session->groups}}</td> --}}
                                        <td>
                                            @foreach($session->unit->levelsInSession as $key=>$level)
                                                @if($key == 0)
                                                    {{$level->program->program_code}}
                                                @else
                                                    {{"/ ".$level->program->program_code}}
                                                @endif
                                            @endforeach
                                        </td>
                                    </tr>
                                @endforeach
                                {{--<tr>
                                    <td rowspan="{{$sessions->where('period.day.day', "Saturday")->count() + 1}}">Saturday</td>
                                </tr>--}}
                                @foreach($sessions->where('period.day.day', "Saturday")->sortBy('period.time') as $session)
                                    <tr>
                                        <td><input class="form-check-input btn-submit" type="checkbox" value="{{ $session->id }}" id="flexCheckDefault" name="assign" ></td>
                                        <td>Saturday</td>
                                        <td>{{$session->period->time}}</td>
                                        <td>{{$session->unit->code}} {{is_null($session->room->lab_type_id) ? '': '(practical)'}}</td>
                                        {{-- <td>{{($session->unit->levelsInSession->sum("num_students") - $session->unit->levelsInSession->sum("num_students") % $session->groups)/ $session->groups}}</td> --}}
                                        <td>
                                            @foreach($session->unit->levelsInSession as $key=>$level)
                                                @if($key == 0)
                                                    {{$level->program->program_code}}
                                                @else
                                                    {{"/ ".$level->program->program_code}}
                                                @endif
                                            @endforeach
                                        </td>
                                    </tr>
                                @endforeach
                                </tbody>
                            </table>
                            <div class="next-page"></div>
                        @endforeach
                    @endforeach

                </div>
            </div>
        </div>
    </div>
    {{-- <div class="modal-footer" style="background-color: maroon">
        <button type="submit" class="pull-right btn btn-sm btn-kabarak">Submit</button>
    </div> --}}
    </div>
    </form>

    </div>
    </div>

    <script>
        $(document).ready(function($){
            var CSRF_TOKEN = $('meta[name="csrf-token"]').attr('content');
            $(".assign").click(function(){
                e.preventDefault();
                
                $.ajax({
                    /* the route pointing to the post function */
                    url: '/assign',
                    type: 'POST',
                    /* send the csrf-token and the input to the controller */
                    data: {_token: CSRF_TOKEN, message:$(".chk-submit").val()},
                    dataType: 'JSON',
                    /* remind that 'data' is the response of the AjaxController */
                    success: function (data) { 
                        $(".writeinfo").append(data.msg); 
                    }
                }); 
            });

        })
    </script>