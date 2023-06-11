@extends('layouts.datatable')
@section('Page-Title')
    Update {{ $data['name'] }} Program
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
              <h5><i class="fas fa-edit"></i>&nbsp; EDIT {{ $data['name'] }} {{--       <i>{{ $Title }}</i> program {{ $name }} with id -> {{ $Program }}--}}
                </h5>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form id="quickForm"  method="POST" action="{{url('/editProgram')}}" class="form">
              {{csrf_field()}}
              <input type="hidden" name="school_id" value="{{ $data['id'] }}">
              <div class="card-body">
                <div class="form-group">
                  <label for="programs">Program Name</label>

                <input  value="{{ $data["name"] }}" type="text" id="name" class="form-control" name="name" placeholder="Semester" required>
              </div>

                <div class="form-group">
                    <label for="programs">Program Code</label>
                    <input  value="{{ $data['program_code'] }}" type="text" id="program_code" class="form-control" name="program_code" placeholder="Program Code" required>
                </div>

                <div class="form-group">
                  <label for="programs">Semesters in an academic years</label>

                  <input  value="{{ $data['semesters'] }}" type="text" id="semesters" class="form-control" name="semesters" placeholder="Semester" required>
              </div>


                <div class="form-group">
                    <label for="programs">Number of academic years</label>
                    <input type="text" class="form-control" name="years" value="{{ $data['years'] }}"
                           placeholder="Number of academic years" required>
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







