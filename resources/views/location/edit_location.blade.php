@extends('layouts.datatable')
@section('Page-Title')
    Update {{ $data['location'] }} school
@endsection 
@section('content')


    <!-- Main content -->
    <section class="content m-20">
      <div class="container-fluid">
        <div class="row">
          <!-- left column -->
          <div class="col-md-6">
            <!-- jquery validation -->
            <div class="card ">
              <div class="card-header  kabarak-card-header">
              <h5><i class="fas fa-edit"></i>Edit building 
                </h5>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form id="quickForm" method="POST" action="{{url('editLocation/')}}">
              {{csrf_field()}}
                <div class="card-body">
                  <div class="form-group">
                    <label for="exampleInputEmail1">Name</label>
                    <input type="hidden" name="location_id" value="{{ $data['id'] }}">
                    <input type="name" id="program_name"  name="location" class="form-control" id="exampleInputEmail1" onkeyup="generateCode()" placeholder="Enter name" value="{{ $data['location'] }}" required>
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


