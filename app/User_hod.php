<?php

namespace Timetabler;

use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Laravel\Passport\HasApiTokens;
use Spatie\Permission\Traits\HasRoles;

class User_hod extends Authenticatable
{
    use HasApiTokens;
    use Notifiable;
    use HasRoles;

    protected $guard = 'hods';
    protected $table = 'h_o_d_s';

    protected $fillable = [
        'name', 'email', 'password','role','lecturer_ID','department_ID',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];
}
