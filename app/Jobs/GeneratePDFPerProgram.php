<?php

namespace Timetabler\Jobs;

use Illuminate\Bus\Queueable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Support\Facades\App;
use Timetabler\Events\BroadcastSimpleMessage;
use Timetabler\Events\PDFGenerated;
use Timetabler\GeneratedDoc;
use Timetabler\School;
use Timetabler\Timetable;

class GeneratePDFPerProgram implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    /**
     * Create a new job instance.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Execute the job.
     *
     * @return void
     */
    public function handle()
    {
        $message = [
            "type"=> "timetable-generator",
            "message"=> "Generating pdf timetable for each program..."
        ];
        event(new BroadcastSimpleMessage(json_encode($message)));

        $timetable = Timetable::get()->last();

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

            $timetable_hash_name = md5($program_name.time()).".pdf";

            $pdf = App::make('snappy.pdf.wrapper');
            $pdf->loadView('pdf.program_timetable', ['school'=> $school_name, 'program'=> $program_name, 'levels'=> $units]);
            $pdf->setPaper('A4', 'landscape')->setOption('margin-bottom', 10,)->setOption('margin-top', 2);
            //$pdf->setOption('no-pdf-compression',true);
            //return
            $pdf->save("public/generated/".$timetable_hash_name, true);

            

            GeneratedDoc::create([
                "school_id"=> $program->school_id,
                "program_id"=> $program->id,
                "description"=> $timetable->description,
                "document_name"=> $timetable_hash_name
            ]);
        }

        $message = [
            "type"=> "timetable-generator",
            "message"=> "Documents Generated."
        ];
        event(new BroadcastSimpleMessage(json_encode($message)));

        event(new PDFGenerated());
    }
}