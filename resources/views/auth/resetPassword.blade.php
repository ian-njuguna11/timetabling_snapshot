@extends('layouts.basic')

@section('content')

<div class="login-box">
    
    <!-- /.login-logo -->
    <div class="card card-outline card-primary card-outline-kabarak">
    <div class="card-header text-center">
        <a class="h4"><b>Kabarak University</b><br>Timetabling</a>
    </div>
    
    @if(Session::has('passnotmatch'))
        <p class="alert {{ Session::get('alert-class', 'alert-danger') }}">{{ Session::get('passnotmatch') }}</p>
    @endif
    
      <div class="card-body login-card-body">
        <p class="login-box-msg">Please your new password here...</p>
    
        {{-- <p>{{ $userid }}</p> --}}
        <form method="POST" action="{{ url('passReset') }}">
            @csrf
            
            <input name="userId" type="number" value="{{ $userid }}" hidden>
            <input name="acctoken" type="text" value="{{ $acctoken }}" hidden>
            {{-- acctoken --}}
            
            <div class="">
                <label for="passord..."> Enter your new password. </label>
                <br>
                <input id="password" type="password" placeholder="eg Admin123" class="form-control{{ $errors->has('password') ? ' is-invalid' : '' }}" name="password" required autocomplete="current-password">
                    @if ($errors->has('password'))
                        <span class="invalid-feedback" role="alert">
                            <strong>{{ $errors->first('password') }}</strong>
                        </span>
                    @endif
            </div>
            <br>
            <div class="">
                <label for="confirm_password">Confirm password.</label>
                <br>
                <input id="password" type="password" placeholder="eg Admin123" class="form-control{{ $errors->has('password') ? ' is-invalid' : '' }}" name="confirmedpassword" required autocomplete="current-password">
                    @if ($errors->has('password'))
                        <span class="invalid-feedback" role="alert">
                            <strong>{{ $errors->first('password') }}</strong>
                        </span>
                    @endif
            </div>
            <br>
            <br>
            <!-- /.col -->
              <button type="submit" class="btn btn-kabarak col-12">Reset Password.</button>
            <!-- /.col -->
          </div>
        </form>
  
       
      </div>
    </div>
  </div>
  @endsection
