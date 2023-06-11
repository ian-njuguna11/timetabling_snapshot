@extends('layouts.admin-lte')
@section("title", "Programs")
@section('csscontent')
    <style>
        .tabs {
            margin: 0 auto;
            padding: 0 20px;
        }
        #tab-button {
            display: table;
            table-layout: fixed;
            width: 100%;
            margin: 0;
            padding: 0;
            list-style: none;
        }
        #tab-button li {
            display: table-cell;
            width: 20%;
        }
        #tab-button li a {
            display: block;
            padding: .5em;
            background: #eee;
            border: 1px solid #ddd;
            text-align: center;
            color: #000;
            text-decoration: none;
        }
        #tab-button li:not(:first-child) a {
            border-left: none;
        }
        #tab-button li a:hover{
            border-bottom-color: transparent;
            background: #fff;
        }
        #tab-button .is-active a {
            border-bottom-color: transparent;
            background: #993133;
        }
        .tab-contents {
            padding: .5em 2em 1em;
            border: 1px solid #ddd;
        }



        .tab-button-outer {
            display: none;
        }
        .tab-contents {
            margin-top: 20px;
        }
        @media screen and (min-width: 768px) {
            .tab-button-outer {
                position: relative;
                z-index: 2;
                display: block;
            }
            .tab-select-outer {
                display: none;
            }
            .tab-contents {
                position: relative;
                top: -1px;
                margin-top: 0;
            }
        }
    </style>
@endsection
@section('navcontent')
    <li>
        <a href="{{url("schools")}}">Schools</a>
    </li>
    <li >
        <a href="{{url("programs")}}">Programs</a>
    </li>
    <li>
        <a href="{{url("units")}}">Units</a>
    </li>
    <li>
        <a href="{{url('cohorts')}}">Cohorts</a>
    </li>
    <li class="active">
        <a href="{{url('rooms')}}">Rooms</a>
    </li>
    <li>
        <a href="{{url('timetable')}}">Timetable</a>
    </li>
@endsection
@section('content')
    <!-- Content Wrapper. Contains page content -->
    <div class="nav navbar navbar-expand navbar-white navbar-light border-bottom p-0">
        <a class="nav-link bg-light" href="#" data-widget="iframe-scrollleft"><i class="fas fa-angle-double-left"></i></a>
        <ul class="navbar-nav overflow-hidden container-fluid" role="tablist">
            <li><a href="#tab01" id="tab01_">Locations</a></li>
            <li><a href="#tab02" id="tab02_">Laboratories</a></li>
            <li><a href="#tab03" id="tab03_">Rooms</a></li>
        </ul>
        <a class="nav-link bg-light" href="#" data-widget="iframe-scrollright"><i class="fas fa-angle-double-right"></i></a>
    </div>
    <!-- /.content-wrapper -->
@endsection
@section('jscontent')
    <script>

        function displayOrHideLabType(){
            if($("#labRadio").is(':checked')){
                $('#labTypeFields').show();
            }else{
                $('#labTypeFields').hide();
            }
        }

        $(function() {
            var $tabButtonItem = $('#tab-button li'),
                $tabSelect = $('#tab-select'),
                $tabContents = $('.tab-contents'),
                activeClass = 'is-active';

            $tabButtonItem.first().addClass(activeClass);
            $tabContents.not(':first').hide();

            $tabButtonItem.find('a').on('click', function(e) {
                var target = $(this).attr('href');

                $tabButtonItem.removeClass(activeClass);
                $(this).parent().addClass(activeClass);
                $tabSelect.val(target);
                $tabContents.hide();
                $(target).show();
                //e.preventDefault();
            });

            $tabSelect.on('change', function() {
                var target = $(this).val(),
                    targetSelectNum = $(this).prop('selectedIndex');

                $tabButtonItem.removeClass(activeClass);
                $tabButtonItem.eq(targetSelectNum).addClass(activeClass);
                $tabContents.hide();
                $(target).show();
            });

            $(location.hash+"_").click();
        });

        $(document).ready( function () {
            $('#roomsTable').DataTable();
            displayOrHideLabType();
        } );
    </script>
@endsection