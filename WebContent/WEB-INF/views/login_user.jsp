<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="">
	<title>My project</title>

	<link type="text/css" rel="stylesheet" href="css/bootstrap.css" >
	<link type="text/css" rel="stylesheet" href="font-awesome/css/font-awesome.min.css">
<style type="text/css">
	.form-login {
		padding: 20px 15px;
		background-color:rgb(220,220,255);
		border: 1px solid #eee;
		border-radius: 8px;
		margin-top: 110px;
		
	}
</style>
</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation"><!-- Brand and toggle get grouped for better mobile display -->
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
			<span class="sr-only">Toggle navigation</span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="index.html">User Login Page</a>
		 <li><a href="admin.do">Admin Login</a></li>
		 <div class="link"><label><a href="temp_reg.do"><i class="fa fa-user"></i>Temple Registration</a></label></div>
		
		      
</div>
<!-- Collect the nav links, forms, and other content for toggling -->
	<div class="collapse navbar-collapse navbar-ex1-collapse"></div><!-- /.navbar-collapse -->
</nav><!-- end of side bar -->

<div class="row">
<div class="col-sm-4" style="margin: 0px auto;float: none;">
	<div class="form-login">
		<div class="heading">
			<h3 class="mainheading" style="border-bottom:1px solid #000000; padding:3px;"><span class="blue"></span>Registered user Login</h3>
		</div>
		<div class="reloginform">
			<form id="form-registered-user" action="registered_login.do" method="post" role="form">
				<div class="form-group">
		
					<c:if test="${not empty error}">
						<p style="color:red;"><button type="button" class="close">&times;</button> ${error}</p>
					</c:if>
				</div>
				<div class="form-group">
					<label for="username">Email</label>
					<input type="text" class="form-control" name="email" placeholder="Enter your email_id">
				</div>
				<div class="form-group" style="margin-bottom: 5px;">
					<label for="password">Password</label>
					<input type="password" class="form-control" name="password" placeholder="Enter your password">
				</div>
				<div class="row">
					<div class="col-sm-12">
						<div class="checkbox"><label><input type="checkbox"><small>Forgot password ...?</small></label></div>
						<div class="link"><label><a href="reg.do"><i class="fa fa-user"></i>New User??</a></label></div>
						
					</div>
				</div>
				<div class="row">
					<div class="col-sm-12 text-center"><button type="submit" class="btn btn-primary btn-sm">Login</button></div>
				</div>
				
				
				
				
				<!-- JavaScript -->
				<script src="js/jquery-1.10.2.js"></script>
				<script src="js/jquery.validate.min.js"></script>
				<script src="js/jquery-ui-1.10.3.custom.js"></script>
				<script src="js/bootstrap/bootstrap.js"></script>
				
				<script type="text/javascript">
				$(document).ready(function() {
					$("#form-registered-user").validate({
						rules: {
							email: { required: true },
							password: { required: true }
						},
						errorElement: "div",
						errorClass: "text-danger",
						messages: {
							email: { required: "Enter the email_id" },
							password: { required: "Enter the Password" }
						}
					});
					$("button[class=close]").click(function() {
						$(this).parent().remove();
					});
				// 	$("#username").focus();
				});
				</script>
				
			</form>
		</div>
	</div>
</div>
</div>

</body>
</html>