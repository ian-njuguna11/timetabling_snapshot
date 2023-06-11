<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// use Illuminate\Routing\Route;
use Timetabler\School;

use Illuminate\Support\Facades\Route;


Auth::routes();



//hods
Route::prefix('hods')->group(function(){
    Route::get('/login','Auth\hodsLoginController@showLoginController')->name('HOD.Login');
    Route::post('/login','Auth\hodsLoginController@login')->name('hod.login.submit');
    Route::get('/dept_programs/{dept_id}','hodProgamsController@dept_programs');
    Route::get('/dept_programs_levels/{dept_id}','hodProgamsController@program_levels');
    Route::get('/dept_units/{dept_id}','hodProgamsController@dept_units');
    Route::get('/dashboard','hodProgamsController@dashboard');
    Route::get('/','hodController@index')->name('hods');
});







// Route::get('')



Route::group(['middleware'=> ['auth']], function(){

    Route::get('timetable/progress', "TimetableController@progress");



    Route::group(['middleware'=> ['progress']], function(){
        Route::get("/", "AuthController@admin")->name('/');

        //schools
        Route::get('lab-types', 'SchoolsController@labTypes');

        //common routes
        Route::get('/home', 'HomeController@index')->name('home');
        Route::get('/adminlte', 'HomeLTEController@index');
        Route::get('schools', 'SchoolsController@index');
        Route::get('locations','SchoolsController@locationsLTE');
        Route::get("programs", "ProgramController@index");
        Route::get('rooms', 'RoomController@index');
        Route::get('units', "UnitController@getUnits");
        Route::get('cohorts', 'CohortController@index');
        Route::get('timetable', "TimetableController@index");

        //departments
        Route::get("/departments", "DepartmentController@index" );
        Route::post("/add-department", "DepartmentController@create");

        //Lecturers
        Route::post("add-lecture-locations/{school_id}", "SchoolsController@addLocations");
        // Route::post('remove-lecture-locations/{location_code}',"SchoolsController@removeLocations");
        Route::post("remove-lecture-locations/{school_id}", "SchoolsController@removeLocations");
        Route::post("editLecturer","LecturerController@editLecturer");

        Route::get("/lecturers", "LecturerController@index");
        Route::post('add-lecturer',"LecturerController@create");
        Route::get('/import-lecturer', 'LecturerController@getImport');    //->name('import-lecturers');
        Route::get('assignHod/{lec_id}','LecturerController@assignHod');


        //filered cohorts
        Route::post('s_cohorts/', 'CohortController@filterCohort');
        Route::get('c_cohorts/{p_code}','CohortController@filterCohort');
        Route::post('addschool', 'SchoolsController@create');
        Route::get("school-programs/{school_id}", "SchoolsController@getPrograms");
        Route::get("edit-school/{school_id}", "SchoolsController@edit");
        Route::get('deleteSchool/{school_id}','SchoolsController@destroy');
        Route::get('updateSchool/{school_id}','SchoolsController@update_school');
        Route::post('editSchool','SchoolsController@editSchool');



        //programs
        Route::get('all-school-csv','UnitController@create_school_sample');
        Route::get('all-labs-csv','UnitController@creat_sample_units');
        Route::post("addprogram", "ProgramController@create");
        Route::get("levels/{program_id}", "LevelsController@index");
        Route::post("addlevel/{program_id}", "LevelsController@create");
        Route::get('destroyProgram/{program_id}','ProgramController@destroyProgram');
        Route::get('viewupdateProgram/{program_id}','ProgramController@updateProgram');
        Route::post('editProgram','ProgramController@editProgram');
        Route::get('school_program','SchoolsController@school_program');
//        Route::get('deleteProgram/{program_id}','ProgramController@');



        //rooms


        Route::post('addroom', 'RoomController@create');
        Route::get('delete-room/{id}', "RoomController@destroyRoom");
        Route::get('edit-room/{room_id}','RoomController@editRooms');
        Route::post('editRooms','RoomController@updateRoom');


        Route::post('addlocation', 'LocationController@create');
        Route::get('updateLocation/{location_id}', 'LocationController@update_location');
        Route::post('editLocation', 'LocationController@update');
        //lab-type
        Route::post('addlabtype', 'LabController@create');
        Route::get('updateLabtype/{lab_id}', 'LabController@update_lab');
        Route::get('destroyLabtype/{lab_id}', 'RoomController@destroyLabtype');
        Route::post('editLabType', 'LabController@update');

        // Route::get('lab-types', 'SchoolsController@labTypes');
        Route::get('delete-labs/{lab_id}','LocationController@destroy');
        Route::get('updateLabs/{lab_id}','LabController@edit');
        Route::post('editlabs','LabController@editLabs');



        //units
        Route::post('addunit', "UnitController@create");
        Route::post('addlevelunits', "LevelsController@addUnit");
        Route::post('removelevelunits', "LevelsController@removeUnits");
        Route::post('merge-units', "UnitController@mergeUnits");
        Route::get('view_merge','UnitController@view_merge');
        Route::get('split-units/{id}', "UnitController@splitUnits");
        Route::get('delete-unit/{id}', "UnitController@remove");
        Route::get('viewupdateUnit/{unit_id}', "UnitController@update_unit");


        //locations
        // Route::get('delete-locale/{id}', "RoomController@remove");
        Route::get('delete-locale/{id}', "RoomController@remove");
        Route::get('edit_locations/{location_id}','LocationController@edit');
        Route::post('editLocation','LocationController@updateLocation');

        Route::post('createUnits','UnitController@createUnits');

        Route::get('unit/create','UnitsController@viewCreateUnits');
        Route::post('editUnits','UnitsController@editUnits');
        Route::get('editUnit/{unit_id}','UnitController@editUnits');
        Route::post('updateUnit','UnitController@update');


        //cohorts

        Route::post('editcohort', 'LevelsController@update');

        //timetable

        Route::get('timetable/create', "TimetableController@createIndex");
        //Room generate pdf
        Route::get('room_timetable/create', 'TimetableController@createRoomIndex');
        Route::post('timetable/generate', "TimetableController@generate");
        //Download RoomPDF
        Route::get('timetable/download-room-pdf/{file_id}', "TimetableController@downloadRoomPDF");
        Route::get('timetable/download-pdf/{file_id}', "PDFController@downloadPDF");
        Route::get('logout', "AuthController@logout");

        //csv
        Route::get('/upload-programs/{school_id}', 'RoomController@upload_programs')->name('upload-programs');
        Route::get('/upload-units', 'UnitController@upload_units')->name('upload-units');
        Route::post('/upload/program', 'RoomController@import')->name('import-programs');

        Route::post('/import_parse', 'ImportController@parseImport')->name('import_parse');
        Route::post('/import_process', 'ImportController@processImport')->name('import_process');



        //csv programs
        Route::get('/programs_imports', 'ImportProgramController@getImport')->name('programs_import');
        Route::post('/programs_import_parse', 'ImportProgramController@parseImport')->name('programs_import_parse');
        Route::post('/programs_import_process', 'ImportProgramController@store')->name('programs_import_process');

        //csv unit
        Route::get('/units_imports', 'ImportUnitController@getImport')->name('units_import');
        Route::post('/units_import_parse', 'ImportUnitController@parseImport')->name('units_import_parse');
        Route::post('/units_import_process', 'ImportUnitController@store')->name('units_import_process');

        Route::get('upload-ui', [FileUploadController::class, 'dropzoneUi' ]);
        Route::post('file-upload', [FileUploadController::class, 'dropzoneFileUpload' ])->name('dropzoneFileUpload');

        //pdf room download
        Route::get('room_files','PDFController@all_files');
        Route::get('/all_rooms','PDFController@downfunc');

        //sample_docs
        Route::get('/all-schools-csv', "UnitController@create_sample");
        Route::get('/all-labs-csv',"UnitController@creat_sample_units");

        //
        //**************timetable preview****************//

    });
});


// Route::group(['middleware'=> ['auth:hods']], function(){
// });