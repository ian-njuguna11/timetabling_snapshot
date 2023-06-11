<?php

namespace Timetabler\Http\Controllers;

use Illuminate\Support\Facades\Hash;
use Timetabler\Unit;
use Timetabler\Contact;
use Timetabler\CsvData;
use Timetabler\Http\Requests\CsvImportRequest;
use Illuminate\Http\Request;
use Maatwebsite\Excel\Facades\Excel;
use Timetabler\School;
use Timetabler\Program;
use Timetabler\department;
use Symfony\Component\HttpFoundation\Session\Session;

class DepartmentController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //department main page
        $departments = department::all();
        $school = School::all();

        return view('departments', ['departments' => $departments, 'schools' => $school]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request)
    {
        department::Create([
            "name" => $request->name,
            "school_ID" => $request->school
        ]);

        return back();
    }

    public function createDepartmentProgram(Request $request)
    {
        Program::firstOrcreate(
            [
                "name" => $request->name,
                "semesters" => $request->semesters,
                "years" => $request->years,
                "program_code" => $request->program_code,
                "school_id" => $request->school_id,
                "deparment_ID" => $request->department_program,

            ]

        );

        return back();
    }

    public function createDepartment(Request $request)
    {
        // return $request->name;
        $this->validate($request, [
            'name' => 'required',
            'school_department' => 'required',
        ]);
        $data = [
            'name' => $request->name,
            'school_ID' => $request->school_department,
        ];

        // return $data;

        if (department::firstOrCreate($data)) {
            return back()->with(["info" => "Department added successfully"]);
        }

        return back()->withErrors(["error" => "Unable to add a room!"]);
    }




    /**
     * Display the specified resource.
     *
     * @param  \Timetabler\department  $department
     * @return \Illuminate\Http\Response
     */
    public function show(department $department)
    {
        //return view('edit_department', compact('department'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \Timetabler\department  $department
     * @return \Illuminate\Http\Response
     */
    
    public function edit($id){
        $row = department::where('id', $id)
            ->first();

        $params = [
            'id' => $row->id,
            'name' => $row->name,
            'school_ID' => $row->school_ID,
        ];
        //dd($params);
        return view('edit_department', compact('params'));
    }
    public function updateDepartment(Request $request)
    {
        $request->validate([
            'name' => 'required',
        ]);

        department::where('id', $request->input('department_id'))->update([
            'name' => $request->input('name'),
        ]);

        return redirect('departments');
    }

    public function department_edit($id)
    {

        $department = School::all();

        $row = department::where('id', $id)
            ->first();

        $params = [
            'Info' => $row,
            'Title' => 'Edit',
            'name' => $row->name,
            'Program' => $row->id
        ];

        $data = department::find($id);

        return view('edit_department', ['data' => $data], $params);
    }

    public function updateSchoolDepartment(Request $request)
    {
        $request->validate([
            'name' => 'required',
        ]);

        department::where('id', $request->input('department_id'))->update([
            'name' => $request->input('name'),
        ]);

        return redirect('school-departments/{department_id}');
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Timetabler\department  $department
     * @return \Illuminate\Http\Response
     */

    public function update(Request $request)
    {
        $request->validate([
            'name' => 'required',
        ]);

        department::where('id', $request->id)->update([
            'department' => $request->input('name'),
        ]);

        return redirect('departments');
    }


    /**
     * Remove the specified resource from storage.
     *
     * @param  \Timetabler\department  $department
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //Destroy the Departments Created
        department::destroy($id);
        return redirect('departments');
    }
    public function getDepartments(Request $request)
    {

        $departments = department::all();

        $school = School::all();

        $school = School::with('departments')
            // $schools = School::all()

            ->where('id', $request->school_id)
            ->first();
        // dd($school);

        return view('school-departments', ['departments' => $departments, 'school' => $school]);
    }
    public function getPrograms(Request $request, $id)
    {

        $department = department::all();
        $schools = School::all();

        //$programs = Program::all();
        $programs = Program::with("levels", "levels.units", "department")
            ->where('deparment_id', $id)
            ->orderBy('deparment_id')
            ->get();

        $department = department::with('programs')
            ->where('id', $request->department_id)
            ->first();
        return view('department-programs', ['department' => $department, 'programs' => $programs, 'schools' => $schools]);
    }

    public function uploadDeptPrograms(Request $request)
    {
        $department = department::all();
        $department = department::with('programs')
            ->where('id', $request->department_id)
            ->first();


        $request->session()->put('dept_id', $request->department_id);


        // return view('import-uploadDeptPrograms-programs', ['department'=> $department]);
        return view('import-department-programs', ['department' => $department]);
    }


    public function uploadPrograms(Request $request)
    {
        $department = department::all();
        $department = department::with('programs')
            ->where('id', $request->department_id)
            ->first();


        return view('import-department-programs', ['department' => $department]);
    }

    public function csvDepartmentID(CsvImportRequest $request)
    {

        $dept_id = $request->session()->get('dept_id');
        $sch_dpt_id = department::where('id', $dept_id)->get('school_ID');
        $value_sch_dpt_id = $sch_dpt_id[0]->school_ID;
        $path = $request->file('csv_file')->getRealPath();
        $file = fopen($path, 'r');
        $path_parts = pathinfo($request->file('csv_file')->getClientOriginalName());
        if ($path_parts['extension'] != "csv") {
            return "File format not suppported";
        } else {


            $header = fgetcsv($file);
            $check_header = [
                "name",
                "semesters",
                "years",
                "program_code",
                "school_id",
                "department_id"
            ];

            for ($x = 0; $x <= count($header) - 1; $x++) {

                // echo "$header[$x] <br>";
                if (strval($header[$x]) == strval($check_header[$x])) {
                    $escapedHeader = [];

                    foreach ($header as $key => $value) {
                        $lheader = strtolower($value);
                        array_push($escapedHeader, $lheader);
                    }

                    while ($columns = fgetcsv($file)) {
                        if ($columns[0] = "") {
                            continue;
                        }

                        $data = array_combine($escapedHeader, $columns);
                    }


                    if ($request->has('header')) {
                        $data = Excel::load($path, function ($reader) {
                        })->get()->toArray();
                    } else {
                        $data = array_map('str_getcsv', file($path));
                    }

                    if (count($data) > 0) {
                        if ($request->has('header')) {
                            $csv_header_fields = [];
                            foreach ($data[0] as $key => $value) {
                                $csv_header_fields[] = $key;
                            }
                        }

                        foreach ($data as $row) {
                            if (Program::where('name', $row["name"])->exists()) {
                                continue;
                            } else {
                                Program::create([
                                    'name' => $row["name"],
                                    'semesters' => $row["semesters"],
                                    'years' => $row["years"],
                                    'program_code' => $row["program_code"],
                                    'school_id' => $value_sch_dpt_id,
                                    'deparment_ID' => $dept_id
                                ]);
                            }
                        }

                        $csv_data_file = CsvData::create([
                            'csv_filename' => $request->file('csv_file')->getClientOriginalName(),
                            'csv_header' => $request->has('header'),
                            'csv_data' => json_encode($data)
                        ]);
                    } else {
                        return redirect()->back();
                    }

                    return view('import_programs_fields', compact('csv_header_fields', 'data', 'csv_data_file'))->with('import_csv_success', " Csv uploaded Succesfully");
                } else {
                    echo "incorrect headers $header[$x] not equivalent $check_header[$x] <br>";
                }
            }
        }
    }


    public function processImport(Request $request)
    {
        $data = CsvData::find($request->csv_data_file_id);
        $csv_data = json_decode($data->csv_data, true);
        foreach ($csv_data as $row) {
            $contact = new Contact();
            return ($csv_data);
        }
        return view('import_success');
    }


    public function store(CsvImportRequest $request)
    {
        //get file
        $path = $request->file('csv_file')->getRealPath();
        return $path;
    }
}
