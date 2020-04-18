<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class ChatController extends Controller
{
	function index()
	{
		return view('mainchat');
	}

	function currency_exchange($currency1,$currency2){
		$api_key = "Aq9g5mCabHziDdjEyMRciGdtq5qNpf";
		$url = "https://www.amdoren.com/api/currency.php?api_key=$api_key&from=$currency1&to=$currency2";
		$ch = curl_init();  
		curl_setopt($ch, CURLOPT_URL, $url);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
		curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 15); 
		curl_setopt($ch, CURLOPT_TIMEOUT, 30);
		$json_string = curl_exec($ch);
		$parsed_json = json_decode($json_string);
		$error = $parsed_json->error;
		$error_message = $parsed_json->error_message;
		$amount = $parsed_json->amount;
	}

}
