@extends('layouts.datatable')
@section("title", "Programs")
@section('navcontent')
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
            <h5 class="card-title">Generate Timetable</h5> 
            <br>
            <br>
            <div class="container">
                <div class="row justify-content-center">
                    <form action="{{url('timetable/generate')}}" method="post" id="dataForm">
                        {{csrf_field()}}
                        <input type='hidden' id="submitPeriods" name="periods" value="">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="">Timetable Description</label>
                                    <textarea name="description" class="form-control" id="" cols="30" rows="3" placeholder="e.d May - August Timetable" required></textarea>
                                </div>

                                <div class="form-group">
                                    <label for="">Days in the timetable:</label>
                                    <input type="checkbox" id="all" checked="checked"> All <br>
                                    <input type="checkbox" name="mon" id="mon"> Monday
                                    <input type="checkbox" name="tue" id="tue"> Tuesday
                                    <input type="checkbox" name="wed" id="wed"> Wednesday
                                    <input type="checkbox" name="thur" id="thur"> Thursday
                                    <input type="checkbox" name="fri" id="fri"> Friday
                                    <input type="checkbox" name="sat" id="sat"> Saturday
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="">Teaching session periods</label>
                                    <div id="periods_mon">
                                        <h6>Monday:</h6>
                                        <div id="periods" class="row justify-content-center"></div>
                                    </div>
                                    <div id="periods_tue">
                                        <h6>Tuesday</h6>
                                        <div id="periods" class="row justify-content-center"></div>
                                    </div>
                                    <div id="periods_wed">
                                        <h6>Wednesday</h6>
                                        <div id="periods" class="row justify-content-center"></div>
                                    </div>
                                    <div id="periods_thur">
                                        <h6>Thursday</h6>
                                        <div id="periods" class="row justify-content-center"></div>
                                    </div>
                                    <div id="periods_fri">
                                        <h6>Friday</h6>
                                        <div id="periods" class="row justify-content-center"></div>
                                    </div>
                                    <div id="periods_sat">
                                        <h6>Saturday</h6>
                                        <div id="periods" class="row justify-content-center"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row justify-content-center">
                            <button class="btn btn-primary" value="" >Generate Timetable</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="newPeriodModal" tabindex="-1" role="dialog" aria-labelledby="itemModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Add Period</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" id="btnclose">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form class="form">
                        {{csrf_field()}}
                        <input type="hidden" name="day" id="modalDay">
                        <div class="form-group">
                            <label for="">Select where to place the new period</label>
                            <select name="periodPosition" id="periodPosition" class="form-control">

                            </select>
                        </div>

                        <div class="form-group">
                            <label for="">Start time</label>
                            <input type="text" class="form-control" name="start" id="period_start" required>
                        </div>

                        <div class="form-group">
                            <label for="">Start time</label>
                            <input type="text" class="form-control" name="end" id="period_end" required>
                        </div>

                        <div class="row justify-content-end">
                            <input type="button" class="btn btn-primary" value="Add" onclick="addPeriod()">
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>

@endsection
@section('jscontent')
    <script>
        var periods = {};

        function init(){
            var ids = ['mon', 'tue', 'wed', 'thur', 'fri', 'sat'];

            for(var id in ids){
                var day = "periods_"+ids[id];
                periods[day] = { 
                    1 :{time: "07:00 - 09:00"},
                    2: {time: "09:00 - 11:00"},
                    3: {time: "11:00 - 13:00"},
                    4: {time: "14:00 - 16:00"},
                    5: {time: "16:00 - 18:00"}
                };


            }


        }

        function removePeriod(day, period_id){
            var period_keys = Object.keys(periods[day]);
            var sliced = period_keys.slice(period_id - 1, period_keys.length - 1);

            for(var id in sliced){
                //alert(parseInt(sliced[id])+ 1);
                //alert(JSON.stringify(periods[day][sliced[id]+ 1]));
                periods[day][sliced[id]] = JSON.parse(JSON.stringify(periods[day][parseInt(sliced[id])+ 1]));
            }
            //alert(period_keys.pop());
            delete periods[day][period_keys.pop()];
            updateUI();
        }

        function newPeriodModal(day){
            $('#modalDay').val(day);
            var periods_dom = $('#periodPosition');
            periods_dom.empty();
            periods_dom.append("<option value='1'>Beginning</option>");
            Object.keys(periods[day]).map(function(key){
                periods_dom.append("<option value='"+ (parseInt(key) + 1) +"'>After "+ periods[day][key].time +"</option>");
            });

            $('#newPeriodModal').modal('show');

        }

        function addPeriod(){
            $('#newPeriodModal').modal('hide');
            // append a new object to the end
            var day = $('#modalDay').val();
            var position = parseInt($('#periodPosition').val());
            //alert(position);
            var period_keys = Object.keys(periods[day]);
            periods[day][period_keys.length + 1] = {};
            period_keys.push(period_keys.length + 1);

            var sliced = period_keys.slice(position - 1, period_keys.length);
            var start_time = $('#period_start').val();
            var end_time = $('#period_end').val();

            var previous_time = start_time + " - " + end_time;
            var current_time = "";
            for(var id in sliced){
                current_time = periods[day][sliced[id]].time;
                periods[day][sliced[id]] = {time: previous_time};
                previous_time = current_time;
            }

            updateUI();
        }

        function showOrHide(id){
            if($('#'+id).is(':checked')){
                $('#periods_'+ id).show();
            }else{

                $('#periods_'+ id).hide();
            }
        }

        function updateUI(){
            var ids = ['mon', 'tue', 'wed', 'thur', 'fri', 'sat'];

            var all_checked = true;
            for(var id in ids){
                showOrHide(ids[id]);
                if(!($('#'+ids[id]).is(':checked'))){
                    all_checked = false;
                }

                var period_id = "periods_"+ids[id];
                var period = $("#periods_"+ids[id]+"> #periods");
                period.empty();

                Object.keys(periods[period_id]).map(function(key){
                    var period_dom = "<div class='period'>"+ periods[period_id][key].time
                            + "<a href='#' onclick='removePeriod(\""+ period_id +"\","+ key +")'><i class=\"far fa-times-circle\"></i></a>"
                        + "</div>";
                    period.append(period_dom);
                });

                period.append("<a href='#' onclick='newPeriodModal(\""+ period_id +"\")'><i class=\"fas fa-plus\"></i></a>");
            }

            $('#submitPeriods').val(JSON.stringify(periods));

            if(all_checked){
                $('#all').prop('checked', true);
            }else{
                $('#all').prop('checked', false);
            }

        }

        function setListeners(){
            var ids = ['mon', 'tue', 'wed', 'thur', 'fri', 'sat'];

            for(var id in ids){
                $('#'+ids[id]).change(function(){
                    updateUI();
                });
            }

            $('#all').change(function(){
                checkOrUncheckAll();
            });
        }

        function checkOrUncheckAll(){
            var ids = ['mon', 'tue', 'wed', 'thur', 'fri', 'sat'];

            for(var id in ids){
                if($('#all').is(':checked')){
                    $('#'+ids[id]).prop('checked', true);
                }else{
                    $('#'+ids[id]).prop('checked', false);
                }
            }

            updateUI();
        }

        $(document).ready(function(){
            init();
            updateUI();
            setListeners();

            jQuery.datetimepicker.setLocale('en');

            $('#period_start').datetimepicker({
                datepicker:false,
                format:'H:i'
            });
            $('#period_end').datetimepicker({
                datepicker:false,
                format:'H:i'
            });

        });
    </script>
@endsection