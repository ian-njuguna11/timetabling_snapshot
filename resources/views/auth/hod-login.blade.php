@extends('layouts.basic')

@section('content')

<div class="login-box">
    
    <!-- /.login-logo -->
    <div class="card card-outline card-primary card-outline-kabarak">
    <div class="card-header text-center">
        <a class="h4"><b>Kabarak University</b><br>Timetabling</a>
    </div>
      <div class="card-body login-card-body">
        <p class="login-box-msg">Are you a HOD? Sign in to start your session</p>
  
        <form method="POST" action="{{ route('hod.login.submit') }}">
            @csrf
            <div class="input-group mb-3">
                <input id="email" placeholder="email "type="email" class="form-control{{ $errors->has('email') ? ' is-invalid' : '' }}" name="email" value="{{ old('email') }}" required autocomplete="email" autofocus>

                    @if ($errors->has('email'))
                        <span class="invalid-feedback" role="alert">
                            <strong>{{ $errors->first('email') }}</strong>
                        </span>
                    @endif
            </div>
          <div class="input-group mb-3">
            <input id="password" type="password" placeholder="password" class="form-control{{ $errors->has('password') ? ' is-invalid' : '' }}" name="password" required autocomplete="current-password">
                @if ($errors->has('password'))
                    <span class="invalid-feedback" role="alert">
                        <strong>{{ $errors->first('password') }}</strong>
                    </span>
                @endif
          </div>
          <div class="row">
            <div class="col-8">
              <div class="icheck-primary">
                <input type="checkbox" id="remember">
                <label for="remember">
                  Remember Me
                </label>
              </div>
            </div>
            <!-- /.col -->
            <div class="col-4">
              <button type="submit" class="btn btn-kabarak btn-block">Sign In</button>
            </div> 
            
            <!-- /.col -->
          </div>
        </form>
  
        {{-- <div class="social-auth-links text-center mb-3">
          <p>- OR -</p>
          <a href="#" class="btn btn-block btn-primary">
            <i class="fab fa-facebook mr-2"></i> Sign in using Facebook
          </a>
          <a href="#" class="btn btn-block btn-danger">
            <i class="fab fa-google-plus mr-2"></i> Sign in using Google+
          </a>
        </div>
        <!-- /.social-auth-links --> --}}
  
        <p class="mb-1">
          <a href="forgot-password.html">I forgot my password</a>
        </p>
        <p class="mb-0">
          <a href="register.html" class="text-center">Register a new membership</a>
        </p>
      </div>
      <!-- /.login-card-body -->
      {{-- <div class="col-12">
        <a href="/hods" class="btn btn-kabarak btn-block">Sign In as HOD</a>
      </div> --}}
    </div>
  </div>
  @endsection
