@extends('layouts.datatable')
@section('Page-Title')
{{$department->name}} Department Programs
@endsection
@section('content')
    <div class="modal fade" id="newProgramModal" tabindex="-1" role="dialog" aria-labelledby="itemModalLabel"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header kabarak-modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Create a program</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" id="btnclose">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="quickForm" method="post" action="{{url('add_department_program')}}">
                        {{csrf_field()}}
                        <div class="card-body">
                            <div class="form-group">
                                <label for="school">School</label>

                                <select name="school_id" id="school_id" class="form-control"
                                        onchange="checkSchoolOption()">
                                    @foreach($schools as $school)
                                        <option value="{{$school->id}}">{{$school->name}}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="form-group">
                                {{-- <label for="school">Departments</label> --}}
                                <input name="department_program" type="hidden" value="{{$department->id}}">
                            </div>

                            <div class="form-group">
                                <label for="program-name">Program Name</label>
                                <input type="text" id="name" class="form-control" name="name"
                                       onkeyup="generateCode()" placeholder="Program name" required>
                            </div>

                            <div class="form-group">
                                <label for="program-abbreviation">Program Abbreviation</label>
                                <input type="text" id="programCode" class="form-control" name="program_code"
                                       placeholder="Program Abbreviation" required>
                            </div>

                            <div class="form-group">
                                <label for="school">Number of Semesters in an Academic Year</label>
                                <input type="number" class="form-control" name="semesters" value=""
                                       placeholder="Number of semesters per academic year 2-3" required>
                            </div>
                            <div class="form-group">
                                <label for="school">Number of Academic Years</label>
                                <input type="text" class="form-control" name="years" value=""
                                       placeholder="Number of academic years 1-5" required>
                            </div>

                        </div>
                        <!-- /.card-body -->
                        <div class="card-footer">
                            <button type="submit" class="btn btn-kabarak">Submit</button>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal" id="btnclose">
                                Close
                            </button>

                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- <a href="{{url("schools")}}" class="btn btn-primary"><span class="oi oi-caret-left"></span> Go Back</a> -->
    <div class="flex"  style="margin-bottom:10px; margin-top:-10px">
        {{-- <a href="{{url('school-departments', ['id'=>1])}}" class="btn-sm btn-kabarak btn"><span class="fas fa-arrow-left"></span>&nbsp;Back to departments </a> --}}
        <a href="{{url('departments')}}" class="btn-sm btn-kabarak btn"><span class="fas fa-arrow-left"></span>&nbsp;Back to departments </a>
        <a data-toggle="modal" data-target="#newProgramModal" class="btn-sm btn-kabarak btn"><span class="fas fa-plus"></span>&nbsp;&nbsp;Add new Program </a>
        
        <a class="float-right btn btn-kabarak btn-sm"   href="{{ url('upload-DeptPrograms/'. $department->id) }}">
            <i class="fas fa-pencil-alt">
            </i>
            &nbsp;
            Upload Department Programs
        </a> 
    </div>    
    <div class="card">
        
        <div class="card-body">

            <table id="example3" class="display dataTable table-striped">
                <thead>
                <tr>
                    <th style="width: 10%">Program Code</th>
                    <th style="width: 40%">Program</th>
                    <th style="width: 10%">Years</th>
                    <th style="width: 10%">Semester</th>
                    <th style="width: 20%" class="float-right">Actions</th>
                </tr>
                </thead>
                <tbody>
                @foreach($programs as $program)
                    <tr>
                        <td>
                            {{$program->program_code}}
                        </td>
                        <td>
                            <a>{{$program->name}}</a>
                        </td>
                        <td>
                            <a>{{$program->years}}</a>
                        </td>
                        <td>
                            <a>{{$program->semesters}}</a>
                        </td>
                        <td class="float-right">
                            <a class="btn btn-info btn-sm" href="{{url("viewupdateProgram/".$program->id)}}">
                                <i class="fas fa-pencil-alt">
                                </i>
                                Edit
                            </a>
                            <a class="btn btn-info btn-sm" href="{{url("levels/".$program->id)}}">
                                <i class="fas fa-cog">
                                </i>
                                Manage Units
                            </a>
                            <a class="btn btn-danger btn-sm" data-toggle="modal" data-target="#delete-{{$department->id}}">
                                <i class="fas fa-trash">
                                </i>
                                Delete
                            </a>

                            <div class="modal fade" id="delete-{{$department->id}}">
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
                                        <a href="{{ url('destroyProgram/'.$program->id)  }}" ><button type="button" class="btn btn-danger">Delete</button></a>
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
            <br>
            <br>
        </div>
    </div>
@endsection
@section('jscontent')
    <script>
        function generateCode() {
            var name = $('#name').val();
            var words = name.split(" ");

            var code = "";
            for (var word in words) {
                code = code + words[word][0].toUpperCase();
            }

            $('#programCode').val(code);
        }

        $(document).ready(function () {
            $('#table').DataTable();
        });
    </script>
{{-- @endsection