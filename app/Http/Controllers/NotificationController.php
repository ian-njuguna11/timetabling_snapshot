<?php

namespace Timetabler\Http\Controllers;

use Illuminate\Http\Request;
use Pusher\Pusher;

use RealRashid\SweetAlert\Facades\Alert;


class NotificationController extends Controller
{
    public function notify()
    {
        $options = array(
                        'cluster' => env('PUSHER_APP_CLUSTER'),
                        'encrypted' => true
                        );
        $pusher = new Pusher(
                            env('PUSHER_APP_KEY'),
                            env('PUSHER_APP_SECRET'),
                            env('PUSHER_APP_ID'), 
                            $options
                        );

        $data['message'] = 'There will be a crush...';
        $pusher->trigger('notify-channel', 'App\\Events\\Notify', $data);

    }
    
    public static function notification($type)
    {
        switch ($type) {
            case 'message':
                alert()->message('Sweet Alert with message.');
                break;
            case 'basic':
                alert()->basic('Sweet Alert with basic.','Basic');
                break;
            case 'info':
                alert()->info('Sweet Alert with info.');
                break;
            case 'success':
                alert()->success('Sweet Alert with success.','Welcome to ItSolutionStuff.com')->autoclose(3500);
                break;
            case 'error':
                alert()->error('Sweet Alert with error.');
                break;
            case 'warning':
                alert()->warning('Sweet Alert with warning.');
                break;
            default:
                # code...
                break;
        }


        return back();
    }
}
