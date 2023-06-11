<?php
/**
 * Created by PhpStorm.
 * User: shemkiptoo
 * Date: 9/10/21
 * Time: 11:41 PM
 */

namespace Timetabler;

use Illuminate\Support\Facades\Crypt;

class Hide{

    public static function encrypt($req){
        return Crypt::encryptString($req);
    }

    public static function decrypt($req){
        return Crypt::decryptString($req);
    }

};