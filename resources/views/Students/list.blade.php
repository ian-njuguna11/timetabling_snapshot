@extends('layouts.datatable')
@section('Page-Title')
    Free Slots Timetable
@endsection

@section('content')
    <div class="input-group float-lefts" style="margin-bottom:7px; margin-left:-10px;">

        &nbsp;&nbsp;&nbsp;
        <div class="mt-22 input-group-prepend">
            <span class="input-group-text" id=""><span class="fas fa-search"></span>&nbsp; Search for Student.</span>
        </div>
        <input placeholder="search by name || Reg No " id="myInput" type="text" class="form-control">
        {{-- <input type="text" class="form-control"> --}}
    </div>


    @foreach ($students as $key => $value)
        <div class="card">
            <div class="card-header">
                <div class="card-title">
                </div>
            </div>
            <div class="card-body">
                <table class="table">
                    <thead>
                        <tr>
                            <th>First name</th>
                            <th>Last Name</th>
                            <th>Reg No</th>
                            <th>Program</th>
                        </tr>
                    </thead>
                  
                        <tbody id="myTable">
                            <tr>
                                <td>{{ $value->first_name }}</td>
                                <td>{{ $value->last_name }}</td>
                                <td>{{ $value->Reg_No }}</td>
                                <td>{{ $value->program->name }}</td>
                                <td>
                                    {{-- {{$value->period_id}},{{$value->room_id}}, {{ $value->id }} --}}
                                    
                                    
                                    {{-- This will take use to the attendance history of a student  --}}
                                    <a href="{{ url('student_metrics') }}" class="btn-sm btn-kabarak">
                        
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16">
                                            <path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.133 13.133 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.133 13.133 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5c-2.12 0-3.879-1.168-5.168-2.457A13.134 13.134 0 0 1 1.172 8z"/>
                                            <path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z"/>
                                          </svg>
                                        
                                    
                                       Monitor Attendance.
                                        </a>
                                    
                                </td>
                            </tr>

                        </tbody>
                </table>

            </div>
        </div>
       
    @endforeach
    <br><br><br>
@endsection

@section('jscontent')
    <script>
       
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
