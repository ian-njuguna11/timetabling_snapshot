@extends('layouts.datatable')
@section('Page-Title')
    Upload Units
@endsection 

@section('content')
     <!-- Main content -->
     <section class="content m-20">
        <div class="container-fluid">
          <div class="row">
            <!-- left column -->
            <div class="col-md-12">
              <!-- jquery validation -->
              <div class="card flex">
                <div class="kabarak-card-header">
                    <div class="card-header text-center kabarak-card-header">
                        <h5>
                        <p><label for="csv_file" class="control-label text-center">Upload Units file</label></i></p>
                    </h5>
                    </div>          
                </div>
                <!-- /.card-header -->
                <!-- form start -->
                <form class="form-horizontal" method="POST" action="{{ route('units_import_parse') }}" enctype="multipart/form-data">
                    {{ csrf_field() }}

                    <div class="form-group{{ $errors->has('csv_file') ? ' has-error' : '' }}">
                        <label for="csv_file" class="col-md-6 control-label">Upload Unit</label>
                        <br >
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
                    </div>

                    <div class="form-group">
                        <div class="col-md-8 col-md-offset-4">
                            <button type="submit" class="btn btn-kabarak btn-sm">
                            <i class="fas fa-upload">&nbsp;Upload Units</i>
                            </button>
                            &nbsp;
                            &nbsp;
                            </button>
                        </div>
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
@section('jscontent')
    <script>
        $(document).ready(function() {
            $("#input-700").fileinput({
                uploadUrl: "/units_import",
                uploadExtraData:{'_token':"{{ csrf_token() }}",'id':$('#csv_file"').val()},
                maxFileCount: 1,
                previewFileType:'text',
                allowedFileExtensions:['txt','csv']
            });
        });
    </script>
@endsection
