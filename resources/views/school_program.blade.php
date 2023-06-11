@extends('layouts.datatable')
@section("title", "Programs")
@section('Page-Title')
Schools
@endsection
@section('content')
<!-- Content Header (Page header) -->
<!-- Main content -->

<!-- /.content -->
<!-- Main content -->
<section class="content m-10">
  <div class="flex" style="margin-bottom:10px; margin-top:-10px">
    <a href="{{url('locations')}}" class="btn-sm btn-kabarak btn"><span class="fas fa-arrow-left"></span>&nbsp;Back to Locations </a>&nbsp;
    <a class="btn-kabarak btn-sm btn" data-toggle="modal" data-target="#newSchoolModal"><span class="fas fa-plus"></span> &nbsp; Add new School </a>
  </div>
  <div class="modal fade" id="newSchoolModal" tabindex="-1" role="dialog" aria-labelledby="itemModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header kabarak-modal-header">
          <h3 class="card-title">Add new School</h3>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close" id="btnclose">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <div class="card card-primary">

            <!-- /.card-header -->
            <!-- form start -->
            <form id="quickForm" method="post" action="{{url('addschool')}}">
              {{csrf_field()}}
              <div class="card-body">
                <div class="form-group">
                  <label for="exampleInputEmail1">School Name</label>
                  <input type="text" name="name" class="form-control" id="exampleInputEmail1" placeholder="Enter school name">
                </div>

              </div>
              <!-- /.card-body -->
              <div class="card-footer">
                <button type="submit" class="btn btn-kabarak">Submit</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal" id="btnclose">Close</button>

              </div>
            </form>
          </div>

        </div>

      </div>
    </div>
  </div>

  <div id="tabs">
    <ul>
        @foreach ($schools as $school)
            <li><a href="#tabs-{{$school->id}}">{{$school->name}}</a></li>            
        @endforeach
    </ul>
    <div >
        <div id="tabs-{{$school->id}}" class="card-body">

            <table id="example3" class="display dataTable table-striped">
                <thead>
                <tr>
                    <th style="width: 5%">#</th>
                    <th style="width: 10%">Program Code</th>
                    <th style="width: 30%">Program</th>
                    <th style="width: 10%">Years</th>
                    <th style="width: 10%">Semester</th>
                    <th style="width: 40%" class="float-right">Actions</th>
                </tr>
                </thead>
                <tbody>
                @foreach($school_programs->programs as $program)
                    <tr>
                        <td>
                            <a>{{$program->id}}</a>
                        </td>
                        <td>
                            {{$program->program_code}}
                        </td>
                        <td>
                            <a>{{$program->name}}</a>
                        </td>
                        <td>
                            <a>{{$program->years}}</a>
                        </td>
                        <td>
                            <a>{{$program->semesters}}</a>
                        </td>
                        <td class="float-right">
                            <!-- <a class="btn btn-info btn-sm" href="{{url("viewupdateProgram/".$program->id)}}">
                                <i class="fas fa-pencil-alt">
                                </i>
                                View Units
                            </a> -->
                            <a class="btn btn-info btn-sm" href="{{url("viewupdateProgram/".$program->id)}}">
                                <i class="fas fa-pencil-alt">
                                </i>
                                Edit
                            </a>
                            <a class="btn btn-info btn-sm" href="{{url("levels/".$program->id)}}">
                                <i class="fas fa-cog">
                                </i>
                                Manage Units
                            </a>
                            <a class="btn btn-danger btn-sm" data-toggle="modal" data-target="#delete-{{$school->id}}">
                                <i class="fas fa-trash">
                                </i>
                                Delete
                            </a>

                            <div class="modal fade" id="delete-{{$school->id}}">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                    <div class="modal-header bg-danger-normal">
                                        <h4 class="modal-title">Confirm delete</h4>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <p>Do you really want to delete these records? This process cannot be undone. &hellip;</p>
                                    </div>
                                    <div class="modal-footer justify-content-between">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                                        <a href="{{ url('destroyProgram/'.$program->id)  }}" ><button type="button" class="btn btn-danger">Delete</button></a>
                                    </div>
                                    </div>
                                    <!-- /.modal-content -->
                                </div>
                                <!-- /.modal-dialog -->
                                </div>
                                <!-- /.modal -->

                        </td>
                    </tr>
                @endforeach
                </tbody>
            </table>
            <br>
            <br>
        </div>
    </div>

</section>
<!-- /.content -->

@endsection
@section('jscontent')
<script>

    $( function() {
        $( "#tabs" ).tabs();
    } );

  $(function() {
    $("#example1").DataTable({
      "responsive": true,
      "lengthChange": false,
      "autoWidth": false,
      "buttons": ["copy", "csv", "excel", "pdf", "print", "colvis"]
    }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');
    $('#example2').DataTable({
      "paging": true,
      "lengthChange": false,
      "searching": false,
      "ordering": true,
      "info": true,
      "autoWidth": false,
      "responsive": true,
    });
    $('#quickForm').validate({
      rules: {
        name: {
          required: true,
          name: true,
        },
      },
      messages: {
        name: {
          required: "Please enter a school name ",
          email: "Please enter a vaild school name "
        },

      },
      errorElement: 'span',
      errorPlacement: function(error, element) {

        error.addClass('invalid-feedback');
        element.closest('.form-group').append(error);
      },
      highlight: function(element, errorClass, validClass) {
        $(element).addClass('is-invalid');
      },
      unhighlight: function(element, errorClass, validClass) {
        $(element).removeClass('is-invalid');
      }
    });
  });

  var msg = '{{Session::get('
  alert ')}}';
  var exist = '{{Session::has('
  alert ')}}';
  if (exist) {
    alert(msg);
  }
</script>

});

@endsection