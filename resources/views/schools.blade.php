@extends('layouts.datatable')
@section('title', 'Programs')
@section('Page-Title')
    Schools
@endsection
@section('content')
    <!-- Content Header (Page header) -->
    <!-- Main content -->
    <section class="content m-10">
        <div class="flex" style="margin-bottom:10px; margin-top:-10px">
            <a href="{{ url('locations') }}" class="btn-sm btn-kabarak btn"><span class="fas fa-arrow-left"></span>&nbsp;Back
                to Locations </a>&nbsp;
            <a class="btn-kabarak btn-sm btn" data-toggle="modal" data-target="#newSchoolModal"><span
                    class="fas fa-plus"></span> &nbsp; Add new School </a>
            <br>
            <br>
            <div id = "alert">
                @if ($message = Session::get('info'))
                    <div class="alert alert-success">
                        <button type="button" data-dismiss="alert" class="close">
                            x
                        </button>
                        <strong style="color:white;">{{ $message }}</strong>
                    </div>
                @endif
            </div>


            {{-- @include('alert') --}}
        </div>
        <div class="modal fade" id="newSchoolModal" tabindex="-1" role="dialog" aria-labelledby="itemModalLabel"
            aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header kabarak-modal-header">
                        <h3 class="card-title">Add new School</h3>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close" id="btnclose">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="card card-primary">

                            <!-- /.card-header -->
                            <!-- form start -->
                            <form id="quickForm" method="post" action="{{ url('addschool') }}">
                                {{ csrf_field() }}
                                <div class="card-body">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">School Name</label>
                                        <input type="text" name="name" class="form-control" id="exampleInputEmail1"
                                            placeholder="Enter school name">
                                    </div>

                                </div>
                                <!-- /.card-body -->
                                <div class="card-footer">
                                    <button type="submit" class="btn btn-kabarak">Submit</button>
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal"
                                        id="btnclose">Close</button>

                                </div>
                            </form>
                        </div>

                    </div>

                </div>
            </div>
        </div>

        <!-- Default box -->
        <div class="card mt-22">
            <div class="card_title">
                <h5 class="">Available schools</h5>
            </div>
            <div class="card-body p-0">
                <table id="example3" class="display dataTable table-striped">
                    <thead>
                        <tr>
                            <th style="width: 40%">
                                School Name
                            </th>
                            <!-- <th class="float-right" style="width: 20%">
                  Actions
                </th> -->
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($schools as $school)
                            <tr>
                                <td>
                                    {{ $school->name }}
                                </td>
                                <td>
                                    <!-- <a href="{{ url('edit-school/' . $school->id) }}">{{ $school->name }}</a> -->
                                </td>
                                <td class="project-actions text-right">
                                    <!--  -->
                                    <a class="btn btn-info btn-sm" href="{{ url('edit-school/' . $school->id) }}">
                                        <i class="fas fa-search-location">
                                        </i>
                                        &nbsp;
                                        Location
                                    </a>

                                    <a class="btn btn-info btn-sm" href="{{ url('school-departments/' . $school->id) }}">
                                        <i class="fas fa-pencil-alt">
                                        </i>
                                        &nbsp;
                                        Departments
                                    </a>

                                    <a class="btn btn-info btn-sm" href="{{ url('updateSchool/' . $school->id) }}">
                                        <i class="fas fa-pencil-alt">
                                        </i>
                                        &nbsp;
                                        Edit
                                    </a>
                                    <a class="btn btn-danger btn-sm" data-toggle="modal"
                                        data-target="#delete-{{ $school->id }}">
                                        <i class="fas fa-trash">
                                        </i>
                                        &nbsp;
                                        Delete
                                    </a>



                                    <div class="modal fade" id="delete-{{ $school->id }}">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header bg-danger-normal">
                                                    <h4 class="modal-title">Confirm delete</h4>
                                                    <button type="button" class="close" data-dismiss="modal"
                                                        aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    <p>Do you really want to delete these records? This process cannot be
                                                        undone. &hellip;</p>
                                                </div>
                                                <div class="modal-footer justify-content-between">
                                                    <button type="button" class="btn btn-default"
                                                        data-dismiss="modal">Cancel</button>
                                                    <a href="{{ url('deleteSchool/' . $school->id) }}"><button type="button"
                                                            class="btn btn-danger">Delete</button></a>
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
        </div>
        <!-- /.card -->

    </section>
    <!-- /.content -->

@endsection
@section('jscontent')
    <script>
        $('div.alert').not('.alert-important').delay(3000).fadeOut(350);
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

        var msg = '{{ Session::get('
          alert ') }}';
        var exist = '{{ Session::has('
          alert ') }}';
        if (exist) {
            alert(msg);
        }
    </script>

    });

@endsection
