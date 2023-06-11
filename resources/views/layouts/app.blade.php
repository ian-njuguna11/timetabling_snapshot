<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Kabarak University | Timetabling</title>

    <link rel="shortcut icon" type="image/jpg" href="/public/dist/img/favicon.ico"/>


    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="{{asset('plugins/fontawesome-free/css/all.min.css')}}">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="{{asset('dist/css/adminlte.min.css')}}">
    <!-- overlayScrollbars -->
    <link rel="stylesheet" href="{{asset('plugins/overlayScrollbars/css/OverlayScrollbars.min.css')}}">


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
                {{--                    <button class="btn btn-primary" data-widget="pushmenu" data-auto-collapse-size="768">Toggle Sidebar</button>--}}
            </li>
            <li class="nav-item d-none d-sm-inline-block">
                <a href="/home" class="nav-link">Home</a>
            </li>
        </ul>

        <!-- Right navbar links -->
        <ul class="navbar-nav ml-auto">
            <!-- Navbar Search -->

            {{-- <li class="nav-item">
                <a class="nav-link" data-widget="control-sidebar" data-slide="true" href="#" role="button">
                    Logout
                </a>
            </li> --}}
        </ul>
        <!-- Right navbar links -->
        <ul class="navbar-nav ml-auto">
            <!-- Navbar Search -->
            <li>
                <a  class="nav-link" href="{{url('logout')}}">Logout</a>
            </li>
        </ul>
    </nav>
    <!-- /.navbar -->

    <!-- Main Sidebar Container -->
    <aside class="p-3 mb-2 bg-danger text-white main-sidebar sidebar-dark-primary elevation-4" style="text-color:white">
        <!-- Brand Logo -->

    <!-- Sidebar -->
        <div class="sidebar">
            <!-- Sidebar user panel (optional) -->
            <div class="user-panel mt-3 pb-3 mb-3 d-flex">
                <div class="image">
                    <img src="{{asset('dist/img/admin.png')}}" class="img-circle elevation-2" alt="User Image">
                </div>
                <div class="info">
                    <a href="#" class="d-block">Admin</a>
                </div>
            </div>

        <!-- Sidebar Menu -->
            <nav class="mt-2">
                <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                    <!-- Add icons to the links using the .nav-icon class
           with font-awesome or any other icon font library -->

                    <li class="nav-item">
                        <a href="{{url("schools")}}" class="nav-link">
                            <i class="fas fa-school"></i>&nbsp;
                            <p>Schools</p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="{{url("programs")}}" class="nav-link">
                            <i class="fas fa-graduation-cap"></i>&nbsp;
                            <p>Programs</p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="{{url("units")}}" class="nav-link">
                            <i class="fas fa-book"></i>&nbsp; &nbsp;
                            <p>Units</p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="{{url("cohorts")}}" class="nav-link">
                            <i class="fas fa-users"></i>&nbsp;
                            <p>Cohorts</p>
                        </a>
                    </li>

                    <li class="nav-item "  >

                        <a href="#" class="nav-link">
                            <i class="fas fa-map-pin "></i> &nbsp;&nbsp;&nbsp;
                            {{--                                 <i class="fas fa-map-pin"></i>--}}
                            <p>
                                Locations
                                <i style="margin-right: 30px;!important;" class="fas fa-angle-left right"></i>
                                {{--                                     <span style="margin-right: 40px;!important;" class="badge badge-info right">6</span>--}}
                            </p>
                        </a>

                        <ul style="padding-left: 15px" class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="{{url("locations")}}" class="nav-link">
                                    <i class="fas fa-laptop-house"></i>&nbsp;&nbsp;&nbsp;&nbsp;
                                    <p>Buildings</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="{{url("lab-types")}}" class="nav-link">
                                    <i class="fas fa-vial"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <p>Lab Types</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="{{url("rooms")}}" class="nav-link">
                                    <i class="fas fa-house-user"></i>
                                    &nbsp;&nbsp;&nbsp;
                                    <p>Rooms</p>
                                </a>
                            </li>
                        </ul>
                    </li>


                    <li class="nav-item">
                        <a href="{{url("timetable")}}" class="nav-link">
                            <i class="far fa-calendar-alt text-info"></i>&nbsp;
                            <p>Timetable</p>
                        </a>
                    </li>

                    <li class="nav-item">
                        <a href="{{url("/room_files")}}" class="nav-link {{ (request()->is('timetable')) ? 'active' : '' }}">
                            <i class="far fa-calendar-alt text-info"></i>&nbsp;
                            <p>Timetable Per Room</p>
                        </a>
                    </li>

                </ul>
            </nav>
            <!-- /.sidebar-menu -->
        </div>
        <!-- /.sidebar -->
    </aside>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
    @yield('content')
    <!-- /.content-wrapper -->
        <footer class="main-footer fixed-bottom">
            <strong>Copyright &copy; 2021 <a href="https://kabarak.ac.ke">Kabarak University</a>.</strong> All rights reserved.
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
    <!-- ./wrapper -->
    <script src="{{asset('js/jquery.min.js')}}"></script>
    <script src="{{asset('js/popper.min.js')}}"></script>
    <script src="{{asset('js/bootstrap.min.js')}}"></script>
    <script src="{{asset('js/dataTables.min.js')}}"></script>
    <script src="{{asset('js/jquery.datetimepicker.full.min.js')}}"></script>

    <!-- Scripts -->

    @yield('sockets')

    <script src="{{asset('js/jquery.min.js')}}"></script>
    <script src="{{asset('js/popper.min.js')}}"></script>
    <script src="{{asset('js/bootstrap.min.js')}}"></script>
    <script src="{{asset('js/dataTables.min.js')}}"></script>
    <script src="{{asset('js/jquery.datetimepicker.full.min.js')}}"></script>
    @yield('jscontent')
    <script>
        /*window.Echo = new Echo({
            broadcaster: 'pusher',
            key: 'websocketkey',
            cluster: 'mt1',
            wsHost: window.location.hostname,
            wsPort: 6001,
            disableStats: true
        });*/
        document.getElementById("myDropdown").addEventListener("click", function(e) {

            e.stopPropagation();
        });

        $(document).ready(function () {
            $('#sidebarCollapse').on('click', function () {
                $('#sidebar').toggleClass('active');
            });
        });
    </script>

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
    <!-- Tempusdominus Bootstrap 4 -->
    <script src="{{asset('plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js')}}"></script>
    <!-- Summernote -->
    <script src="{{asset('plugins/summernote/summernote-bs4.min.js')}}"></script>
    <!-- overlayScrollbars -->
    <script src="{{asset('plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js')}}"></script>
    <!-- AdminLTE App -->
    <script src="{{asset('dist/js/adminlte.js')}}"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="{{asset('dist/js/demo.js')}}"></script>
    <!-- AdminLTE dashboard demo (This is only for demo purposes) -->
    <script src="{{asset('dist/js/pages/dashboard.js')}}"></script>
</body>

</html>