<?php

namespace Timetabler\Http\Controllers;

use Illuminate\Support\Facades\Hash;
use Timetabler\Unit;
use Timetabler\Contact;
use Timetabler\CsvData;
use Timetabler\Http\Requests\CsvImportRequest;
use Illuminate\Http\Request;
use Maatwebsite\Excel\Facades\Excel;

class ImportController extends Controller
{

    public function getImport()
    {
        return view('import');
    }

    public function parseImport(CsvImportRequest $request)
    {

        $path = $request->file('csv_file')->getRealPath();
        //open file
        $file = fopen($path, 'r');

        $header = fgetcsv($file);

        $escapedHeader = [];


        //validate
        foreach ($header as $key => $value) {

            $lheader = strtolower($value);
            array_push($escapedHeader, $lheader);
        }


        while ($columns = fgetcsv($file)) {
            if ($columns[0] = "") {
                continue;
            }

            $data = array_combine($escapedHeader, $columns);


            //Table update
            $first_name = $data['first_name'];
            $last_name = $data['last_name'];
            $email = $data['email'];
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
                Unit::create([
                    // code 	name 	lecture_hours 	lab_hours 	lab_type_id 
                    'code' => $row["first_name"],
                    'name' => $row["last_name"],
                    'lecture_hours' => 1234,
                    'lab_hours' => 90,
                    // 'lab_type_id'=>90
                ]);
            }

            $csv_data_file = CsvData::create([
                'csv_filename' => $request->file('csv_file')->getClientOriginalName(),
                'csv_header' => $request->has('header'),
                'csv_data' => json_encode($data)
            ]);
        } else {
            return redirect()->back();
        }

        return view('import_fields', compact('csv_header_fields', 'data', 'csv_data_file'));
    }

    public function processImport(Request $request)
    {
        $data = CsvData::find($request->csv_data_file_id);
        $csv_data = json_decode($data->csv_data, true);



        foreach ($csv_data as $row) {

            $contact = new Contact();

            return ($csv_data);
        }



        //        dd($csv_data);

        return view('import_success');
    }


    public function store(CsvImportRequest $request)
    {
        //get file
        $path = $request->file('csv_file')->getRealPath();
        return $path;
        //open and read

        //validate
    }
}
