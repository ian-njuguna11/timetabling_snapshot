<?php

namespace Timetabler\Http\Controllers;

use Timetabler\Student;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redis;

class StudentController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Student $students)
    {
        $students =  $students->all();
        return view("Students.list", compact('students'));
        //
    }
    
    public function takeAttandnce(Request $request)
    {
        // dd($request->reg_no);
        echo Student::where('Reg_No', $request->reg_no)->get() . PHP_EOL;    
        echo " " . PHP_EOL;    
        return  Response()->json("Ok", 200);
        // redirect("attendace_check/".$request->reg_no);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \Timetabler\Student  $student
     * @return \Illuminate\Http\Response
     */
    public function show(Student $student)
    {
        return view('Metrics.student_metrics');
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \Timetabler\Student  $student
     * @return \Illuminate\Http\Response
     */
    public function edit(Student $student)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Timetabler\Student  $student
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Student $student)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \Timetabler\Student  $student
     * @return \Illuminate\Http\Response
     */
    public function destroy(Student $student)
    {
        //
    }
}
