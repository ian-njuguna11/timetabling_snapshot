@extends('layouts.datatable_hod')
@section("title", "Cohorts")
@section('Page-Title')
Cohorts
@endsection

@section('content')

<div class="input-group float-lefts" style="margin-bottom:7px; margin-left:-10px;">

    &nbsp;&nbsp;&nbsp;
    <div class="mt-22 input-group-prepend">
        <span class="input-group-text" id=""><span class="fas fa-search"></span>&nbsp; Search for a cohort </span>
    </div>
    <input placeholder="e.g IT or Information Technology" id="myInput" type="text" class="form-control">
    {{-- <input type="text" class="form-control"> --}}
</div>

<!-- Default box -->
<div class="card mt-22">
    </div>

        <table id="example3" class="display dataTable table-striped">
            <thead>
                <tr>
                    <th style="width: 5%">
                        Code
                    </th>
                    <th style="width: 20%">
                        Stage
                    </th>
                    <th style="width: 20%">
                        Number of students
                    </th>
                    <th style="width: 20%">
                        In session/Not in session
                    </th>
                </tr>
            </thead>
            <tbody id="myTable">
                @foreach($program_levels
                 as $program)
                @foreach($program->levels as $level)
                <tr data-toggle="tooltip" title="Click to edit">
                    <td data-toggle="tooltip" data-placement="bottom" title="{{$program->name}}">{{$program->program_code}}</td>

                    <td>{{$level->level}}</td>
                    <td>
                        <input type="number" name="num_students" class="form-control" id="numStudents{{$level->id}}" value="{{$level->num_students}}" onchange="saveChange(parseInt('{{$level->id}}'))">
                    </td>
                    <td>
                        <input type="checkbox" name="in_session" id="inSession{{$level->id}}" {{$level->in_session ? 'checked' : ''}} onchange="saveChange(parseInt('{{$level->id}}'))">
                    </td>
                </tr>
                @endforeach
                @endforeach
            </tbody>
        </table>
    </div>
    <br>
    <br>
</div>
<!-- /.card -->


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

    });
</script>
<script>
    var Toast = Swal.mixin({
        toast: true,
        position: 'top-end',
        showConfirmButton: false,
        timer: 3000
    });

    function topBar(message) {
        $("<div />", {
                'class': 'topbar',
                text: message
            }).hide().prependTo('body')
            .slideDown('fast').delay(5000).slideUp(function() {
                $(this).remove();
            });
    }

    function submitChange(formData) {
        $.ajax({
            url: "{{url('editcohort')}}",
            type: "POST",
            data: formData,
            contentType: false,
            cache: false,
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            },
            processData: false,
            success: function(data) {
                console.log('success');
            },
            error: function(data) {
                //alert("Error");
                console.log('error');
            },
            complete: function(data) {
                toastr.success('Cohort updated successfully.')
            }
        });
    }

    function saveChange(id) {
        var num_students = $('#numStudents' + id).val();

        if (num_students < 0) {
            alert("Number of students cannot be less than zero");
            $('#numStudents' + id).val(0);
        } else {
            var formData = new FormData();
            formData.append("level_id", id);
            formData.append("num_students", num_students);

            if ($('#inSession' + id).is(':checked')) {
                //$(open_form + csrf + level_id + num_students + in_session + close_form).appendTo('body').submit().remove();

                formData.append("in_session", "on")
            } else {
                //$(open_form + csrf + level_id + num_students + close_form).appendTo('body').submit().remove();
            }
            submitChange(formData);
        }
    }

    $(document).ready(function() {
        $('#cohorts.table').DataTable();

        $.ajaxSetup({

            headers: {

                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')

            }

        });
    });

    function myFunction() {
        var input, filter, table, tr, td, i, txtValue;
        input = document.getElementById("myInput");
        filter = input.value.toUpperCase();
        table = document.getElementById("example2");
        tr = table.getElementsByTagName("tr");
        for (i = 0; i < tr.length; i++) {
            td = tr[i].getElementsByTagName("td")[0];
            if (td) {
                txtValue = td.textContent || td.innerText;
                if (txtValue.toUpperCase().indexOf(filter) > -1) {
                    tr[i].style.display = "";
                } else {
                    tr[i].style.display = "none";
                }
            }
        }
    }

    jQuery(function() {
        // $.post(
        jQuery('#s_cohorts').change(function() {
            this.form.submit();

        });
        // );

    });
</script>
<script>
  $(document).ready(function() {
    $("#myInput").on("keyup", function() {
      var value = $(this).val().toLowerCase();
      $("#myTable tr").filter(function() {
        $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
      });
    });
  });
</script>
@endsection