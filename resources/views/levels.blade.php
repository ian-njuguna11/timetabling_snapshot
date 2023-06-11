@extends('layouts.datatable')
@section('Page-Title')
{{ $program->name }} UNITS
@endsection
@section('navcontent')
<li>
    <a href="{{ url('schools') }}">Schools</a>
</li>
<li class="active">
    <a href="{{ url('programs') }}">Programs</a>
</li>
<li>
    <a href="{{ url('units') }}">Units</a>
</li>
<li>
    <a href="{{ url('cohorts') }}">Cohorts</a>
</li>
<li>
    <a href="{{ url('rooms') }}">Rooms</a>
</li>
<li>
    <a href="{{ url('timetable') }}">Timetable</a>
</li>
@endsection
@section('content')
<div class="flex" style="margin-bottom:10px; margin-top:-10px">
    <a href="{{ url('programs') }}" class="btn-sm btn-kabarak btn"><span class="fas fa-arrow-left"></span>&nbsp;Back to
        Programs </a>&nbsp;
</div>

<div class="input-group float-lefts" style="margin-bottom:7px; margin-left:-10px;">

    &nbsp;&nbsp;&nbsp;
    <div class="mt-22 input-group-prepend">
        <span class="input-group-text" id=""><span class="fas fa-search"></span>&nbsp; Search for a Unit </span>
    </div>
    <input placeholder="Search by Unit Code, Unit Name or Laboratory type " id="myInput" type="text"
        class="form-control">
</div>

<div class="card">
    <div class="card-body">
        <div class="card-header p-0 pt-1">
            <ul class="nav nav-tabs" id="custom-tabs-one-tab" role="tablist">
                <li class="nav-item active">
                    <a class="nav-link active" id="available-units" onclick="display()" data-toggle="pill"
                        href="#custom-tabs-one-home" role="tab" aria-controls="custom-tabs-one-home"
                        aria-selected="true">Available units in {{ $program->name }}</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" id="showUnits" onclick="displayUnits()" data-toggle="pill"
                        href="#custom-tabs-one-profile" role="tab" aria-controls="custom-tabs-one-profile"
                        aria-selected="false">Manage Units</a>
                </li>
            </ul>
        </div>

        <div class="tab-content" id="custom-tabs-one-tabContent">
            <div class="tab-pane fade show active" id="custom-tabs-one-home" role="tabpanel"
                aria-labelledby="custom-tabs-one-home-tab">
                <div class="row justify-content-center">
                    <div class="col-md-12">
                        <div>
                            @foreach ($program->levels as $level)
                            @if (count($level->units) > 0)
                            <br> <br>
                            <div class="card_title">
                                <h5>{{ $level->level }}</h5>
                            </div>
                            <div id="level{{ $level->level }}">
                                <table id="example3 programUnits table{{ $level->id }}"
                                    class="display dataTable table-striped">
                                    <thead>
                                        <tr>
                                            <th style="width:1%;">
                                                Check
                                            </th>
                                            {{-- <th id="badge " style="width:1%;">
                                                Status
                                            </th> --}}
                                            <th style="width:10%;">Unit Code</th>
                                            <th style="width:20%;">Unit Name</th>
                                            <th style="width:10%;">Lecture hours</th>
                                            <th style="width:10%;">Laboratory Hours</th>
                                            <th style="width:10%;">Laboratory type</th>
                                        </tr>
                                    </thead>
                                    <tbody id="myTable">
                                        {{-- {{dd($level->units)}} --}}
                                        @foreach ($level->units as $unit)
                                        <tr id="levelUnit{{ $unit->id }}">
                                            <td>
                                                <input type="checkbox" id="addedUnit{{ $level->id }}_{{ $unit->id }}">
                                            </td>

                                            {{-- {{dd((int)$unit->id)}} --}}

                                            {{-- Here I am --}}
{{-- 
                                            @if ((int)$unit->id !== 36)
                                            <td>
                                                <div id="repeatedUnit{{ $unit->id }}" class="card-tools">
                                                    <span title="repeated alert" class="badge btn-success">unique</span>
                                                </div>
                                            </td>
                                            @else
                                            <td>
                                                <div id="repeatedUnit{{ $unit->id }}" class="card-tools">
                                                    <span title="repeated alert"
                                                        class="badge btn-danger">repeated</span>
                                                </div>
                                            </td>
                                            @endif --}}


                                            <td>{{ $unit->code }}</td>
                                            <td>{{ $unit->name }}</td>
                                            <td>{{ $unit->lecture_hours }}</td>
                                            <td>{{ $unit->lab_hours }}</td>
                                            <td>{{ is_null($unit->lab_type) ? 'n/a' : $unit->lab_type->type }}
                                            </td>
                                        </tr>
                                        @endforeach
                                    </tbody>
                                </table>
                                <br>
                                <div class="row justify-content-start">
                                    <button class="btn btn-sm btn-kabarak" onclick="checkSelectedUnits">
                                        Add Unit(s)
                                    </button>
                                    &nbsp; &nbsp;
                                    <button class="btn btn-sm btn-danger"
                                        onclick="removeSelectedUnits({{ $level->id }})">Remove
                                        Selected
                                    </button>

                                </div>
                            </div>
                            @endif
                            {{-- @endif --}}
                            @endforeach
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-pane fade" id="custom-tabs-one-profile" role="tabpanel"
                aria-labelledby="custom-tabs-one-profile-tab">
                <div class="row justify-content-center" id="units">
                    <div class="col-md-12">
                        {{-- <div class="row justify-content-center">
                            <div class="col-md-7" style="margin-top: 10px;">
                                <b>Add Unit in Stage:</b>
                                <select name="" id="displayChooser" class="form-control" onchange="display()">
                                    @foreach ($program->levels as $level)
                                    <option value="{{ $level->id }}">{{ $level->level }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div> --}}
                        <br>
                        <table id="example3 unitsTable" class="display dataTable table-striped">
                            <thead>
                                <tr>
                                    <th>Check</th>
                                    <th>Unit Code</th>
                                    <th>Unit Name</th>
                                </tr>
                            </thead>
                            <tbody id="myTable">
                                @foreach ($units as $unit)
                                <tr id="unitRow{{ $unit->id }}">
                                    <td><input type="checkbox" id="unit{{ $unit->id }}"></td>
                                    <td>{{ $unit->code }}</td>
                                    <td>{{ $unit->name }}</td>
                                </tr>
                                @endforeach
                            </tbody>
                        </table>

                        <div class="modal fade" id="newUnitModal" tabindex="-1" role="dialog"
                            aria-labelledby="itemModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header kabarak-modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Add unit</h5>
                                        <button type="btn-kabarak btn btn-sm" class="close" data-dismiss="modal"
                                            aria-label="Close" id="btnclose">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <form method="post" action="{{ url('addunit') }}" class="form">
                                            {{ csrf_field() }}
                                            <div class="form-group">
                                                <label for="Unit Code">Unit Code</label>
                                                <input type="text" class="form-control" name="code"
                                                    placeholder="Unit code" required>
                                            </div>

                                            <div class="form-group">
                                                <label for="Unit Name">Unit Name</label>
                                                <input type="text" class="form-control" name="name"
                                                    placeholder="Unit name" required>
                                            </div>

                                            <div class="form-group">
                                                <label for="Lecture Hours">Lecture Hours</label>
                                                <input type="number" class="form-control" min="0" name="lecture_hours"
                                                    value="0" placeholder="Lecture hours" required>
                                            </div>

                                            <div class="form-group">
                                                <label for="Lab Code">Lab Hours</label>
                                                <input type="number" class="form-control" min="0" name="lab_hours"
                                                    value="0" id="labHours" onkeyup="displayOrHideLabType()"
                                                    placeholder="Laboratory hours" required>
                                            </div>

                                            <div class="form-group" id="labTypeFields">
                                                <label for="">Laboratory type:</label>
                                                <select name="lab_type" id="">
                                                    @foreach ($labs as $lab)
                                                    <option value="{{ $lab->id }}">{{ $lab->type }}
                                                    </option>
                                                    @endforeach
                                                </select>
                                            </div>

                                            <div class="row justify-content-end">
                                                <button class="btn btn-sm btn-kabarak">Add</button>
                                            </div>

                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <br>
                        <div class="input-group float-lefts" style="margin-bottom:7px; margin-left:-10px;">

                            &nbsp;&nbsp;&nbsp;
                            <div class="mt-22 input-group-prepend">
                                <span class="input-group-text" id=""><span class="fas fa-plus"></span>&nbsp; Add
                                    Selected Unit(s) to</span>
                            </div>
                            <div>
                                <select name="" id="displayChooser" class="form-control" onchange="display()">
                                    @foreach($program->levels as $level)
                                    <option value="{{$level->id}}">{{$level->level}}</option>
                                    @endforeach
                                </select>
                            </div>
                            &nbsp; &nbsp;
                            <button class="btn btn-sm btn-kabarak" onclick="checkSelectedUnits()"> Add Unit(s)</button>
                            &nbsp; &nbsp;
                            <button class="btn btn-kabarak btn-sm" data-toggle="modal"
                                data-target="#newUnitModal">Create Unit</button>
                        </div>
                        {{-- <div class="row justify-content-start">
                            <h5>Add selected units to;</h5>


                        </div> --}}
                    </div>
                </div>
            </div>
        </div>
        <br>
        <br>
    </div>

</div>

</div>



{{-- @endforeach --}}


<br>
<br>
<br>
@endsection
@section('jscontent')
<script>
    var current_level = undefined;
   

        function selectAddedUnits() {
            @foreach ($program->levels as $level)
                @foreach ($level->units as $unit)
                    if($('#addedUnits{{ $level->id }}').is(':checked')){            
                    $('#addedUnit{{ $level->id }}_{{ $unit->id }}').prop('checked', true);
                    }else{            
                    $('#addedUnit{{ $level->id }}_{{ $unit->id }}').prop('checked', false);
                    }
                @endforeach
            @endforeach

        }

        function hideEmptyLevels() {
            @foreach ($program->levels as $level)
                @foreach ($level->units as $unit)
                    if($('#levelUnit{{ $unit->id }}'.length= 0)){
                    $('#level{{ $level->id }}').hide();
                    }
                @endforeach
            @endforeach
        }

        function removeSelectedUnits(levelId) {
            var lev_id = levelId;

            console.log(lev_id)

            var selected_units = [];
            @foreach ($program->levels as $level)
                @foreach ($level->units as $unit)
                    if($('#addedUnit{{ $level->id }}_{{ $unit->id }}').is(':checked')){
                    selected_units.push(parseInt({{ $unit->id }}));
                    }
                @endforeach
            @endforeach


            var csrf = '{{ csrf_field() }}';
            var open_form = '<form action="{{ url('removelevelunits') }}" method="post">';
            var close_form = '</form>';
            var level_id = "<input type='number' name='level_id' value='" + lev_id + "'/>";
            var units = "<input type='text' name='units' value='" + selected_units + "'/>";

            $(open_form + csrf + level_id + units + close_form).appendTo('body').submit().remove();
        }

        function checkSelectedUnits() {
            var selected_units = [];
            @foreach ($units as $unit)
                if($('#unit{{ $unit->id }}').is(':checked')){
                selected_units.push(parseInt({{ $unit->id }}));
                }
            @endforeach

            var csrf = '{{ csrf_field() }}';
            var open_form = '<form action="{{ url('addlevelunits') }}" method="post">';
            var close_form = '</form>';
            var level_id = "<input type='number' name='level_id' value='" + current_level + "'/>";
            var units = "<input type='text' name='units' value='" + selected_units + "'/>";

            $(open_form + csrf + level_id + units + close_form).appendTo('body').submit().remove();
        }

        function checkAddedUnits() {
            @foreach ($units as $unit)
                if($('#levelUnit{{ $unit->id }}').length != 0){
                $('#unitRow{{ $unit->id }}').remove();
                }
            @endforeach
        }

        function displayUnits() {
            $('#units').show();
            //$('#showUnits').hide();
            $('#hideUnits').show();
        }

        function showUnitsInLevels() {
            var levelUnits = [];
            @foreach ($program->levels as $level)
                @foreach ($level->units as $unit)
                    if($('#addedUnits{{ $level->id }}').is(':checked')){
            
                    $('#addedUnit{{ $level->id }}_{{ $unit->id }}').prop('checked', true);
                    }else{
            
                    $('#addedUnit{{ $level->id }}_{{ $unit->id }}').prop('checked', false);
                    }
                @endforeach
            @endforeach

        }

        function displayRepeatedUnits() {
            var repeatedUnits = [];
            @foreach ($program->levels as $level)
                @foreach ($level->units as $unit)
                    if($('#addedUnits{{ $level->id }}').is(':checked')){
            
                    $('#addedUnit{{ $level->id }}_{{ $unit->id }}').prop('checked', true);
                    }else{
            
                    $('#addedUnit{{ $level->id }}_{{ $unit->id }}').prop('checked', false);
                    }
                @endforeach
            @endforeach

        }

        function hideUnits() {
            $('#units').hide();
            $('#showUnits').show();
            $('#hideUnits').hide();
        }

        function displayOrHideLabType() {
            if ($("#labHours").val() != 0) {
                $('#labTypeFields').show();
            } else {
                $('#labTypeFields').hide();
            }
        }

        function hide() {
            @foreach ($program->levels as $level)
                $('#level{{ $level->id }}').hide();
            @endforeach
        }

        function display() {
            hide();
            var value = $('#displayChooser').val();
            $('#level' + value).show();
            current_level = value;
        }
        $(document).ready(function() {

            //checkAddedUnits();
            @foreach ($program->levels as $level)
                $('#table{{ $level->id }}.table').dataTable();
            @endforeach

            $('#unitsTable.table').dataTable();
            display();

            displayOrHideLabType();
            hideUnits();

            @foreach ($program->levels as $level)
                $('#addedUnits{{ $level->id }}').change(function(){
                selectAddedUnits();
                });
            @endforeach

        });
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