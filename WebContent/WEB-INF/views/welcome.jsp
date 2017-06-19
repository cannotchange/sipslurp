<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="">

	<title>Ayyappa Temple</title>

	<link type="text/css" rel="stylesheet" href="css/bootstrap.css" >
	<link type="text/css" rel="stylesheet" href="font-awesome/css/font-awesome.min.css">
<style type="text/css">
	.form-login {
		padding: 12px 15px;
		background-color: rgb(220,220,255);
		border: 1px solid #fff;
		border-radius: 8px;
		margin-top: 110px;
	}
</style>
</head>
<body>

<c:if test="${(not empty user) && (not empty roles)}">
	<script type="text/javascript">location.href="${user.type}.do";</script>
</c:if>

<!-- Sidebar -->
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation"><!-- Brand and toggle get grouped for better mobile display -->
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
			<span class="sr-only">Toggle navigation</span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		</button>
 		<a class="navbar-brand" href="index.do">Back</a>
		
		<!--<div class="link"><label><a href="happy.do"><i class="fa fa-user"></i> User Login</a></label></div> -->
		
	      
</div>
<!-- Collect the nav links, forms, and other content for toggling -->
	<div class="collapse navbar-collapse navbar-ex1-collapse"></div><!-- /.navbar-collapse -->
</nav><!-- end of side bar -->

<div class="row">
<div class="col-sm-4" style="margin: 0px auto;float: none;">
	<div class="form-login">
		<div class="heading">
			<h3 class="mainheading" style="border-bottom:1px solid #000000; padding:3px;"><span class="blue"></span>ADMIN login</h3>
		</div>
		<div class="reloginform">
			<form id="form-login-user" action="login.do" method="post" role="form">
				<div class="form-group">
					<c:if test="${not empty error}">
						<p style="color:red;"><button type="button" class="close">&times;</button> ${error}</p>
					</c:if>
				</div>
				<div class="form-group">
					<label for="username">User Name</label>
					<input type="text" class="form-control" name="username" placeholder="Enter User Name">
				</div>
				<div class="form-group" style="margin-bottom: 5px;">
					<label for="password">Password</label>
					<input type="password" class="form-control" name="password" placeholder="Enter Password">
				</div>
				<div class="row">
					<div class="col-sm-12">
						<div class="checkbox"><label><input type="checkbox"><small>Forgot password ...?</small></label></div>
						
						
					</div>
				</div>
				<div class="row">
					<div class="col-sm-12 text-center"><button type="submit" class="btn btn-primary btn-sm">Login</button></div>
				</div>
				
				
			</form>
		</div>
	</div>
</div><!-- /.col-sm-4 -->
</div><!-- /.row -->

<!-- JavaScript -->
<script src="js/jquery-1.10.2.js"></script>
<script src="js/jquery.validate.min.js"></script>
<script src="js/jquery-ui-1.10.3.custom.js"></script>
<script src="js/bootstrap/bootstrap.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	$("#form-login-user").validate({
		rules: {
			username: { required: true },
			password: { required: true }
		},
		errorElement: "div",
		errorClass: "text-danger",
		messages: {
			username: { required: "Enter the Username" },
			password: { required: "Enter the Password" }
		}
	});
	$("button[class=close]").click(function() {
		$(this).parent().remove();
	});
// 	$("#username").focus();
});
</script>
</body>
</html>
