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

use Timetabler\Mail\resetPassword;

Auth::routes();

//route to check timetables not in session
Route::get('timetables_not_in_session', 'CheckController@action');

Route::get('app/call', 'SyncAttendance@appCall');

//students
Route::get("students_list", 'StudentController@index');
Route::get("student_metrics", 'StudentController@show');

Route::get("attendace_check/{reg_no}", 'StudentController@takeAttandnce');

//
Route::get('isSessionAssignedToLec/{session}', 'TimetableController@isSessionAssignedToLec');
Route::get('moveLecture/{sesion}/to/{to_session}', 'TimetableController@moveLecture');

Route::get('isLecturerFree/{lecturer}/{period}', 'TimetableController@isLecturerFree');

Route::get('updateSessionPeriodId/{period}/{session}/{room}/{to_session}', 'TimetableController@updateSessionPeriodId');

Route::get('areStudentsInaProgramFree/{unit}/{period}/{session}/{room}/{to_session}', 'TimetableController@areStudentsInaProgramFree');


Route::get('freeClassPeriod/{period}', 'TimetableController@freeClassPeriod');

Route::get('session_query/{session}','TimetableController@session_query');

Route::get('allocateClassTime/{room}', 'TimetableController@allocateClassTime');
Route::get('freesClassTImes/{session}', 'TimetableController@availableFreeSessions');
Route::get('freesClassTImes', 'TimetableController@freesClassTImes');
//is lec free @ time t

//tests-route
Route::get("logger","ttPerProgramController@log");
// Route::get("logger_h", function(){
//     return view("TimetableHTML.lecturer_timetable");
// });

Route::get('custom_notification/{type}', 'NotificationController@notification');

Route::get('send-email-pdf/{lec_id}', "TimetableController@dispatchToUsers");
Route::get('dispatchRoomsEmail', "TimetableController@dispatchRoomsEmail");
Route::post("assign","TimetableController@assign");


Route::get('notify','NotificationController@notify');

//pusher notification
Route::view('/notification', 'notification');

Route::get("update_level_null","ttPerProgramController@levels");

//update profile;
Route::post("profile","AuthController@profile");

//Timetable Render HTMl;
Route::get("programs-timetable","TimetableController@renderProgramTimetable");
// Route::get('/programs-timetable', 'ProgramController@programTimetable');
Route::get("rooms-timetable","TimetableController@renderRoomTimetable");

Route::get("forgot-password", 'AuthController@forgotPassword');
// password-reset


Route::post("password-reset", 'AuthController@genAccessToken');
Route::get('send-mail', 'AuthController@emailReset');
Route::get('token/{any}',"AuthController@confirm");
Route::post('passReset', "AuthController@passReset");

Route::prefix('lec')->group(function () {
    Route::get("units/{email}","LecturerController@lecUnits");
    Route::get("timetable/{email}","LecturerController@lecTimetable");
    
});

Route::post("assignPostLec", "TimetableController@assignPostLec");


Route::get('hod/home', "HomeController@isHOD")->name('hod.home')->middleware('isHOD');
//hods 
// Route::group(['middleware' => ['isHOD']], function () {
    Route::prefix('hods')->group(function () {
        Route::get("assign_specific_lec/assignlec/{lec_ID}/{sess_id}", "TimetableController@assignlec");
        
        Route::get("assign_specific_lec/{lecID}","hodProgamsController@assignLec");
        Route::get("hodtimetable/{email}","hodProgamsController@hodlecTimetable");
        Route::get('/lecturers/{lec_ID}', 'hodProgamsController@lecturers');
        Route::get('/login', 'Auth\hodsLoginController@showLoginController')->name('HOD.Login');
        Route::post('/login', 'Auth\hodsLoginController@login')->name('hod.login.submit');
        Route::get('/dept_lecturers/{dept_id}', 'hodProgamsController@lecturers');
        Route::get('/dept_programs/{dept_id}', 'hodProgamsController@dept_programs');
        Route::get('/dept_programs_levels/{dept_id}', 'hodProgamsController@program_levels');
        Route::get('/dept_units/{dept_id}', 'hodProgamsController@dept_units');
        //Lecturers
        Route::post("/add-lecture-locations/{school_id}", "SchoolsController@addLocations");
        Route::post("/remove-lecture-locations/{school_id}", "SchoolsController@removeLocations");
        Route::get("/lecturers", "LecturerController@index");
        Route::post('add-lecturer', "LecturerController@create");
        Route::get('/import-lecturer', 'LecturerController@getImport');    //->name('import-lecturers');
        Route::get('assignHod/{lec_id}', 'LecturerController@assignHod');
        Route::get('delete-lecturer/{lecturer_id}', 'LecturerController@destroy');
        Route::get('programs-timetable', 'LecturerController@renderProgramTimetable');
    });
// });

//Route::get('/hods', 'hodController@index')->name('hods');
Route::view('/hods','hod');
Route::get('/hods/dashboard', 'hodProgamsController@dashboard');


// Route::get('')


Route::group(['middleware' => ['auth']], function () {

    Route::get('timetable/progress', "TimetableController@renderProgramTimetable");


    Route::group(['middleware' => ['progress']], function () {
        Route::get("/", "AuthController@admin")->name('/');

        //schools       
        Route::get('lab-types', 'SchoolsController@labTypes');

        //common routes
        Route::get('/home', 'HomeController@index')->name('home');
        //Route::get('/adminlte', 'HomeLTEController@index');
        Route::get('schools', 'SchoolsController@index');
        Route::get('buildings', 'SchoolsController@locationsLTE');
        Route::get("programs", "ProgramController@index");
        Route::get('rooms', 'RoomController@index');
        Route::get('units', "UnitController@getUnits");
        Route::get('cohorts', 'CohortController@index');
        Route::get('timetable', "TimetableController@index");

        //departments
        Route::get("/departments", "DepartmentController@index");
        Route::post("/add-department", "DepartmentController@create");
        Route::post("/add_school_department", "DepartmentController@createDepartment");
        Route::get('viewupdateDepartment/{program_id}', 'DepartmentController@update'); 
        Route::get('destroyDepartment/{department_id}', 'DepartmentController@destroy');
        Route::get("school-departments/{school_id}", "DepartmentController@getDepartments");
        Route::get('edit_department/{department_id}', 'DepartmentController@edit');
        Route::post('update-department', 'DepartmentController@updateDepartment');
        Route::get('edit-school-department/{department_id}', 'DepartmentController@department_edit');
        Route::post('update-school-department', 'DepartmentController@updateSchoolDepartment');
        
        Route::get("department-programs/{department_id}", "DepartmentController@getPrograms");
        Route::get("upload-department-programs/{department_id}", "DepartmentController@uploadPrograms");

        //dept upload
        Route::get("upload-DeptPrograms/{department_id}", "DepartmentController@uploadPrograms");

        Route::get("csv-upload-department-programs/{department_id}", "DepartmentController@csvDepartmentID");


        //Lecturers
        Route::post("add-lecture-locations/{school_id}", "SchoolsController@addLocations");
        // Route::post('remove-lecture-locations/{location_code}',"SchoolsController@removeLocations");
        Route::post("remove-lecture-locations/{school_id}", "SchoolsController@removeLocations");


        Route::get("/lecturers", "LecturerController@index");
        Route::post('add-lecturer', "LecturerController@create");
        Route::get('/import-lecturer', 'LecturerController@getImport');    //->name('import-lecturers');
        Route::get('assignHod/{lec_id}', 'LecturerController@assignHod');
        Route::get('viewupdateLecturer/{lecturer_id}', 'LecturerController@update');

        // use_me_at_hod
        Route::get('lecturers-timetable', 'LecturerController@lecturerTimetable');
        Route::post('editLecturer', 'LecturerController@editLecturer');


        //filered cohorts
        Route::post('s_cohorts/', 'CohortController@filterCohort');
        Route::get('c_cohorts/{p_code}', 'CohortController@filterCohort');
        Route::post('addschool', 'SchoolsController@create');
        Route::get("school-programs/{school_id}", "SchoolsController@getPrograms");
        Route::get("edit-school/{school_id}", "SchoolsController@edit");
        Route::get('deleteSchool/{school_id}', 'SchoolsController@destroy');
        Route::get('updateSchool/{school_id}', 'SchoolsController@update_school');
        Route::post('editSchool', 'SchoolsController@editSchool');


        //programs
        Route::get('all-school-csv', 'UnitController@create_school_sample');
        Route::get('all-labs-csv', 'UnitController@create_sample_units');
        Route::post("addprogram", "ProgramController@create");
        Route::post("addDepartmentProgram", "DepartmentController@createProgram");
        Route::get("levels/{program_id}", "LevelsController@index");
        Route::post("addlevel/{program_id}", "LevelsController@create");
        Route::get('destroyProgram/{program_id}', 'ProgramController@destroyProgram');
        Route::get('viewupdateProgram/{program_id}', 'ProgramController@updateProgram');
        Route::post('editProgram', 'ProgramController@editProgram');
        Route::get('school_program', 'SchoolsController@school_program');
//        Route::get('deleteProgram/{program_id}','ProgramController@');
        Route::post("add_department_program", "DepartmentController@createDepartmentProgram");

        //rooms


        Route::post('addroom', 'RoomController@create');
        Route::get('delete-room/{id}', "RoomController@destroyRoom");
        Route::get('edit-room/{room_id}', 'RoomController@editRooms');
        Route::post('editRooms', 'RoomController@updateRoom');


        Route::post('addlocation', 'LocationController@create');
        Route::get('updateLocation/{location_id}', 'LocationController@update_location');
        Route::post('editLocation', 'LocationController@update');
        //lab-type
        Route::post('addlabtype', 'LabController@create');
        Route::get('destroyLabtype/{lab_id}', 'RoomController@destroyLabtype');
        Route::get('updateLabtype/{lab_id}', 'LabController@update_lab');
        Route::post('editLabType', 'LabController@update');

        // Route::get('lab-types', 'SchoolsController@labTypes');
        Route::get('delete-labs/{lab_id}', 'LocationController@destroy');
        //Route::get('updateLabs/{lab_id}', 'LabController@edit');
        Route::post('editlabs', 'LabController@editLabs');


        //units
        Route::post('addunit', "UnitController@create");
        Route::post('addlevelunits', "LevelsController@addUnit");
        Route::post('removelevelunits', "LevelsController@removeUnits");
        Route::post('merge-units', "UnitController@mergeUnits");
        Route::get('view_merge', 'UnitController@view_merge');
        Route::get('split-units/{id}', "UnitController@splitUnits");
        Route::get('delete-unit/{id}', "UnitController@remove");
        Route::get('viewupdateUnit/{unit_id}', "UnitController@update_unit");


        //locations
        // Route::get('delete-locale/{id}', "RoomController@remove");
        Route::get('delete-locale/{id}', "LocationController@delete");
        Route::get('edit_locations/{location_id}', 'LocationController@edit');
        Route::post('editLocation', 'LocationController@updateLocation');

        Route::post('createUnits', 'UnitController@createUnits');

        Route::get('unit/create', 'UnitsController@viewCreateUnits');
        Route::post('editUnits', 'UnitsController@editUnits');
        Route::get('editUnit/{unit_id}', 'UnitController@editUnits');
        Route::post('updateUnit', 'UnitController@update');


        //cohorts

        Route::post('editcohort', 'LevelsController@update');

        //timetable

        Route::get('timetable/create', "TimetableController@createIndex");
        //Room generate pdf
        Route::get('room_timetable/create', 'TimetableController@createRoomIndex');
        Route::post('timetable/generate', "TimetableController@generate");
        //Download ProgramPDF
        Route::get('timetable/room-pdf/{file_id}', "TimetableController@downloadRoomPDF");
        Route::get('/all_rooms', 'TimetableController@downloadRoomTimetable');
        Route::get('timetable/download-pdf/{file_id}', "TimetableController@downloadPDF");
        Route::get('logout', "AuthController@logout");
        Route::get("all_lecturers_timetable", "TimetableController@renderLecturer");

        //pdf room download 
        // ---  
        // ---  
        // ---  
        // ---  
        // ---  
        //Formerly with the PDFController moved to trash
        Route::get('room_files', 'RoomController@all_files');

        //csv
        Route::get('/upload-programs/{school_id}', 'RoomController@upload_programs')->name('upload-programs');
        Route::get('/upload-units', 'UnitController@upload_units')->name('upload-units');
        Route::post('/upload/program', 'RoomController@import')->name('import-programs');

        Route::post('/import_parse', 'ImportController@parseImport')->name('import_parse');
        Route::post('/import_process', 'ImportController@processImport')->name('import_process');

        


        //csv programs
        Route::get('/programs_imports', 'ImportProgramController@getImport')->name('programs_import');

        //implement on the department-program csv
        //Route::post('/department/programs_import_parse', 'ImportDeptProgController@parseImport')->name('department-programs-import-parse');
        Route::post('/programs_import_parse', 'ImportProgramController@parseImport')->name('programs_import_parse');
        Route::post('/programs_import_process', 'ImportProgramController@store')->name('programs_import_process');

        Route::post('/dept_programs_import_parse', 'DepartmentController@csvDepartmentID')->name('dept_programs_import_parse');
        Route::post('/dept/programs_import_process', 'DepartmentController@store')->name('dept_programs_import_process');




        //this
        // Route::get('t_ext/{{file_name}}',"ImportProgramController@test_ext");


        // Route::post('/import_parse', 'ImportController@parseImport')->name('import_parse');
        // Route::post('/import_process', 'ImportController@processImport')->name('import_process');

        //csv unit
        Route::get('/units_imports', 'ImportUnitController@getImport')->name('units_import');
        Route::post('/units_import_parse', 'ImportUnitController@parseImport')->name('units_import_parse');
        Route::post('/units_import_process', 'ImportUnitController@store')->name('units_import_process');
        
        
        //Route::post('/programs_import_process', 'ImportProgramController@store')->name('programs_import_process');

        Route::get('upload-ui', [FileUploadController::class, 'dropzoneUi']);
        Route::post('file-upload', [FileUploadController::class, 'dropzoneFileUpload'])->name('dropzoneFileUpload');

        //sample_docs
        Route::get('/all-schools-csv', "UnitController@create_sample");
        Route::get('/all-labs-csv', "UnitController@create_sample_units");
        Route::get('/all-schools-csv', "ProgramController@create_sample_programs");

        //
        //**************timetable preview****************//
        
        //password

    });
});




// Route::group(['middleware'=> ['auth:hods']], function(){
// });