@extends('layouts.datatable')
@section('Page-Title')
UPDATE {{ $data['name'] }}
@endsection
@section('content')


<!-- Main content -->
<section class="content m-20">
  <div class="container-fluid">
    <div class="row">
      <!-- left column -->
      <div class="col-md-12">
        <!-- jquery validation -->
        <div class="card ">
          <div class="card-header  kabarak-card-header">
            <h5><i class="fas fa-edit"></i> &nbsp; Edit Unit {{-- <i>{{ $Title }}</i> program {{ $name }} with id -> {{
              $Program }}--}}
            </h5>
          </div>
          <!-- /.card-header -->
          <!-- form start -->
          <form id="quickForm" method="POST" action="{{url('updateUnit/')}}">
            {{csrf_field()}}
            <div class="card-body">
              <div class="form-group">
                <input type="hidden" name="school_id" value="{{ $data['id'] }}">
                <div class="form-group">
                </div>

                <div class="card-body">
                  <form method="POST" action="{{url("updateUnit/")}}" class="form">
                    {{csrf_field()}}
                    <input type="hidden" name="id" value="{{$data['id']}}">
                    <div class="form-group">
                      <label for="programs">Unit Name</label>

                      <input value="{{ $data['name'] }}" type="text" id="program_name" class="form-control" name="name"
                        onkeyup="generateCode()" placeholder="name" required>
                    </div>
                    <div class="form-group">
                      <label for="programs">Unit Code</label>

                      <input value="{{ $data['code'] }}" type="text" id="program_name" class="form-control" name="code"
                        onkeyup="generateCode()" placeholder="name" required>
                    </div>


                    <div class="form-group">
                      <label for="lecture hrs">Lecture hrs</label>
                      <input type="number" value="{{ $data['lecture_hours'] }}" class="form-control" min="0"
                        name="lecture_hours" value="" placeholder="Lecture hours" required>
                    </div>

                    <div class="form-group">
                      <label for="lab hrs">Lab hrs</label>
                      <input type="number" value="{{ $data['lab_hours'] }}" class="form-control" min="0"
                        name="lab_hours" id="labHours" value="0" onkeyup="displayOrHideLabType()"
                        placeholder="Laboratory hours">
                    </div>
                    <div class="form-group" id="labTypeFields">
                      <label for="">Laboratory type:</label>
                      <select name="lab_type" id="" class="form-control">
                        @foreach($labs as $lab)
                        <option name="lab_type_id" value="{{$lab->id}},'Default'">
                          {{$lab->type}}

                        </option>
                        @endforeach
                      </select>
                    </div>
                    <button type="submit" class="btn btn-kabarak">Save</button>
                  </form>
                </div>
              </div>

            </div>
            <!-- /.card-body -->
            <div class="card-footer">

          </form>
        </div>
        <!-- /.card -->
      </div>
      <!--/.col (left) -->
      <!--/.col (right) -->
    </div>
    <!-- /.row -->
  </div><!-- /.container-fluid -->
</section>
<!-- /.content -->
@endsection