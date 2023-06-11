@extends('layouts.datatable')
@section('Page-Title')
Lecturers
@endsection
@section('content')
<!-- Content Header (Page header) -->
<!-- Main content -->

<!-- /.content -->
<!-- Main content -->
<section class="content m-10">
  <div class="flex" style="margin-bottom:-30px; margin-top:-10px">
    <a href="{{url('schools')}}" class="btn-sm btn-kabarak btn"><span class="fas fa-arrow-left"></span>&nbsp;Back to list of Schools </a>&nbsp;
    <a class="btn btn-kabarak btn-sm" data-toggle="modal" data-target="#newProgramModal"><span class="fas fa-plus"></span>&nbsp; Add new lecturer </a>
    {{-- <a class="btn btn-kabarak btn-sm float-right" href="{{url('programs_imports')}}"> <i class="fas fa-pencil-alt"> </i> &nbsp; Upload lecturer </a> --}}
  </div>
  <div class="modal fade" id="newProgramModal" tabindex="-1" role="dialog" aria-labelledby="itemModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header kabarak-modal-header">
          <h3 class="card-title">Add new lecturers</h3>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close" id="btnclose">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <div class="card card-primary">



            <!-- /.card-header -->
            <!-- form start -->
          <form id="quickForm" method="post" action="{{url('add-lecturer')}}">
              {{csrf_field()}}
              <div class="card-body">

                
                
                <div class="form-group">
                  <label for="program-name">Lecturer first Name</label>
                  <input type="text" id="name" class="form-control" name="first_name" placeholder="eg. Andrew" required>
                </div>
                <div class="form-group">
                  <label for="program-name">Lecturer last Name</label>
                  <input type="text" id="name" class="form-control" name="last_name" placeholder="e.g Kebut" required>
                </div>

                <div class="form-group">
                  <label for="program-name">Lecturer Email</label>
                  <input type="text" id="name" class="form-control" name="lec_email" placeholder="e.g andrew@gmail.com" required>
                </div>

                <div class="form-group">
                  <label for="program-name">Password</label>
                  <input type="text" id="name" class="form-control" name="password" placeholder="e.g andrew123" required>
                </div>

                <div class="form-group">
                  <label for="school">Department</label>

                  <select name="department" id="school" class="form-control" onchange="checkSchoolOption()">
                    @foreach($departments as $department)
                      <option value="{{$department->id}}">{{$department->name}}</option>
                    @endforeach
                  </select>
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
  <br>
  <br>


  <!-- Default box -->
  <div class="card mt-22">
  {{-- @foreach($lecturers as $lecturer) --}}
      @foreach($departments as $department)
        @if($department->id > 0 )
          <div class="card_title">
            <h6 style="margin-left: 10px; padding-top: 10px">{{$department->name}} Department</h6>
          </div>
          <div class="card-body p-0">
          <table id="example3" class="display dataTable table-striped">
            <thead>
              
              <tr>
                {{-- <th style="width: 10%">
                  Code
                </th> --}}
                <th style="width: 20%">
                  First name
                </th>
                <th style="width: 20%">
                  Last name
              </th>
              <th style="width: 20%">
                Department
            </th>
                <th class="float-right" style="width: 20%">
                  Actions
                </th>
              </tr>
            </thead>
            <tbody>
              



              @foreach($lecturers as $lecturer)
                @if($department->id == $lecturer->deparment_ID)
                  <tr>

                    <td>
                      {{-- {{$program->program_code}} --}}
                      <a>{{$lecturer->first_name}}</a>
                    </td>
                    <td>
                      {{-- {{$program->program_code}} --}}
                      <a>{{$lecturer->last_name}}</a>
                    </td>
                    <td>
                      <a>{{$lecturer->deparment_ID}}</a>
                    </td>


                    <td class="project-actions text-left float-right">

                      @if ($lecturer->is_HOD == 0)
                        <a class="btn btn-info btn-sm" href="{{url('assignHod/'.$lecturer->id)}}">
                          <i class="fas fa-gopuram">
                          </i>
                          Assign HOD
                        </a>
                      @else

                        <a class="btn btn-kabarak btn-sm" href="{{url('assignHod/'.$lecturer->id)}}">
                          <i class="fas fa-gopuram">
                          </i>
                          Current HOD
                        </a>

                      @endif
                      <a class="btn btn-info btn-sm" href="{{url('viewupdateLecturer/'.$lecturer->id)}}">
                        <i class="fas fa-pencil-alt">
                        </i>
                        Edit
                      </a>
                      <a class="btn btn-danger btn-sm" data-toggle="modal" data-target="#delete-{{$lecturer->id}}">
                        <i class="fas fa-trash">
                        </i>
                        Delete
                      </a>

                      <div class="modal fade" id="delete-{{$lecturer->id}}">
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
                              <a href="{{url('delete-lecturer/'.$lecturer->id)}}"><button type="button" class="btn btn-danger">Delete</button></a>
                            </div>
                          </div>
                          <!-- /.modal-content -->
                        </div>
                        <!-- /.modal-dialog -->
                      </div>
                      <!-- /.modal -->
                    </td>
                  </tr>
                @endif
              @endforeach
            </tbody>
          </table>
         </div>
        @endif
      @endforeach
    {{-- @endforeach --}}
      <!-- /.card-body -->
    <br>
    <br>
  </div>
  <!-- /.card -->

</section>
<!-- /.content -->

@endsection
@section('jscontent')
<script>
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
  });
</script>
@endsection