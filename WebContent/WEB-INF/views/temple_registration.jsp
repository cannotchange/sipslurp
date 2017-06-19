 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="">

	<title>Holy Place.in</title>

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


<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
<!-- Brand and toggle get grouped for better mobile display -->
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
			<span class="sr-only">Toggle navigation</span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="index.do">Back</a>
		  
		   
	</div>
<!-- Collect the nav links, forms, and other content for toggling -->
	<div class="collapse navbar-collapse navbar-ex1-collapse"></div><!-- /.navbar-collapse -->
</nav><!-- end of side bar -->

<div class="row">
<div class="col-sm-4" style="margin: 0px auto;float: none;">
	<div class="form-login">
		<div class="heading">
			<h3 class="mainheading" style="border-bottom:1px solid #000000; padding:3px;"><span class="blue"></span>Temple Registration</h3>
			
			
		</div>
				<div class="registerform">
					<form id="form-register-temple" name="form-register-temple" action="registration.do" method="post" role="form"  enctype="multipart/form-data">
					


						<div class="form-group">
							<c:if test="${not empty error}">
								<p style="color: red;">
									<button type="button" class="close">&times;</button>
									${error}
								</p>
							</c:if>


							<c:if test="${not empty success}">
								<p style="color: green;">
									<button type="button" class="close">&times;</button>
									${success}
								</p>
							</c:if>
						</div> 
						<div class="form-group" style="margin-bottom: 5px;">
							<label for="temp_name">Temple Name</label> <input type="text"
								class="form-control" name="temple_name" placeholder="Enter the temple name">
						</div>
						
						<div class="form-group" style="margin-bottom: 5px;">
							<label for="Contact_Person">Contact Person</label> <input type="text"
								class="form-control" name="contact_person" placeholder="Enter your Name">
						</div>
						
						<div class="form-group" style="margin-bottom: 5px;">
							<label for="email">Email ID</label> <input type="text"
								class="form-control" name="email" placeholder="Enter Email Id">
						</div>
						<div class="form-group">
							<label for="password">Password</label> <input type="password" id="txtPassword"
								class="form-control" name="password"
								placeholder="Enter the password">
						</div>
						<div class="form-group">
							<label for="confirmpassword">Confirm Password</label> <input type="password" id="txtConfirmPassword"
								class="form-control" name="confirmpassword"
								placeholder="Enter confirmpassword">
						</div>
						<div class="form-group">
							<label for="cont">Contact Number</label> <input class="form-control" name="cont"
								 maxlength="10"  size="10" placeholder="Enter the phone number" type="text">
						</div>
						<div class="form-group">
							<label for="religious">Religious</label> 
							<select name="religious" class="selectpicker">
								<option value="Hindu">Hindu</option>
								<option value="Christian">Christian</option>
								<option value="Sikh"> Sikh</option>
								<option value="Jain">Jain</option>
								<option value="Muslim">Muslim</option>
								<option value="others">Others</option>
							</select>
						</div>
						<div class="form-group">
							<label for="address">Address</label>
							<textarea class="form-control" name="address" id="exampleTextarea" rows="3"></textarea>
						</div>
						
						<div class="form-group">
							<label for="document">Add Temple images</label>
						    <input type="file" class="form-control" name="file" >
						</div> 

				   <div class="row">
					  <div class="col-sm-12 text-center">
					      <button type="submit" class="btn btn-primary btn-sm"  onclick="return Validate()">Register</button>  
					      <button type="reset" class="btn btn-primary btn-sm">Reset</button></div>
					    </div>   
					    </form>
					    
					</div>     			
				</div>
				</div>

			</div>
		
			
			
					

<!-- /.col-sm-4 -->

<!-- JavaScript -->
<script src="js/jquery-1.10.2.js"></script>
<script src="js/jquery.validate.min.js"></script>
<script src="js/jquery-ui-1.10.3.custom.js"></script>
<script src="js/bootstrap/bootstrap.js"></script>
<script type="text/javascript">
    function Validate() {
        var password = document.getElementById("txtPassword").value;
        var confirmPassword = document.getElementById("txtConfirmPassword").value;
        if (password != confirmPassword) {
            alert("Passwords do not match.");
            return false;
        }
        return true;
        
       }
    
</script>

<script type="text/javascript">

$(document).ready(function() {
	$("#form-register-temple").validate({
		rules: {
			
		 temple_name: { required: true },
	  contact_person: { required: true },
			   email: { required: true },  
			password: { required: true,minlength: 5, maxlength: 45 },
	 confirmpassword: { required: true,minlength: 5, maxlength: 45 },
			    cont: { required: true },
		   religious: { required: true },
		     address: { required: true },
		    //document: { required: true }
		},
		
		errorElement: "div",
		errorClass: "text-danger",
		
		messages: {
			
	     temple_name: { required: "Enter the temple name" },
	  contact_person: { required: "Enter the name"},
			   email: { required: "Enter the Email Id " },  
		    password: { required: "Enter the password" },
	 confirmpassword: { required: "Enter the confirmpassword" },
				cont: { required: "Enter the contact number" },
		   religious: { required: "Select the religious" },
			 address: { required: "Enter the address" },
			//document: { required: "upload the registrtion document of the temple" }
			 
			 
		}
	});
	
	
	$("#form-register-temple button[type=reset]").click(function() {
		var tag = $(this).parent().parent().parent();
		tag.find("div[class=text-danger]").hide();
	});
	
});
</script>


</body>

</body>
</html> 


<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="savefile.do" method="post" enctype="multipart/form-data">  
Select File: <input type="file" name="file"/>  
<input type="submit" value="Upload File"/>  
<input type="text" name="temple_name"/>  
</form> 

</body>
</html> --%>