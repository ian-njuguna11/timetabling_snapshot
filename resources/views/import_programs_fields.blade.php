@extends('layouts.datatable')
@section('Page-Title')
    Uploaded Programs
@endsection 
@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <div class="panel panel-default">
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                    <strong>Congratulations!</strong> Programs CSV Import, Data imported successfully. <a
                        href="{{url('departments')}}"> GO BACK TO LIST OF DEPARTMENTS.</a>
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <div class="panel-body">
                    <form class="form-horizontal" method="POST" action="{{ route('programs_import_process') }}">
                        {{ csrf_field() }}
                        <input type="hidden" name="csv_data_file_id" value="{{ $csv_data_file->id }}" />
                        <table class="table">
                            @if (isset($csv_header_fields))
                            <tr>
                                @foreach ($csv_header_fields as $csv_header_field)
                                <th>{{ $csv_header_field }}</th>
                                @endforeach
                            </tr>
                            @endif
                            @foreach ($data as $row)
                            <tr>
                                @foreach ($row as $key => $value)
                                <td>{{ $value }}</td>
                                @endforeach
                            </tr>
                            @endforeach
                        </table>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection