@extends('layouts.datatable')
@section("title", "Programs")
@section('Page-Title')
Rooms
@endsection
@section('content')
<!-- Content Header (Page header) -->
<!-- Main content -->
<section class="content m-10">
    <div class="flex" style="margin-bottom:10px; margin-top:-10px">
        <a href="{{url('buildings')}}" class="btn-sm btn-kabarak btn"><span class="fas fa-arrow-left"></span>&nbsp;Back to buildings </a> &nbsp;
        <a class="btn-kabarak btn btn-sm" data-toggle="modal" data-target="#newRoomModal"><span class="fas fa-plus"></span>&nbsp;Add new room </a>
    </div>
    <div id="alert">
        @if ($message = Session::get('info'))
            <div class="alert alert-success">
                <button type="button" data-dismiss="alert" class="close">
                    x
                </button>
                <strong style="color:white;">{{ $message }}</strong>
            </div>
        @endif
        @if ($message = Session::get('error'))
            <div class="alert alert-danger">
                <button type="button" data-dismiss="alert" class="close">
                    x
                </button>
                <strong style="color:white;">{{ $message }}</strong>
            </div>
        @endif
    </div>
    <div class="modal fade" id="newRoomModal" tabindex="-1" role="dialog" aria-labelledby="itemModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header kabarak-modal-header">
                    <h3 class="card-title">Add new room</h3>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" id="btnclose">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="card card-primary">
                        <!-- /.card-header -->
                        <!-- form start -->
                        <form id="quickForm" method="post" action="{{url('addroom#tab03')}}">
                            {{csrf_field()}}
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="">Room Building:</label>
                                            <select class="form-control" name="location_id" id="">
                                                @foreach($locations as $location)
                                                <option value="{{$location->id}}">{{$location->location}}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>
                                    <!-- /.col -->
                                    <div class="col-md-6">

                                        <!-- /.form-group -->
                                        <div class="form-group">
                                            <label for="">Room:</label>
                                            <input type="text" class="form-control" name="room_code" placeholder="Room Code e.g L1" required>
                                        </div>
                                        <!-- /.form-group -->
                                    </div>
                                    <!-- /.col -->
                                </div>
                                <!-- /.row -->

                                <div class="row">
                                    <div class="col-12 col-sm-6">
                                        <div class="form-group">
                                            <label for="">Room Capacity:</label>
                                            <input type="number" min="0" class="form-control" name="capacity" required>
                                        </div>
                                        <!-- /.form-group -->
                                    </div>
                                    <!-- /.col -->
                                    <div class="col-12 col-sm-6">
                                        <div class="form-group" id="labTypeFields">
                                            <label for="">Laboratory type:</label>
                                            <br>
                                            <select name="lab_type" class="form-control">
                                                @foreach($labs as $lab)
                                                <option value="{{$lab->id}}">{{$lab->type}}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>
                                    

                                    <!-- /.col -->
                                </div>
                                <div class="form-group">
                                    <label for="">Room Type:</label>
                                    <br>
                                    <input type="radio" name="type" value="lecture" onchange="displayOrHideLabType()" checked> Lecture <br>
                                    <input type="radio" id="labRadio" name="type" value="lab" onchange="displayOrHideLabType()"> Laboratory <br>
                                </div>
                                <!-- /.row -->

                            </div>
                            <!-- /.card-body -->
                            <div class="card-footer">
                                <button type="submit" class="btn btn-kabarak">Submit</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal" id="btnclose">Close</button>

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
            <h5 class="">Current Rooms</h5>
        </div>
        <div class="card-body p-0">
            <table id="example3" class="display dataTable table-striped">
                <thead>
                    <tr>
                        <th style="width: 10%">
                            Room
                        </th>
                        <th style="width: 35%">
                            Building
                        </th>
                        <th style="width: 7%">
                            Type
                        </th>
                        <th style="width: 7%">
                            Capacity
                        </th>
                        <th class="float-right" style="width: 15%">
                            Actions
                        </th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($rooms as $room)
                    <tr>
                        <td>
                            {{$room->room_code}}
                        </td>
                        <td>
                            {{$room->location->location}}
                        </td>
                        <td>
                            {{$room->type}}
                        </td>
                        <td>
                            {{$room->capacity}}
                        </td>
                        <td class="project-actions text-right">
                            <a class="btn btn-info btn-sm" href="{{url('edit-room/'.$room->id)}}">
                                <i class="fas fa-pencil-alt">
                                </i>
                                Edit
                            </a>
                            <a class="btn btn-danger btn-sm" data-toggle="modal" data-target="#delete-{{$room->id}}">
                                <i class="fas fa-trash">
                                </i>
                                Delete
                            </a>

                            <div class="modal fade" id="delete-{{$room->id}}">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header bg-danger-normal">
                                            <h4 class="modal-title">Confirm delete</h4>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <p>Do you really want to delete these record? This process cannot be undone. &hellip;</p>
                                        </div>
                                        <div class="modal-footer justify-content-between">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                                            <a href="{{url('delete-room/'.$room->id)}}"><button type="button" class="btn btn-danger">Delete</button></a>
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
    <br><br><br>
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

<script>
    function displayOrHideLabType() {
        if ($("#labRadio").is(':checked')) {
            $('#labTypeFields').show();
        } else {
            $('#labTypeFields').hide();
        }
    }
    $(function() {
        var $tabButtonItem = $('#tab-button li'),
            $tabSelect = $('#tab-select'),
            $tabContents = $('.tab-contents'),
            activeClass = 'is-active';
        $tabButtonItem.first().addClass(activeClass);
        $tabContents.not(':first').hide();
        $tabButtonItem.find('a').on('click', function(e) {
            var target = $(this).attr('href');
            $tabButtonItem.removeClass(activeClass);
            $(this).parent().addClass(activeClass);
            $tabSelect.val(target);
            $tabContents.hide();
            $(target).show();
            //e.preventDefault();
        });
        $tabSelect.on('change', function() {
            var target = $(this).val(),
                targetSelectNum = $(this).prop('selectedIndex');
            $tabButtonItem.removeClass(activeClass);
            $tabButtonItem.eq(targetSelectNum).addClass(activeClass);
            $tabContents.hide();
            $(target).show();
        });
        $(location.hash + "_").click();
    });
    $(document).ready(function() {
        $('#roomsTable').DataTable();
        displayOrHideLabType();
    });
</script>
@endsection