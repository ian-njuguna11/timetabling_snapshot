<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

/*Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});*/

//lecturers timetable.
Route::get('lectures/{lec_id}', 'LecturerController@getLecturers');
//programs

// Route::get('programs/{lec_id}', 'ProgramController@renderProgramTimetable');


//students


//units