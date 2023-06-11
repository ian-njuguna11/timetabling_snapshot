
@extends('layouts.datatable')
@section('Page-Title')
    UPDATE {{ $data['name'] }} SCHOOL
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
              <h5><i class="fas fa-edit"></i>Edit school {{--       <i>{{ $Title }}</i> program {{ $name }} with id -> {{ $Program }}--}}
                </h5>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form id="quickForm" method="POST" action="{{url('editSchool/')}}">
              {{csrf_field()}}
                <div class="card-body">
                  <div class="form-group">
                    <label for="exampleInputEmail1">School name</label>
                    <input type="hidden" name="school_id" value="{{ $data['id'] }}">
                    <!-- <input type="name" id="program_name"  name="name" class="form-control" id="exampleInputEmail1" onkeyup="generateCode()" placeholder="Enter name"  requiredvalue="{{ $data['name'] }}"> -->
                    <input type = "text" name = "name" class="form-control" placeholder="Enter name" value="{{ $data['name'] }}" required>
                  </div>
                  
                </div>
                <!-- /.card-body -->
                <div class="card-footer">
                  <button type="submit" class="btn btn-kabarak">Save</button>
                </div>
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


