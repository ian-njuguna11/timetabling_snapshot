@extends('layouts.datatable')
@section('Page-Title')
All Programs
@endsection
@section('content')
<!-- Content Header (Page header) -->
<!-- Main content -->

<!-- /.content -->
<!-- Main content -->
<section class="content m-10">
    <div class="flex" style="margin-bottom:-30px; margin-top:-10px">
        <a href="{{url('schools')}}" class="btn-sm btn-kabarak btn"><span class="fas fa-arrow-left"></span>&nbsp;Back
            to list of Schools </a>&nbsp;
        <a class="btn btn-kabarak btn-sm" data-toggle="modal" data-target="#newProgramModal"><span
                class="fas fa-plus"></span>&nbsp; Add new Program </a>
    </div>
    <div class="modal fade" id="newProgramModal" tabindex="-1" role="dialog" aria-labelledby="itemModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header kabarak-modal-header">
                    <h3 class="card-title">Add new program</h3>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" id="btnclose">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="card card-primary">


                        <!-- /.card-header -->
                        <!-- form start -->
                        <form id="quickForm" method="post" action="{{url('addprogram')}}">
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
                                    <label for="school">Departments</label>

                                    <select name="department" id="department" class="form-control"
                                        onchange="checkSchoolOption()">
                                        @foreach($departments as $department)
                                        <option value="{{$department->id}}">{{$department->name}}</option>
                                        @endforeach
                                    </select>
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
    </div>
    <br>
    <br>


    @include('alert')
    <div class="input-group float-lefts" style="margin-bottom:7px; margin-left:-10px;">

        &nbsp;&nbsp;&nbsp;
        <div class="mt-22 input-group-prepend">
            <span class="input-group-text" id=""><span class="fas fa-search"></span>&nbsp; Search for a program name or code... </span>
        </div>
        <input placeholder="Start typing program code, name here..." id="myInput" type="text" class="form-control">
        {{-- <input type="text" class="form-control"> --}}
    </div>


    <!-- Default box -->
    <div class="card mt-22">
        <div class="card_title">
            <h5 class="">Available programs</h5>
        </div>


        <div class="card-body p-0">
            <table id="example3" class="display dataTable table-striped">
                <thead>
                    <tr>
                        <th style="width: 10%">
                            Code
                        </th>
                        <th style="width: 40%">
                            Program
                        </th>
                        <th style="width: 10%">
                            Semesters
                        </th>
                        <th style="width: 10%">
                            Academic years
                        </th>
                        <th class="float-right" style="width: 20%">
                            Actions
                        </th>
                    </tr>
                </thead>
                <tbody id="myTable">
                    @foreach($programs as $program)
                    <tr id = "programRow">

                        <td>
                            {{$program->program_code}}
                        </td>

                        <td>
                            {{-- {{$program->program_code}} --}}
                            <a>{{$program->name}}</a>
                        </td>
                        <td>
                            {{$program->semesters}}
                        </td>
                        <td>
                            {{$program->years}}
                        </td>
                        <td class="project-actions text-left float-right">
                            <a class="btn btn-info btn-sm" href="{{url('viewupdateProgram/'.$program->id)}}">
                                <i class="fas fa-pencil-alt">
                                </i>
                                Edit
                            </a>
                            <a class="btn btn-info btn-sm" href="{{url("levels/".$program->id)}}">
                                <i class="fas fa-cog">
                                </i>
                                Manage Units
                            </a>
                            <a class="btn btn-danger btn-sm" data-toggle="modal" data-target="#delete-{{$program->id}}">
                                <i class="fas fa-trash">
                                </i>
                                Delete
                            </a>

                            <div class="modal fade" id="delete-{{$program->id}}">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header bg-danger-normal">
                                            <h4 class="modal-title">Confirm delete</h4>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <p>Do you really want to delete these records? This process cannot be
                                                undone. &hellip;</p>
                                        </div>
                                        <div class="modal-footer justify-content-between">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">
                                                Cancel
                                            </button>
                                            <a href="{{url('destroyProgram/'.$program->id)}}">
                                                <button type="button" class="btn btn-danger">Delete</button>
                                            </a>
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

</section>
<!-- /.content -->

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
    $().alert('close');

        $(function () {
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
                errorPlacement: function (error, element) {
                    error.addClass('invalid-feedback');
                    element.closest('.form-group').append(error);
                },
                highlight: function (element, errorClass, validClass) {
                    $(element).addClass('is-invalid');
                },
                unhighlight: function (element, errorClass, validClass) {
                    $(element).removeClass('is-invalid');
                }
            });
        });
        })
        ;
</script>
@endsection