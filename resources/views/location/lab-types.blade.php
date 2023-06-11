@extends('layouts.datatable')
@section('title', 'Programs')
@section('Page-Title')
    Lab Types
@endsection
@section('content')
    <!-- Content Header (Page header) -->
    <!-- Main content -->

    <!-- /.content -->
    <!-- Main content -->
    <section class="content m-10">
        <div class="flex" style="margin-bottom:10px; margin-top:-10px">
            <a href="{{ url('buildings') }}" class="btn-sm btn-kabarak btn"><span class="fas fa-arrow-left"></span>&nbsp;Back
                to buildings </a> &nbsp;
            <a class="btn btn-sm btn-kabarak" data-toggle="modal" data-target="#newLabTypeModal"><span
                    class="fas fa-plus"></span>&nbsp; Add lab type</a>
        </div>
        {{-- <br> --}}
        <div id="alert">
            @if ($message = Session::get('info'))
                <div class="alert alert-success">
                    <button type="button" data-dismiss="alert" class="close">
                        x
                    </button>
                    <strong style="color:white;">{{ $message }}</strong>
                </div>
            @endif
        </div>

        <div class="modal fade" id="newLabTypeModal" tabindex="-1" role="dialog" aria-labelledby="itemModalLabel"
            aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header kabarak-modal-header">
                        <h3 class="card-title">Add lab type</h3>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close" id="btnclose">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="card card-primary">
                            <!-- /.card-header -->
                            <!-- form start -->
                            <form id="quickForm" method="post" action="{{ url('addlabtype') }}">
                                {{ csrf_field() }}
                                <div class="card-body">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Lab type</label>
                                        <input type="text" name="type" class="form-control" id="exampleInputEmail1"
                                            placeholder=" e.g Chemistry" required>
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
                <h5 class="">Current Lab-types</h5>
            </div>
            <div class="card-body p-0">
                <table id="example3" class="display dataTable table-striped">
                    <thead>
                        <tr>
                            <th style="width: 40%">
                                Lab-type
                            </th>
                            <th class="float-right" style="width: 20%">
                                Actions
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($labs as $lab)
                            <tr>
                                <td>
                                    {{ $lab->type }}
                                </td>

                                <td class="project-actions text-right">
                                    <a class="btn btn-info btn-sm" href="{{ url('updateLabtype/' . $lab->id) }}">
                                        <i class="fas fa-pencil-alt">
                                        </i>
                                        Edit
                                    </a>
                                    <a class="btn btn-danger btn-sm" data-toggle=""
                                        data-target="#delete-{{ $lab->id }}">
                                        <i class="fas fa-trash">
                                        </i>
                                        Delete
                                    </a>

                                    <div class="modal fade" id="delete-{{ $lab->id }}">
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
                                                    <p>Do you really want to delete these record? This process cannot be
                                                        undone. &hellip;</p>
                                                </div>
                                                <div class="modal-footer justify-content-between">
                                                    <button type="button" class="btn btn-default"
                                                        data-dismiss="modal">Cancel</button>
                                                    <a href="{{ url('delete-labs/' . $lab->id) }}"><button type="button"
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

        });
    </script>

    });

    </script>
@endsection
