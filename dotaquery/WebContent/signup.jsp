<!doctype html>
<!--[if lt IE 7 ]><html class="ie ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--> 	<html lang="en"> <!--<![endif]-->
<head>

	<!-- General Metas -->
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">	<!-- Force Latest IE rendering engine -->
	<title>Login Form</title>
	<meta name="description" content="">
	<meta name="author" content="">
	<!--[if lt IE 9]>
		<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->
	
	<!-- Mobile Specific Metas -->
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" /> 
	
	<!-- Stylesheets -->
	<link rel="stylesheet" href="css/base.css">
	<link rel="stylesheet" href="css/skeleton.css">
	<link rel="stylesheet" href="css/layout.css">

<script LANGUAGE="JavaScript">
function signup()
{
	var uname = document.getElementById("uname").value;
	var pid = document.getElementById("pid").value;
	var email = document.getElementById("email").value;
	var psw = document.getElementById("psw").value;
	var rpsw = document.getElementById("rpsw").value;
	var xmlhttp = new XMLHttpRequest();
	xmlhttp.open("GET", "http://localhost:8080/dotaquery/Signup?uname="+uname+"&pid="+pid+"&email="+email+"&psw="+psw+"&rpsw="+rpsw,true);
	xmlhttp.send(null);
	
	xmlhttp.onreadystatechange = function()
	{
		if(xmlhttp.readyState==4 && xmlhttp.status==200){
			if(xmlhttp.responseText == 0){
				alert("password not match");
			}
			else if(xmlhttp.responseText == 1)
			{
				alert("email already used");
			}
			else if(xmlhttp.responseText == 2)
			{
				alert("playerid already used");
			}
			else if(xmlhttp.responseText == 3)
			{
				alert("username already used");
			}
			else if(xmlhttp.responseText == 4)
			{
				alert("successfully sign up");
			}
		}
	}
}
</script>

	

	
</head>
<body>



	<!-- Primary Page Layout -->

	<div class=".container">
		
		<div class="form-bg">
			<form >
				<h2>Sign Up</h2>
				<p><input id="uname" type="text" placeholder="Username"></p>
				<p><input id="pid" type="text" placeholder="PlayID"></p>
				<p><input id="email" type="text" placeholder="Email"></p>
				<p><input id="psw" type="password" placeholder="Password"></p>
				<p><input id="rpsw" type="password" placeholder="Re-enter Password"></p>
				<p style="text-align:center;"><a onclick="signup()"><img src="images/signup.jpg" width="64" height="18" alt="" /></a></p>
			<form>
		</div>

	


	</div><!-- container -->

	<!-- JS  -->
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.js"></script>
	<script>window.jQuery || document.write("<script src='js/jquery-1.5.1.min.js'>\x3C/script>")</script>
	<script src="js/app.js"></script>
	
<!-- End Document -->
</body>
</html>