@extends('layouts.datatable')
@section('Page-Title')
    Upload Lecturers
@endsection 


@section('content')
    <section class="content m-20">
        <div class="container-fluid">
          <div class="row">
            <!-- left column -->
            <div class="col-md-12">
              <!-- jquery validation -->
              <div class="card flex">
                <div class="card-header text-center kabarak-card-header">
                    <h5><label for="csv_file" class="control-label">Upload Lecturer file</label></></h5>
                </div>
                <br>
                <!-- /.card-header -->
                <!-- form start -->
                <div class="row justify-content-center">
                    <div  class="card-body">
                        <div>
                        <form class="form-horizontal" method="POST" action="{{ route('programs_import_parse') }}" enctype="multipart/form-data">
                            {{ csrf_field() }}

                            <div class="form-group{{ $errors->has('csv_file') ? ' has-error' : '' }}">
                                <div class="col-md-8">
                                    <input id="csv_file" type="file" class="form-control" name="csv_file" required>

                                    @if ($errors->has('csv_file'))
                                        <span class="help-block">
                                        <strong>{{ $errors->first('csv_file') }}</strong>
                                    </span>
                                    @endif
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-md-6 col-md-offset-4">
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox" name="header" checked> File contains header row?
                                        </label>
                                    </div>
                                </div>
                                <!-- /.row -->
                            </div>

                            <div class="form-group">
                                <div class="col-md-8 col-md-offset-4">
                                    <button type="submit" class="btn btn-kabarak btn-sm">
                                        &nbsp;
                                        <i class="fas fa-upload">&nbsp;Upload Lecturers</i>&nbsp;
                                    </button>
                                    &nbsp;
                                    <button  type="submit" class="btn btn-kabarak btn-sm">
                                        &nbsp;
                                        <a  href="/all-school-csv" class="text-white fas fa-download">&nbsp;Sample Document with ID's</a>
                                    </button>
                                </div>
                            </div>
                        </form>
                        </div>
                    </div>
                </div>
                
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

