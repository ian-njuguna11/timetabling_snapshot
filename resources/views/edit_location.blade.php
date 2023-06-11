@extends('layouts.datatable')
@section('Page-Title')
Edit Location
@endsection
@section('content')

    <div class="card">
        <div class="card-header  kabarak-card-header">
        <h5><label for="programs">Building Name</label></h5>
        </div>

        <div class="card-body">
            <form  method="POST" action="{{url("editLocation/")}}" class="form">
                {{csrf_field()}}
                <input type="hidden" name="id" value="{{$data['id']}}">
                <div class="form-group">
                    <label for="programs"></label>
                </div>


                <div class="form-group">
                    <input value="{{ $data['location'] }}" type="text" id="program_name" class="form-control" name="name" onkeyup="generateCode()" placeholder="name" required>
                </div>




                <button type="submit" class="btn btn-sm btn-kabarak">Edit Location</button>
            </form>
        </div>
    </div>



@endsection
