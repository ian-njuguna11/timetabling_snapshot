@extends('layouts.datatable')
@section('Page-Title')
Lecturers Timetable
@endsection
@section('content')
<div class="col-md-12">
    <!-- DIRECT CHAT PRIMARY -->
    <div class="card mt-22">
        <div class="card_title">
            <h5 class="">Available lecturer timetable</h5>
        </div>
        <div class="card-body">
            @foreach($departments as $department)
            @if($department->id > 0 )
            <div class="card-body p-0">
                <h6 style="margin-left: 10px; padding-top: 10px">{{$department->name}} Department</h6>
                <table id="example3" class="display dataTable table-striped">
                    <thead>

                        <tr>
                            {{-- <th style="width: 10%">
                                Code
                            </th> --}}
                            <th style="width: 20%">
                                First name
                            </th>
                            <th style="width: 20%">
                                Last name
                            </th>
                            <th class="float-right" style="width: 20%">
                                Actions
                            </th>
                        </tr>
                    </thead>
                    <tbody>




                        @foreach($lecturers as $lecturer)
                        @if($department->id == $lecturer->deparment_ID)
                        <tr>

                            <td>
                                {{-- {{$program->program_code}} --}}
                                <a>{{$lecturer->first_name}}</a>
                            </td>
                            <td>
                                {{-- {{$program->program_code}} --}}
                                <a>{{$lecturer->last_name}}</a>
                            </td>


                            <td class="project-actions text-left float-right">

                                {{-- @if ($lecturer->is_HOD == 0)
                                <a class="btn btn-info btn-sm" href="{{url('assignHod/'.$lecturer->id)}}">
                                    <i class="fas fa-gopuram">
                                    </i>
                                    Assign HOD
                                </a>
                                @else

                                <a class="btn btn-kabarak btn-sm" href="{{url('assignHod/'.$lecturer->id)}}">
                                    <i class="fas fa-gopuram">
                                    </i>
                                    Current HOD
                                </a>

                                @endif --}}
                                <a class="btn btn-info btn-sm" href="{{url('viewupdateLecturer/'.$lecturer->id)}}">
                                    <i class="fas fa-book
                                    ">
                                    </i>
                                    View Timetable
                                </a>
                               

                                <div class="modal fade" id="delete-{{$lecturer->id}}">
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
                                                <a href="{{url('delete-lecturer/'.$lecturer->id)}}"><button
                                                        type="button" class="btn btn-danger">Delete</button></a>
                                            </div>
                                        </div>
                                        <!-- /.modal-content -->
                                    </div>
                                    <!-- /.modal-dialog -->
                                </div>
                                <!-- /.modal -->
                            </td>
                        </tr>
                        @endif
                        @endforeach
                    </tbody>
                </table>
            </div>
            @endif
            @endforeach
        </div>
    </div>

    @endsection