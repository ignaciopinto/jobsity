<!DOCTYPE html>
<html>
<head>
	<title>Currency Bot - Jobsity</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<!-- View Css JS -->
	<link rel="stylesheet" href="{{ URL::asset('../resources/css/chat.css') }}" crossorigin="anonymous">
	<!-- // View Css JS -->
</head>
<body>
	<br />
	<div class="container-fluid">
		<div class="row">
			<div class="col-3">
				@if(isset(Auth::user()->email))
				<div class="table-responsive">
					<table class="table table-borderless">
						<tbody>
							<tr>
								<th scope="col">User:</th>
								<td scope="col">{{Auth::user()->name}}</td>
							</tr>
							<tr>
								<th scope="col">Email:</th>
								<td scope="col">{{Auth::user()->email}}</td>
							</tr>
							<tr>
								<th scope="col">Default Currency:</th>
								<td scope="col" id="currency">{{Auth::user()->default_currency}}</td>
								<span style="display: none;" id="balance">{{Auth::user()->balance}}</span>
							</tr>
						</tbody>
					</table>
				</div>
				<h4> Commands </h4>
				<ul>
					<li>Logout: /Logout</li>
					<li><b>*</b>Deposit: /Deposit Qty Currency <br>Ex: <i>/Deposit 2000 USD</i></li>
					<li><b>*</b>Withdraw: /Deposit Qty Currency <br>Ex: <i>/Withdraw 2000 USD</i></li>
					<li>Show Balance: /Balance</li>
				</ul>
				<small><b>*If the currency is omitted, the default one will be used.</b></small>
				@else
				<h4> Commands </h4>
				<ul>
					<li>Sign in: /Signin</li>
					<li>Login: /Login</li>
				</ul>
				@endif

			</div>
			<div class="col-8">
				<div class="container box">
					<h3 align="center">Currency Bot</h3>
					<div class="container box chat">
						<div id="mensaje" style="">
							@if(isset(Auth::user()->email))
							Welcome {{Auth::user()->name}}
							<br>
							Remember, to <b>Logout</b> just type "/Command Logout"
							@else
							You must login for me to help you
							<br>
							Type <b>/Command Login</b> to start the login process
							@endif
						</div>
					</div>
					<br>
					<div class="container box borderless">
						<div id="commands_inputs" class="input-group" style="width: 90%;margin: 0 auto">
							<input class="form-control" aria-label="With textarea" id="textchat"/>
							<div class="input-group-append">
								<button class="btn btn-outline-secondary" id="commandbtn" onclick="command();" type="button">Send</button>
								<button style="display: none;" id="loginbtn" class="btn btn-outline-secondary" onclick="login();" type="button">Senda</button>
							</div>
						</div>
						<div id="signin_inputs" class="input-group" style="display:none;width: 90%;margin: 0 auto">
							<span id="askforsign" style=""></span>
							<input class="form-control" aria-label="With textarea" id="signinput"/>
							<div class="input-group-append">
								<button class="btn btn-outline-secondary" onclick="signin();" type="button">Send</button>
							</div>
						</div>
						<div id="login_inputs" class="input-group" style="display:none;width: 90%;margin: 0 auto">
							<input class="form-control" aria-label="With textarea" id="textchat2"/>
							<div class="input-group-append">
								<button class="btn btn-outline-secondary" onclick="command();" type="button">Send</button>
							</div>
						</div>		
						@if(isset(Auth::user()->email))

						@else

						@endif
					</div>
					<br>
					<!-- Forms -->
					<!-- Login Form -->
					<form style="display: none;" id="loginform" method="post" action="{{ url('/main/checklogin') }}">
						{{ csrf_field() }}
							<input type="email" id="email" name="email" required class="form-control" />
							<input type="password" id="password" name="password" required class="form-control" />
							<input type="submit" name="login" class="btn btn-primary"/>
					</form>
					<!-- balance change Form -->
					<form style="display: ;" id="balanceform" method="post" action="{{ url('/mainchat/balance_change') }}">
						{{ csrf_field() }}
							<input type="text" id="default_curr" name="default_curr" class="" value="{{Auth::user()->default_currency}}" />
							<input type="text" id="balance_curr" name="balance_curr" class="" />
							<input type="text" id="balance_qty" name="balance_qty" class="" />
							<input type="submit" name="balance_submit"/>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script src="{{ URL::asset('../resources/js/chat.js') }}"></script>
</body>
</html>
