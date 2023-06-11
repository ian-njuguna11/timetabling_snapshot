<?php

namespace Timetabler\Jobs;

use Exception;
use Illuminate\Bus\Queueable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Support\Facades\App;
use Symfony\Component\Console\Output\ConsoleOutput;
use Timetabler\Events\BroadcastSimpleMessage;
use Timetabler\Events\PDFGenerated;
use Timetabler\Events\PDFGenerationFailed;
use Timetabler\Timetable;

class GeneratePDF implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    public $timeout = 600;
    public $tries = 1;


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
            "message"=> "Generating pdf..."
        ];
        event(new BroadcastSimpleMessage(json_encode($message)));

        $sessions = Timetable::with(
            'days',
            'days.periods',
            'days.periods',
            'days.periods.occupiedSessions',
            'days.periods.occupiedSessions.unit',
            'days.periods.occupiedSessions.unit.levelsInSession',
            'days.periods.occupiedSessions.unit.levelsInSession.program',
            'days.periods.occupiedSessions.room',
            'days.periods.occupiedSessions.period',
            'days.periods.occupiedSessions.period.day'
        )
            ->get()->last()
            ->days->pluck('periods')->flatten()
            ->pluck('occupiedSessions')->flatten()
            ->map(function($session){
                $session->levelsInSession = $session->unit->levelsInSession[0];
                $session->school = $session->levelsInSession->school();
                return $session;
            })->groupBy('school.name');
            /*->sortBy('levelsInSession.level')
            ->groupBy('levelsInSession.level');*/

        /*$console = new ConsoleOutput();
        $console->writeln(dd($sessions));*/
        /*$pdf = PDF::loadView('pdf.timetable', ['sessions'=> $sessions]);*/

        $pdf = App::make('snappy.pdf.wrapper');
        $pdf->loadView('pdf.timetable', ['schools'=> $sessions]);
        $pdf->setPaper('A4', 'portrait')->setOption('margin-bottom', 10)->setOption('margin-top', 10);
        //$pdf->setOption('no-pdf-compression',true);
        //return
        $pdf->save("public/timetable.pdf", true);

        $message = [
            "type"=> "timetable-generator",
            "message"=> "PDF Generated"
        ];
        event(new BroadcastSimpleMessage(json_encode($message)));

        event(new PDFGenerated());
    }

    public function failed(Exception $exception){
        event(new PDFGenerationFailed());
    }
}
