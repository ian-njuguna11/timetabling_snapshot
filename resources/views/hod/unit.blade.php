@extends('layouts.datatable_hod')
@section('Page-Title')
Units
@endsection

@section('navcontent')

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

@endsection

@section('content')

<div class="input-group float-lefts" style="margin-bottom:7px; margin-left:-10px;">

    &nbsp;&nbsp;&nbsp;
    <div class="mt-22 input-group-prepend">
        <span class="input-group-text" id=""><span class="fas fa-search"></span>&nbsp; Search for a unit...  </span>
    </div>
    <input placeholder="Start typing here..." id="myInput" type="text" class="form-control">
    {{-- <input type="text" class="form-control"> --}}
</div>



<!-- Default box -->
<div class="card mt-22">
    {{-- <div class="card_title">
        <h5 class=""></h5>
    </div> --}}
    <!-- Default box -->
    <div class="card_title">
        <h5 class="">Available Units</h5>
    </div>
    <div class="card-body p-0">

        <table id="example3" class="display dataTable table-striped">
            <thead>
                <tr>
                    <th style="width: 10%">
                        Unit Code
                    </th>
                    <th style="width: 40%">
                        Unit Name
                    </th>
                    <th class="float-right" style="width: 10%">
                        Actions
                    </th>
                </tr>
            </thead>
            <tbody id="myTable">
                @foreach($dept_units as $unit)
                <tr id="unitRow">
                    <td>
                        {{$unit->code}}
                    </td>
                    <td>
                        {{$unit->name}}
                    </td>

                    <td class="unit-actions float-right">
                        <a class="btn btn-info btn-sm" href="{{url('editUnit/'.$unit->id)}}">
                            <i class="fas fa-pencil-alt">
                            </i>
                            &nbsp;
                            Edit
                        </a>
                        <a href="view_merge/" onclick="mergeUnitsWindow({{$unit->id}})" class="btn btn-info btn-sm" href="{{url('editUnit/'.$unit->id)}}">
                            <i class="fas  fa-clone">
                            </i>
                            &nbsp;
                            Merge
                        </a>
                        <a class="btn btn-danger btn-sm" href="{{url('delete-unit/'.$unit->id)}}">
                            <i class="fas fa-trash">
                            </i>
                            &nbsp;
                            Delete
                        </a>
                    </td>
                </tr>
                @endforeach

            </tbody>
        </table>
        <div class="modal fade" id="newUnitModal" tabindex="-1" role="dialog" aria-labelledby="itemModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div style="background-color:#a83234" class="modal-header">
                        <h5 class="card-title">Add unit</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close" id="btnclose">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form method="post" action="{{url("addunit")}}" class="form">
                            {{csrf_field()}}
                            <div class="form-group">
                                <label for="program name">Program Name</label>
                                <select name="program" id="program" class="form-control" onchange="checkSchoolOption()">
                                    {{-- @foreach($programs as $program)
                                    <option value="{{$program->id}}">{{$program->name}}</option>
                                    @endforeach --}}
                            </div>
                            </select>
                    </div>
                    <!-- /.card -->
                    <div class="form-group">
                        <label for="">Unit code</label>
                        <input type="text" class="form-control" name="code" placeholder="Unit code" required>
                    </div>

                    <div class="form-group">
                        <label for="">Unit name</label>

                        <input type="text" class="form-control" name="name" placeholder="Unit name" required>
                    </div>

                    <div class="form-group">
                        <label for="">Lecture hours</label>

                        <input type="number" class="form-control" min="0" name="lecture_hours" value="45" placeholder="Lecture hours" required>
                    </div>

                    <div class="form-group">
                        <label for="">Laboratory hours</label>

                        <input type="number" class="form-control" min="0" name="lab_hours" id="labHours" value="0" onkeyup="displayOrHideLabType()" placeholder="Laboratory hours" required>
                    </div>

                    <div class="form-group" id="labTypeFields">
                        <label for="">Laboratory type:</label>
                        <select name="lab_type" id="" class="form-control">
                            {{-- @foreach($labs as $lab)
                            <option value="{{$lab->id}}">{{$lab->type}}</option>
                            @endforeach --}}
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
<br>
<br>
<br>
@endsection
@section('jscontent')
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
<script>
    var merge_units = [];
    var merge_to = undefined;
    var merging_state = false;

    function displayOrHideLabType() {
        if ($("#labHours").val() != 0) {
            $('#labTypeFields').show();
        } else {
            $('#labTypeFields').hide();
        }
    }

    function mergeUnitsWindow(unit_id) {
        var id = parseInt(unit_id);
        merge_to = id;
        merging_state = true;

        $('#checkBox' + id).hide();

        var merge_unit_code = $('#unitCode' + id).text();
        var merge_unit_name = $('#unitName' + id).text();

        $('#unitCode').html(merge_unit_code);
        $('#unitName').html(merge_unit_name);

        $('#mergeUnit').show();
        $('table .checkbox-for-merge').show();

        $('table .unit-actions').hide();

    }

    function cancelMerge() {
        $('#checkBox' + merge_to).show();

        $('#mergeUnit').hide();
        $('table .checkbox-for-merge').hide();

        $('table .unit-actions').show();
        merge_units = [];
        merging_state = false;
    }

    function addUnit(unit_id) {
        var id = parseInt(unit_id);

        if ($('#checkBox' + id).is(':checked')) {
            var row = "<tr id='addedUnit" + id + "'>" +
                "<td>" + $('#unitCode' + id).text() + "</td>" +
                "<td>" + $('#unitName' + id).text() + "</td>" +
                "</tr>";

            $('#unitsToMerge').append(row);
            merge_units.push(id);
        } else {
            $('#addedUnit' + id).remove();

            merge_units = $.grep(merge_units, function(value) {
                return value !== id;
            });
        }
    }

    function mergeUnits() {
        var csrf = '{{csrf_field()}}';
        var open_form = '<form action="{{url('
        merge - units ')}}" method="post">';
        var close_form = '</form>';
        var merge_id = "<input type='number' name='merge_to' value='" + merge_to + "'/>";
        var units = "<input type='text' name='units' value='" + merge_units + "'/>";

        $(open_form + csrf + merge_id + units + close_form).appendTo('body').submit().remove();
    }

    $(document).ready(function() {
        displayOrHideLabType();

        var table = $('#unitsTable.table');
        table.dataTable();
        //$('#mergeUnitsTable.table').dataTable();

        $('#mergeUnit').hide();
        $('table .checkbox-for-merge').hide();
        $('input').removeAttr('checked');

        table.on('draw.dt', function() {
            if (merging_state) {
                $('table .checkbox-for-merge').show();

                $('table .unit-actions').hide();
            } else {
                $('table .checkbox-for-merge').hide();

                $('table .unit-actions').show();
            }
        });
    });
</script>
@endsection