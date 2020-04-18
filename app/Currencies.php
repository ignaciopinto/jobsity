<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Currencies extends Model
{
	protected $table = 'currencies';
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'value', 'name'
    ];

    static function currency_exists($currency){
    	return Currencies::where('value',strtoupper($currency))->exists();
    }


}
