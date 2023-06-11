@extends('layouts.datatable')
@section("title", "Programs")
@section('Page-Title')
    PDF PER ROOM
@endsection
@section('content')
    <!-- Content Header (Page header) -->
    <!-- Main content -->

    <!-- /.content -->
    <!-- Main content -->
    <section class="content m-10">
{{--        <a class="button_big cell" data-toggle="modal" data-target="#newSchoolModal"><span class="fas fa-plus"></span>Add new School </a>--}}
        <div class="modal fade" id="newSchoolModal" tabindex="-1" role="dialog" aria-labelledby="itemModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header kabarak-modal-header">
{{--                        <h3 class="card-title">Add new School</h3>--}}
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close" id="btnclose">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>


                </div>
            </div>
        </div>

        <!-- Default box -->
        <div class="card mt-22">
            <div class="card_title">
                <h5 class="">PDF PER ROOM</h5>
            </div>
            <div class="card-body p-0">
                <table id="example2" class="display dataTable">
                    <thead>
                    <tr>
                        <th style="width: 1%">
                            #
                        </th>
                        <th style="width: 20%">
                            Room Name
                        </th>
                        <th style="width: 20%">
                            Action
                        </th>
                    </tr>
                    </thead>
                    <tbody>
                    @foreach($files as $room)
                        <tr>
                            <td>
{{--                                {{$room->id}}--}}
                            </td>
                            <td>
                                {{$room->description}}
                            </td>


                            <td class="project-actions">
                                <a class="btn btn-kabarak btn-sm" href="{{url('timetable/room-pdf/'.$room->document_name)}}" >
                                    <i class="fas fa-download"></i>

                                    Download Room PDF
                                </a>
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
        $(function () {
            $("#example1").DataTable({
                "responsive": true, "lengthChange": false, "autoWidth": false,
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

        var msg = '{{Session::get('alert')}}';
        var exist = '{{Session::has('alert')}}';
        if(exist){
            alert(msg);
        }

    </script>

    });

@endsection