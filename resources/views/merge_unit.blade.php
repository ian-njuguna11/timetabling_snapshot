@extends('layouts.datatable')
@section("title", "Programs")
@section('navcontent')
    <li>
        <a href="{{url("schools")}}">Schools</a>
    </li>
    <li>
        <a href="{{url("programs")}}">Programs</a>
    </li>
    <li class="active">
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

    <div class="card">
        <div class="card-body">
            <h4 class="card-title">All Units</h4>
            <div class="container-fluid">
                <div class="row justify-content-start">
                    <button class="btn btn-primary" data-toggle="modal" data-target="#newUnitModal">Create Unit</button>
                </div>
                <div class="row justify-content-center" id="units">
                    <div id="mergeUnit" class="col">
                        <div><h6 id="unitCode"></h6> <h6 id="unitName"></h6></div>

                        <a href="#" onclick="cancelMerge()">Cancel Merge</a>

                        <table class="table" id="mergeUnitsTable">
                            <thead>
                            <tr>
                                <th>Unit Code</th>
                                <th>Unit Name</th>
                            </tr>
                            </thead>
                            <tbody id="unitsToMerge">

                            </tbody>
                        </table>

                        <div class="row justify-content-center">
                            <button class="btn btn-primary" onclick="mergeUnits()">Merge units</button>

                        </div>
                    </div>
                    <div class="col">
                        <table class="table" id="unitsTable">
                            <thead>
                            <tr>
                                <th class="checkbox-for-merge">Select Units</th>
                                <th>Unit Code</th>
                                <th>Unit Name</th>
                                <th class="unit-actions">Actions</th>
                            </tr>
                            </thead>
                            <tbody>
                            @foreach($units as $unit)
                                <tr id="unitRow">
                                    <td class="checkbox-for-merge">
                                        <input type="checkbox" id="checkBox{{$unit->id}}" onclick="addUnit({{$unit->id}})">
                                    </td>
                                    <td id="unitCode{{$unit->id}}">{{$unit->code}}
                                    </td>
                                    <td id="unitName{{$unit->id}}">{{$unit->name}}</td>
                                    <td class="unit-actions">
                                        <td><a href="/schools/{{$unit->id}}/edit" class="btn btn-default"><span class="btn btn-primary">Update</span></a></td>
                                    </td>
                                </tr>
                            @endforeach
                            </tbody>
                        </table>

                        <div class="modal fade" id="newUnitModal" tabindex="-1" role="dialog" aria-labelledby="itemModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Add unit</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close" id="btnclose">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <form method="post" action="{{url("addunit")}}" class="form">
                                            {{csrf_field()}}
                                            <div class="form-group">
                                                <input type="text" class="form-control" name="code" placeholder="Unit code" required>
                                            </div>

                                            <div class="form-group">
                                                <input type="text" class="form-control" name="name" placeholder="Unit name" required>
                                            </div>

                                            <div class="form-group">
                                                <input type="number" class="form-control" min="0" name="lecture_hours" value="45" placeholder="Lecture hours" required>
                                            </div>

                                            <div class="form-group">
                                                <input type="number" class="form-control" min="0" name="lab_hours" id="labHours" value="0" onkeyup="displayOrHideLabType()" placeholder="Laboratory hours" required>
                                            </div>

                                            <div class="form-group" id="labTypeFields">
                                                <label for="">Laboratory type:</label>
                                                <select name="lab_type" id="" class="form-control">
                                                    @foreach($labs as $lab)
                                                        <option value="{{$lab->id}}">{{$lab->type}}</option>
                                                    @endforeach
                                                </select>
                                            </div>

                                            <div class="row justify-content-end">
                                                <button class="btn btn-primary">Add</button>
                                            </div>

                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


            </div>

        </div>
    </div>
@endsection
@section('jscontent')
    <script>

        var merge_units = [];
        var merge_to = undefined;
        var merging_state = false;

        function displayOrHideLabType(){
            if($("#labHours").val() != 0){
                $('#labTypeFields').show();
            }else{
                $('#labTypeFields').hide();
            }
        }

        function mergeUnitsWindow(unit_id){
            var id = parseInt(unit_id);
            merge_to = id;
            merging_state = true;

            $('#checkBox'+id).hide();

            var merge_unit_code = $('#unitCode'+id).text();
            var merge_unit_name = $('#unitName'+id).text();

            $('#unitCode').html(merge_unit_code);
            $('#unitName').html(merge_unit_name);

            $('#mergeUnit').show();
            $('table .checkbox-for-merge').show();

            $('table .unit-actions').hide();

        }

        function cancelMerge(){
            $('#checkBox'+merge_to).show();

            $('#mergeUnit').hide();
            $('table .checkbox-for-merge').hide();

            $('table .unit-actions').show();
            merge_units = [];
            merging_state = false;
        }

        function addUnit(unit_id){
            var id = parseInt(unit_id);

            if($('#checkBox'+id).is(':checked')){
                var row = "<tr id='addedUnit"+ id +"'>" +
                    "<td>"+ $('#unitCode'+id).text() +"</td>" +
                    "<td>"+ $('#unitName'+id).text() +"</td>" +
                    "</tr>";

                $('#unitsToMerge').append(row);
                merge_units.push(id);
            }else{
                $('#addedUnit'+ id).remove();

                merge_units = $.grep(merge_units, function(value){
                    return value !== id;
                });
            }
        }

        function mergeUnits(){
            var csrf = '{{csrf_field()}}';
            var open_form = '<form action="{{url('merge-units')}}" method="post">';
            var close_form = '</form>';
            var merge_id = "<input type='number' name='merge_to' value='"+ merge_to +"'/>";
            var units = "<input type='text' name='units' value='"+merge_units+"'/>";

            $(open_form + csrf + merge_id + units + close_form).appendTo('body').submit().remove();
        }

        $(document).ready(function(){
            displayOrHideLabType();

            var table = $('#unitsTable.table');
            table.dataTable();
            //$('#mergeUnitsTable.table').dataTable();

            $('#mergeUnit').hide();
            $('table .checkbox-for-merge').hide();
            $('input').removeAttr('checked');

            table.on('draw.dt', function(){
                if(merging_state){
                    $('table .checkbox-for-merge').show();

                    $('table .unit-actions').hide();
                }else{
                    $('table .checkbox-for-merge').hide();

                    $('table .unit-actions').show();
                }
            });
        });
    </script>
@endsection