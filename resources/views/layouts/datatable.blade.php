    <!DOCTYPE html>
    <html lang="en">

    <head>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

        {{-- <meta charset="utf-8"> --}}
        {{-- <meta name="viewport" content="width=device-width, initial-scale=1"> --}}
        {{-- <title>jQuery UI Tabs - Default functionality</title> --}}
        <link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
        <link rel="stylesheet" href="{{asset('css/style.css')}}">
        <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
        <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.js" integrity="sha512-CTSrPIDxxtTdaIYlTKHEyvHa+70TOhC1pY3PLDgrUqCFifFtV7KrucZCvPy2K7hB0HtKgt0r4INTGBISqnaLNg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/laravel-echo/1.15.2/echo.js" integrity="sha512-Sl4N4gyjM9NG4XKXIs6VMJc1wng99fzpFvuQIfiTPS+/WfIl3o4Gw/Vkh9qjV0HAHizA9xSmocpuiqbHy0CjBA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Kabarak University | Timetabling</title>
        <meta name="csrf-token" content="{{ csrf_token() }}">
        <link rel="shortcut icon" type="image/jpg" href="/public/dist/img/favicon.ico" />


        <!-- Google Font: Source Sans Pro -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="{{asset('plugins/fontawesome-free/css/all.min.css')}}">
        <!-- Ionicons -->
        <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
        <!-- Tempusdominus Bootstrap 4 -->
        <link rel="stylesheet" href="{{asset('plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css')}}">
        <!-- iCheck -->
        <link rel="stylesheet" href="{{asset('plugins/icheck-bootstrap/icheck-bootstrap.min.css')}}">
        <!-- JQVMap -->
        <link rel="stylesheet" href="{{asset('plugins/jqvmap/jqvmap.min.css')}}">
        <!-- Theme style -->
        <link rel="stylesheet" href="{{asset('dist/css/adminlte.css')}}">
        <link rel="stylesheet" href="{{asset('dist/css/datatable-ui.css')}}">
        <!-- overlayScrollbars -->
        <link rel="stylesheet" href="{{asset('plugins/overlayScrollbars/css/OverlayScrollbars.min.css')}}">
        <!-- Daterange picker -->
        <link rel="stylesheet" href="{{asset('plugins/daterangepicker/daterangepicker.css')}}">
        <!-- summernote -->
        <link rel="stylesheet" href="{{asset('plugins/summernote/summernote-bs4.min.css')}}">
        <!-- SweetAlert2 -->
        <link rel="stylesheet" href="{{asset('plugins/sweetalert2-theme-bootstrap-4/bootstrap-4.min.css')}}">
        <!-- Toastr -->
        <link rel="stylesheet" href="{{asset('plugins/toastr/toastr.min.css')}}">
        <link href="{{ asset('upload-plugins/css/fileinput.min.css') }}" media="all" rel="stylesheet" type="text/css" />

        {{-- <!-- Twitter bootstrap Laravast/flash messages styling -->
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"> --}}
      
    </head>
    

    <body class="hold-transition sidebar-mini layout-fixed">
        <div class="wrapper">

            <!-- Preloader -->
            <div class="preloader flex-column justify-content-center align-items-center">
                <img class="animation__shake" src="{{asset('dist/img/kabu-logo.jpeg')}}" alt="KABULogo" height="60" width="60">
            </div>

            <!-- Navbar -->
            <nav class="main-header navbar navbar-expand navbar-white navbar-light">
                <!-- Left navbar links -->
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
                        {{-- <button class="btn btn-primary" data-widget="pushmenu" data-auto-collapse-size="768">Toggle Sidebar</button>--}}
                    </li>
                    <li class="nav-item d-none d-sm-inline-block">
                        <a class="nav-link">@yield('Page-Title')</a>
                    </li>
                </ul>

                <!-- Right navbar links -->
                <ul class="navbar-nav ml-auto">
                    <!-- Navbar Search -->
                </ul>
                <!-- Right navbar links -->
                <ul class="navbar-nav ml-auto">
                    <!-- Navbar Search -->
                    <li>
                        <a class="nav-link" href="{{url('logout')}}">Logout</a>
                    </li>
                </ul>
            </nav>
            <!-- /.navbar -->
            

            <!-- Main Sidebar Container -->
            <aside class="p-3 mb-2 bg-danger text-white main-sidebar sidebar-dark-primary elevation-4" style="text-color:white">
                <!-- Brand Logo -->
                {{-- <a href="/home" class="brand-link">--}}
                {{-- <img src="{{asset('dist/img/kabu-logo.jpeg')}}" alt="KABU Logo" class="brand-image img-circle elevation-3" style="opacity: .8">--}}
                {{-- <span class="brand-text font-weight-light">KABU Timetabler</span>--}}
                {{-- </a>--}}

                <!-- Sidebar -->
                <div class="sidebar">
                    <!-- Sidebar user panel (optional) -->
                    <div class="user-panel mt-3 pb-3 mb-3 d-flex">
                        <div class="image">
                            <img src="/uploads/{{ Auth::user()->avatar }}"   class="img-circle elevation-2" alt="User Image">
                        </div>
                        <div class="info">
                            <a href="#" class="d-block" data-toggle="modal" data-target="#myModal">{{session('name') }}</a>
                        </div>
                    </div>

                    <!-- SidebarSearch Form -->
                    {{-- <div class="form-inline">
                    <div class="input-group" data-widget="sidebar-search">
                        <input class="form-control form-control-sidebar" type="search" placeholder="Search" aria-label="Search">
                        <div class="input-group-append">
                            <button class="btn btn-sidebar">
                                <i class="fas fa-search fa-fw"></i>
                            </button>
                        </div>
                    </div>
                </div> --}}

                    <!-- Sidebar Menu -->
                    <nav class="mt-2">
                        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                            <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
                            <li class="nav-item {{ (request()->is('buildings')) || (request()->is('lab-types')) || (request()->is('rooms')) ? 'menu-open' : '' }}  ">

                                <a href="#" class="nav-link ">
                                    <i class="fas fa-map-pin "></i> &nbsp;&nbsp;&nbsp;
                                    <p>
                                        Venue
                                        <i style="margin-right: 30px;!important;" class="fas fa-angle-left right"></i>
                                    </p>
                                </a>

                                <ul style="padding-left: 15px" class="nav nav-treeview">
                                    <li class="nav-item">
                                        <a href="{{url("buildings")}}" class="nav-link {{ (request()->is('locations')) ? 'active' : '' }}">
                                            <i class="fas fa-laptop-house"></i>&nbsp;&nbsp;&nbsp;&nbsp;
                                            <p>Buildings</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="{{url("lab-types")}}" class="nav-link {{ (request()->is('lab-types')) ? 'active' : '' }}">
                                            <i class="fas fa-vial"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <p>Laboratories</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="{{url("rooms")}}" class="nav-link {{ (request()->is('rooms')) ? 'active' : '' }}">

                                            <i class="fas fa-house-user"></i>
                                            &nbsp;&nbsp;&nbsp;
                                            <p>Rooms</p>
                                        </a>
                                    </li>
                                </ul>
                            </li>

                            <li class="nav-item">
                                <a href="{{url("schools")}}" class="nav-link {{ (request()->is('schools')) || (request()->is('updateSchool/*'))  || (request()->is('upload-programs/*')) ? 'active' : '' }}">
                                    <i class="fas fa-school"></i>&nbsp;
                                    <p>Schools </p>
                                </a>
                            </li>
                            <li class="nav-item {{ (request()->is('departments')) || (request()->is('lecturers')) || (request()->is('programs')) || (request()->is('units')) ? 'menu-open' : '' }}  ">

                                <a class="nav-link " class="dropbutton" onclick="btnToggle()" href="#" >
                                    <i class="fas fa-gopuram "></i> &nbsp;&nbsp;&nbsp;
                                    <p>
                                        Departments
                                        <i style="margin-right: 30px;!important;" class="fas fa-angle-left right"></i>
                                    </p>
                                </a>

                                <ul id="Dropdown" style="padding-left: 15px" class="nav nav-treeview">
                                    <li class="nav-item">
                                        <a href="{{url("departments")}}" class="nav-link {{ (request()->is('departments')) ? 'active' : '' }}">
                                            <i class="fas fa-users"></i>&nbsp;&nbsp;&nbsp;
                                            <p>Departments</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="{{url("lecturers")}}" class="nav-link {{ (request()->is('lecturers')) ? 'active' : '' }}">
                                            <i class="fas fa-users"></i>&nbsp;&nbsp;&nbsp;
                                            <p>Lecturers</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="{{url("programs")}}" class="nav-link {{ (request()->is('programs')) ? 'active' : '' }}">
                                            <i class="fas fa-graduation-cap"></i>&nbsp;&nbsp;&nbsp;&nbsp;
                                            <p>Programs</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="{{url("units")}}" class="nav-link {{ (request()->is('units')) ? 'active' : '' }}">

                                            <i class="fas fa-book"></i>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <p>Units</p>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            
                            <li class="nav-item">
                                <a href="{{url("cohorts")}}" class="nav-link {{ (request()->is('cohorts')) ? 'active' : '' }}">
                                    <i class="fas fa-user-friends"></i>&nbsp;
                                    <p>Cohorts</p>
                                </a>
                            </li>

                            <li class="nav-item">
                                <a href="{{url("timetable")}}" class="nav-link {{ (request()->is('timetable')) ? 'active' : '' }}">
                                    <i class="far fa-calendar-alt text-info"></i>&nbsp;
                                    <p>Generate</p>
                                </a>
                            </li>



                            <li class="nav-item {{ (request()->is('lecturers-timetable')) || (request()->is('programs-timetable')) || (request()->is('rooms-timetable')) ? 'menu-open' : '' }}  ">

                                <a class="nav-link " class="dropbutton" onclick="btnToggle()" href="#" >
                                    <i class="fas fa-gopuram "></i> &nbsp;&nbsp;&nbsp;
                                    <p>
                                        Timetables
                                        <i style="margin-right: 30px;!important;" class="fas fa-angle-left right"></i>
                                    </p>
                                </a>

                                <ul id="Dropdown" style="padding-left: 15px" class="nav nav-treeview">
                                    <li class="nav-item">
                                        <a href="{{url("all_lecturers_timetable")}}" class="nav-link {{ (request()->is('lecturers-timetable')) ? 'active' : '' }}">
                                            <i class="fas fa-users"></i>&nbsp;&nbsp;&nbsp;
                                            <p>By Lecturers</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="{{url("programs-timetable")}}" class="nav-link {{ (request()->is('programs-timetable')) ? 'active' : '' }}">
                                            <i class="fas fa-graduation-cap"></i>&nbsp;&nbsp;&nbsp;&nbsp;
                                            <p>By Programs</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="{{url("rooms-timetable")}}" class="nav-link {{ (request()->is('rooms-timetable')) ? 'active' : '' }}">
                                            <i class="fas fa-home"></i>&nbsp;&nbsp;&nbsp;&nbsp;
                                             <p>By Rooms</p>
                                        </a>
                                    </li>
                                    
                                    <li class="nav-item">
                                        <a href="{{url("freesClassTImes")}}" class="nav-link {{ (request()->is('rooms-timetable')) ? 'active' : '' }}">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bookmark-dash-fill" viewBox="0 0 16 16">
                                                <path fill-rule="evenodd" d="M2 15.5V2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.74.439L8 13.069l-5.26 2.87A.5.5 0 0 1 2 15.5zM6 6a.5.5 0 0 0 0 1h4a.5.5 0 0 0 0-1H6z"/>
                                              </svg>&nbsp;&nbsp;&nbsp;&nbsp;
                                            <p>Free Slots</p>
                                        </a>
                                    </li>
                                </ul>
                            </li>

                            {{-- <div>
                                <hr style="color: #333; border-top: 3px double #333;" >
                                    <li class="nav-item">
                                        <a class="nav-link" data-toggle="modal" data-target="#settingsModal">
                                            <i class="fas fa-cog"></i>&nbsp;&nbsp;&nbsp;&nbsp;
                                            <p>System Settings</p>
                                        </a>
                                    </li>
                            <hr style="color: #333; border-top: 3px double #333; " >
                            </div> --}}


                        </ul>

                    </nav>


                    <!-- /.sidebar-menu -->
                </div>

                
                <!-- /.sidebar -->
            </aside>

            @include("layouts.settings")

            <!-- Content Wrapper. Contains page content -->
            <div id="content_wrap" class="content-wrapper">
                <!-- Content Header (Page header) -->
                @yield('content')
                <!-- /.content-wrapper -->
                <footer class="main-footer fixed-bottom">
                    <strong>Copyright &copy; 2022 <a href="https://kabarak.ac.ke">Kabarak University</a>.</strong> All rights reserved.
                    <div class="float-right d-none d-sm-inline-block">
                        <b>Version</b> 1.0
                    </div>
                </footer>

                <!-- Control Sidebar -->
                <aside class="control-sidebar control-sidebar-dark">
                    <!-- Control sidebar content goes here -->
                </aside>
                <!-- /.control-sidebar -->
            </div>
            
            @include("layouts.profile")

            <!-- ./wrapper -->
            <script src="{{asset('js/jquery.min.js')}}"></script>
            <script src="{{asset('js/popper.min.js')}}"></script>
            <script src="{{asset('js/bootstrap.min.js')}}"></script>
            <script src="{{asset('js/dataTables.min.js')}}"></script>
            <script src="{{asset('js/jquery.datetimepicker.full.min.js')}}"></script>

            <!-- Scripts -->

            @yield('sockets')


            <script>
                $(document).ready(function() {
                    $('#sidebarCollapse').on('click', function() {
                        $('#sidebar').toggleClass('active');
                    });
                });
            </script>
            <!-- SweetAlert2 -->
            <!-- jQuery -->
            <script src="{{asset('plugins/jquery/jquery.min.js')}}"></script>
            <!-- jQuery UI 1.11.4 -->
            <script src="{{asset('plugins/jquery-ui/jquery-ui.min.js')}}"></script>
            <!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
            <script>
                $.widget.bridge('uibutton', $.ui.button)
            </script>
            <!-- Bootstrap 4 -->
            <script src="{{asset('plugins/bootstrap/js/bootstrap.bundle.min.js')}}"></script>
            <!-- SweetAlert2 -->
            <script src="{{asset('plugins/sweetalert2/sweetalert2.min.js')}}"></script>
            <!-- Toastr -->
            <script src="{{asset('plugins/toastr/toastr.min.js')}}"></script>
            <!-- DataTables  & Plugins -->
            <script src="{{asset('plugins/datatables/jquery.dataTables.min.js')}}"></script>
            <script src="{{asset('plugins/datatables-bs4/js/dataTables.bootstrap4.min.js')}}"></script>
            <script src="{{asset('plugins/datatables-responsive/js/dataTables.responsive.min.js')}}"></script>
            <script src="{{asset('plugins/datatables-responsive/js/responsive.bootstrap4.min.js')}}"></script>
            <script src="{{asset('plugins/datatables-buttons/js/dataTables.buttons.min.js')}}"></script>
            <script src="{{asset('plugins/datatables-buttons/js/buttons.bootstrap4.min.js')}}"></script>
            <script src="{{asset('plugins/jszip/jszip.min.js')}}"></script>
            <script src="{{asset('plugins/pdfmake/pdfmake.min.js')}}"></script>
            <script src="{{asset('plugins/pdfmake/vfs_fonts.js')}}"></script>
            <script src="{{asset('plugins/datatables-buttons/js/buttons.html5.min.js')}}"></script>
            <script src="{{asset('plugins/datatables-buttons/js/buttons.print.min.js')}}"></script>
            <script src="{{asset('plugins/datatables-buttons/js/buttons.colVis.min.js')}}"></script>
            <script src="{{ asset('upload-plugins/js/plugins/piexif.min.js')}}" type="text/javascript"></script>
            <!-- purify.min.js is only needed if you wish to purify HTML content in your preview for
            HTML files. This must be loaded before fileinput.min.js -->
            <script src="{{ asset('upload-plugins/js/plugins/purify.min.js')}}" type="text/javascript"></script>
            <!-- the main fileinput plugin file -->
            <script src="{{ asset('upload-plugins/js/fileinput.min.js')}}"></script>


            <!-- AdminLTE App -->
            <script src="{{asset('dist/js/adminlte.js')}}"></script>
            <!-- AdminLTE for demo purposes -->
            <script src="{{asset('dist/js/demo.js')}}"></script>
            <!-- AdminLTE dashboard demo (This is only for demo purposes) -->
            <script src="{{asset('dist/js/pages/dashboard.js')}}"></script>
            @yield('jscontent')
    </body>


    </html>