@extends('layouts.basic')

@section('content')

<div class="login-box">
    
    <!-- /.login-logo -->
    <div class="card card-outline card-primary card-outline-kabarak">
    <div class="card-header text-center">
        <a class="h4"><b>Kabarak University</b><br>Timetabling</a>
    </div>
    
    @if(!empty($emailResetFailure))
        <div class="alert alert-danger" > {{ $emailResetFailure }}</div>
    @endif
    
    @if(!empty($emailResetSuccess))
        <div class="alert alert-success" > {{ $emailResetSuccess }}</div>
    @endif
    
      <div class="card-body login-card-body">
        <p class="login-box-msg">Please Enter your Email Here...</p>
    

        <form method="POST" action="{{ url('password-reset') }}">
            @csrf
            <div class="input-group mb-3">
                <input id="email" placeholder="email "type="email" class="form-control{{ $errors->has('email') ? ' is-invalid' : '' }}" name="email" value="{{ old('email') }}" required autocomplete="email" autofocus>
            </div>

            <!-- /.col -->
              <button type="submit" class="btn btn-kabarak col-12">Request Password Reset.</button>
            <!-- /.col -->
          </div>
        </form>
  
       
      </div>
    </div>
  </div>
  @endsection
