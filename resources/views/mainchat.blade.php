
<!DOCTYPE html>
<html>
<head>
	<title>Currency Bot - Jobsity</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<style type="text/css">
		.box{
			border:1px solid #ccc;
		}
		.box.borderless{
			border:0px;
		}		
		.box .chat{
			width: 85%;
			height: 200px;
			overflow-y: auto;
		}
		.box.sender{
			width: 85%;
			height: 80px;
			overflow-y: auto;		
		}
	</style>
</head>
<body>
	<br />
	<div class="container-fluid">
		<div class="row">
			<div class="col-3">
				@if(isset(Auth::user()->email))
				<div class="table-responsive">
					<table class="table borderless">
						<tr>
							<th>User:</th>
							<td>{{Auth::user()->name}}</td>
						</tr>
					</table>
				</div>
				<h4 id="user_id">User: {{Auth::user()->name}}</h4>
				<h4 id="user_email">Email: {{Auth::user()->email}}</h4>
				<h4 id="user_currency_default">Default Currency: CLP</h4>
				<h4> Commands </h4>
				<small><b>Commands are CASE SENSITIVE</b></small>
				<ul>
					<li>Login: /Login</li>
					<li>Logout: /Logout</li>
					<li>Deposit: /Deposit Currency Qty. Ex: <i>/Deposit USD 2000</i></li>
					<li>Withdraw: /Deposit Currency Qty. Ex: <i>/Withdraw USD 2000</i></li>
					<li>Show Balance: /Balance</li>
				</ul>
				@endif
			</div>
			<div class="col-8">
				<div class="container box">
					<h3 align="center">Currency Bot</h3>
					<div class="container box chat">
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
					<br>
					<div class="container box borderless">
						<div id="commands_inputs" class="input-group" style="width: 90%;margin: 0 auto">
							<textarea class="form-control" aria-label="With textarea" id="textchat"></textarea>
							<div class="input-group-append">
								<button class="btn btn-outline-secondary" onclick="command();" type="button">Send</button>
							</div>
						</div>
						<div id="login_inputs" class="input-group" style="display:none;width: 90%;margin: 0 auto">
							<textarea class="form-control" aria-label="With textarea" id="textchat"></textarea>
							<div class="input-group-append">
								<button class="btn btn-outline-secondary" onclick="command();" type="button">Send</button>
							</div>
						</div>		
						@if(isset(Auth::user()->email))

						@else

						@endif
					</div>
					<script>
						command = function(aut){
							var msg = $('#textchat').val();
							switch(msg.toLowerCase()) {
								case "/login":
								alert("login");
								break;
								case "/logout":
								alert("logout");
								break;
								case "/deposit":
								alert("deposit");
								break;
								case "/withdraw":
								alert("withdraw");
								break;
								case "balance":
								alert("balance");
								break;
								default:
								break;
							}
						}
					</script>		
					<br>
					<form method="post" action="{{ url('/main/checklogin') }}">
						{{ csrf_field() }}
						<div class="form-group">
							<label>Enter Email</label>
							<input type="email" name="email" class="form-control" />
						</div>
						<div class="form-group">
							<label>Enter Password</label>
							<input type="password" name="password" class="form-control" />
						</div>
						<div class="form-group">
							<input type="submit" name="login" class="btn btn-primary" value="Login" />
						</div>
					</form>

					@if ($message = Session::get('error'))
					<div class="alert alert-danger alert-block">
						<button type="button" class="close" data-dismiss="alert">×</button>
						<strong>{{ $message }}</strong>
					</div>
					@endif

					@if (count($errors) > 0)
					<div class="alert alert-danger">
						<ul>
							@foreach($errors->all() as $error)
							<li>{{ $error }}</li>
							@endforeach
						</ul>
					</div>
					@endif
				</div>
			</div>
		</div>
	</div>
</body>
</html>
