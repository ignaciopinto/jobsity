<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Validator;
use Auth;

class AuthController extends Controller
{
	function index()
	{
		return view('login');
	}

	function checklogin(Request $request)
	{
		$user_data = array(
			'email'  => $request->get('email'),
			'password' => $request->get('password')
		);

		if(Auth::attempt($user_data))
		{
			return redirect('mainchat');
		}
		else
		{
			return back()->with('error', 'I couldn\'t find your E-Mail or Password, please try again.');
		}

	}

	function successlogin()
	{
		return view('mainchat');
	}

	function logout()
	{
		Auth::logout();
		return redirect('mainchat');
	}
}

?>
