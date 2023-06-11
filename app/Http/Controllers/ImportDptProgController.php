<?php

namespace Timetabler\Http\Controllers;

use Illuminate\Support\Facades\Hash;
use Timetabler\Program;
use Timetabler\Unit;
use Timetabler\Contact;
use Timetabler\CsvData;
use Timetabler\deparment;
use Timetabler\Http\Requests\CsvImportRequest;
use Illuminate\Http\Request;
use Maatwebsite\Excel\Facades\Excel;

class ImportProgramController extends Controller
{

    public function getImport()
    {
        return view('import_programs');
    }

    public function parseImport(CsvImportRequest $request)
    {
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
                                    'school_id' => 1,
                                    'deparment_ID' => 1
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

                    return view('import_programs_fields', compact('csv_header_fields', 'data', 'csv_data_file'))->with('import_csv_success'," Csv uploaded Succesfully");
                } else {
                    echo "incorrect headers $header[$x] not equivalent $check_header[$x] <br>";
                }
            }


        }


    }

     public function parseDeptImport(CsvImportRequest $request)
    {
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
                                    'school_id' => 1,
                                    'deparment_ID' => 1
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

                    return view('import_programs_fields', compact('csv_header_fields', 'data', 'csv_data_file'))->with('import_csv_success'," Csv uploaded Succesfully");
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