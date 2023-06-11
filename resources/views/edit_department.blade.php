@extends('layouts.datatable')
@section('Page-Title')
    Update {{ $params['name'] }} Department
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
              <h5><i class="fas fa-edit"></i>Edit department {{--       <i>{{ $Title }}</i> program {{ $name }} with id -> {{ $Program }}--}}
                </h5>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form id="quickForm" method="POST" action="{{url('update-department/')}}">
              {{csrf_field()}}
                <div class="card-body">
                  <div class="form-group">
                    <label for="exampleInputEmail">Department name</label>
                    <input type="hidden" name="department_id" value="{{ $params['id'] }}">
                    <input type = "text" name = "name" class="form-control" placeholder="Enter name" value="{{ $params['name'] }}" required>
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