@extends('layouts.datatable')
@section('Page-Title')
    Edit Room
@endsection
@section('content')

    <div class="card">
        <div class="card-header  kabarak-card-header">
            <label for="programs">Room Name</label>
        </div>

        <div class="card-body">
            <form  method="POST" action="{{url("editRooms/")}}" class="form">
                {{csrf_field()}}
                <input type="hidden" name="id" value="{{$data['id']}}">
                <div class="form-group">
                    <label for="programs"></label>
                </div>


                <div class="form-group">

                    <input value="{{ $data['room_code'] }}" type="text" id="program_name" class="form-control" name="name" onkeyup="generateCode()" placeholder="name" required>
                </div>




                <button type="submit" class="btn btn-small btn-kabarak">Edit Location</button>
            </form>
        </div>
    </div>



@endsection
