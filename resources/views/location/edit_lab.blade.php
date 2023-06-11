@extends('layouts.datatable')
@section('Page-Title')
    Edit LabTypes
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
                &nbsp;
              <h5><i class="fas fa-edit"></i>Edit Lab type
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form id="quickForm" method="POST" action="{{url('editLabType/')}}">
              {{csrf_field()}}
                <div class="card-body">
                  <div class="form-group">
                    <label for="exampleInputEmail1">Lab type</label>
                    <input type="hidden" name="lab-id" value="{{ $data['id'] }}">
                    <input type="name" id="program_name"  name="type" class="form-control" id="exampleInputEmail1"  placeholder="Enter name" value="{{ $data['type'] }}" required>
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


