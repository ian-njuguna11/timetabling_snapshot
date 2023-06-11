@extends('layouts.datatable')
@section('Page-Title')
    Update {{ $lecturer->name }} Lecturer
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
                            <h5><i class="fas fa-edit"></i>&nbsp; EDIT {{ $lecturer->name }}
                            </h5>
                        </div>
                        <!-- /.card-header -->
                        <!-- form start -->
                        <form id="quickForm" method="POST" action="{{url('/editLecturer')}}" class="form">
                            {{csrf_field()}}
                            <input type="hidden" name="lecturer_id" value="{{ $lecturer['id'] }}">
                            <div class="card-body">
                                <div class="form-group">
{{--                                    <label for="lecturer">First Name</label>--}}
                                    <input value="{{ $lecturer["id"] }}" type="hidden" id="lec_id"
                                           class="form-control" name="lec_id"  required>
                                </div>
                                <div class="form-group">
                                    <label for="lecturer">First Name</label>
                                    <input value="{{ $lecturer["first_name"] }}" type="text" id="first_name"
                                           class="form-control" name="first_name" placeholder="Lecturer name" required>
                                </div>

                                <div class="form-group">
                                    <label for="programs">Last Name</label>
                                    <input value="{{ $lecturer['last_name'] }}" type="text" id="program_code"
                                           class="form-control" name="last_name" placeholder="Program Code" required>
                                </div>

                                <div class="form-group">
                                    <label for="programs">E-mail</label>
                                    <input value="{{ $lecturer['email'] }}" type="text" id="program_code"
                                           class="form-control" name="email" placeholder="Program Code" required>
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







