<?php

namespace App;
use Illuminate\Support\Facades\Hash;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class User extends Authenticatable
{
    use Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password','default_currency','balance'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    static function balance_update($user_id,$qty){
        $user = User::find($user_id);
        $newbalance = round($user->balance,2) + round($qty,2);
        if($newbalance < 0){
            return -1;
        }else{
            $user->balance = $newbalance;
            $user->save();
            return $user->balance; 
        }

    }

    static function user_exists($username,$email){
        $user = User::where("name","=",$username)->orWhere("email","=",$email)->count();
        return $user;
    }

    static function signin($request){
        $currency = $request->get('sign_currency');
        $balance = $request->get('sign_balance');
        $username = $request->get('sign_username');
        $email = $request->get('sign_email');
        $password = $request->get('sign_password');

        $user = new User;
        $user->name = $username;
        $user->email = $email;
        $user->default_currency = $currency;
        $user->balance = $balance;
        $user->password = Hash::make($password);
        $user->save();
        return $user->id;
    }

}
