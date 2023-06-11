@extends('layouts.datatable_lecturers')
@section('Page-Title')
Room Timetable
@endsection

@section('content')

<!-- Default box -->
<div class="card mt-22">
    <!-- Default box -->
    <div class="card_title">
        <h5 class="">Available Units</h5>
    </div>
    <div class="card-body p-0">

        <table id="example3" class="display dataTable table-striped">
            <thead>
                <tr>
                    <th >
                        Unit Code
                    </th>
                    <th >
                        Unit Name
                    </th>
                    <th >
                        Actions
                    </th>
                </tr>
            </thead>
            <tbody id="myTable">
                @foreach($units as $unit)
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
    </div>
</div>
    
@endsection


