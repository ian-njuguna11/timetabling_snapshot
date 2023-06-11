<?php

namespace Timetabler\Http\Controllers;

use Illuminate\Http\Request;
use \Mpdf\Mpdf as PDF; 
use Illuminate\Support\Facades\Storage;
use stdClass;

use Timetabler\School;
use Timetabler\Lectures;
use Timetabler\Session;

class NewPDFGeneratorController extends Controller
{
    public function document()
    {
        $programs = School::with(
            'programs',
            'programs.levels',
            'programs.levels.units',
            'programs.levels.units.sessions',
            'programs.levels.units.sessions.room',
            'programs.levels.units.sessions.unit',
            'programs.levels.units.sessions.unit.levelsInSession',
            'programs.levels.units.sessions.period',
            'programs.levels.units.sessions.period.day'
            )
            ->get()->each(function($school){
                $programs = $school->programs->each(function($program) use ($school){
                    $program->school = $school->name;
                    $program->school_id = $school->id;
                });
                
                $school->programs = $programs;
    
                //return $school;
            })
            ->pluck('programs')->flatten();
        // dump($programs);
    
        foreach ($programs as $program){
            $school_name = $program->school;
            $program_name = $program->name;
            $units = $program->levels
                ->map(function($level){
                    $units = $level->units->each(function($unit) use ($level){
                        $unit->level = $level->level;
                    });
                    $level->units = $units;
                    return $level;
                })->pluck('units')->flatten()
                ->sortBy('level')
                ->groupBy('level');
                
                // dump($units);

                // Setup a filename 
        $documentFileName = "AllProgramsTimetable.pdf";
 
        // Create the mPDF document
        $document = new PDF( [
            'mode' => 'utf-8',
            'format' => 'A4',
            'margin_header' => '3',
            'margin_top' => '20',
            'margin_bottom' => '20',
            'margin_footer' => '2',
        ]);     
 
        // Set some header informations for output
        $header = [
            'Content-Type' => 'application/pdf',
            'Content-Disposition' => 'inline; filename="'.$documentFileName.'"'
        ];
 
        // Write some simple Content
        $document->WriteHTML(view("pdf.program_timetable",['school'=> $school_name, 'program'=> $program_name, 'levels'=> $units]));
        // $document->WriteHTML('<p>Write something, just for fun!</p>');
 
        // Use Blade if you want
        //$document->WriteHTML(view('fun.testtemplate'));
         
        // Save PDF on your public storage 
        Storage::disk('public')->put($documentFileName, $document->Output($documentFileName, "S"));
         
        // Get file back from storage with the give header informations
        return Storage::disk('public')->download($documentFileName, 'Request', $header); //
                
    
            // return view("pdf.program_timetable",['school'=> $school_name, 'program'=> $program_name, 'levels'=> $units]);
    
            // foreach($units as $session){
            //     $json_units = json_decode($session);
            //     // dump($json_units[0]->sessions);
            //     dump($json_units[0]->sessions[0]->unit);
            // }
                
        }
    }
}
