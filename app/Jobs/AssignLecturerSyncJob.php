<?php

namespace Timetabler\Jobs;

use Illuminate\Bus\Queueable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Support\Facades\Redis;

class AssignLecturerSyncJob implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;
    
    public $new_session, $lec_id;

    /**
     * Create a new job instance.
     *
     * @return void
     */
    public function __construct($new_session, $lec_id)
    {
        //
        
        $this->new_session = $new_session;
        $this->lec_id = $lec_id;
        
    }

    /**
     * Execute the job.
     *
     * @return void
     */
    public function handle()
    {
        //
        echo "***********asssigned: session " . $this->new_session . "to " . $this->lec_id;
        
        Redis::publish('session-CRUD', json_encode(['id' => $this->new_session, 'verb' => 'update','lec_id' => $this->lec_id ]));
        
    }
}
