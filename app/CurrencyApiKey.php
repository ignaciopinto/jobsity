<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class CurrencyApiKey extends Model
{
    static function get_key($website){
    	return CurrencyApiKey::where("website","=",$website)->first();
    }
}
