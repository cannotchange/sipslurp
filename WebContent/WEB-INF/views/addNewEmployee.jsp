<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="">

	<title>Ayyappa Temple</title>

	<link type="text/css" rel="stylesheet" href="css/bootstrap.css" >
	<link type="text/css" rel="stylesheet" href="css/sb-admin.css"  >
	<link type="text/css" rel="stylesheet" href="css/pepper-grinder/jquery-ui-1.10.3.custom.min.css" >
	<link type="text/css" rel="stylesheet" href="font-awesome/css/font-awesome.min.css">
</head>

<body>


	<div id="wrapper">
<!-- Sidebar -->
	<jsp:include page="header.jsp" />
<div id="page-wrapper">
	<div class="row">
	<div class="col-sm-12">
		<h3> Create New Employee</h3>
		<ol class="breadcrumb">
			<li class="active"><i class="fa fa-cog"></i> To Create the New Employee</li>
		</ol>
			
	</div></div>

	<div class="row">
	<div class="col-sm-6" style="margin: 0px auto;float: none;">
		<div class="page_main" style="border-radius: 8px;border: 1px solid #fff;padding: 12px;background-color: rgb(220, 220, 255);">
		<form class="form-horizontal" id="form-add-employee" action="createemployee.do" method="post">
		
					<div class="form-group">
							<c:if test="${not empty error}">
								<p style="color: red;">
									<button type="button" class="close">&times;</button>
									${error}
								</p>
							</c:if>
							<c:if test="${not empty success}">
								<p style="color: red;">
									<button type="button" class="close">&times;</button>
									${success}
								</p>
							</c:if>
						</div> 
			<div class="form-group">
				<label for="name" class="col-sm-3 control-label">First Name</label>
				<div class="col-sm-8"><input type="text" class="form-control" name="fname" placeholder="Enter your Firstname"></div>
			</div>
			<div class="form-group">
				<label for="pass" class="col-sm-3 control-label">Last Name</label>
				<div class="col-sm-8"><input type="password" class="form-control" name="lname" placeholder="Enter your LastName"></div>
			</div>
			<div class="form-group">
				<label for="name" class="col-sm-3 control-label">Date Of Birth</label>
				<div class="col-sm-8"><input type="text" class="form-control" id="date" name="date" placeholder="Select the Date"></div>
			</div>
			
			<div class="form-group">
				<label for="operation" class="col-sm-3 control-label">Designation</label>
				<div class="col-sm-8">
					<select name="designation" class="selectpicker">
  						<option>Helper</option>
  						<option>Security</option>
 					 	<option>Decorator</option>
						</select>
				</div>
				</div>
				
					<div class="form-group">
				<label for="operation" class="col-sm-3 control-label">Location</label>
				<div class="col-sm-8">
					<select name="location" class="selectpicker">
  						<option>Bangalore</option>
  						<option>Mysore</option>
 					 	<option>Mandya</option>
						</select>
					
			</div>
			</div>
			
			<div class="form-group">
				<div class="col-sm-offset-3 col-sm-8">
					<button type="submit" class="btn btn-primary btn-sm">Create Employee</button>
					<button type="reset" class="btn btn-info btn-sm">Reset</button>
				</div>
			</div>
		</form>
		</div>
	</div></div><!-- /.row -->
</div><!-- /#page-wrapper -->

<!-- footer-stat -->
	<jsp:include page="footer.jsp" />
<!-- footer-end -->

</div><!-- /#wrapper -->

<jsp:include page="commonFiles.jsp" />
<script type="text/javascript">

$(document).ready(function() {
	$("#form-add-employee").validate({
		rules: {
			firstName: { required: true, minlength: 5, maxlength: 45 },
			lastName: { required: true },  
			date: { required: true }
			   	   
		},
		errorElement: "div",
		errorClass: "text-danger",
		messages: {
			firstName: { required: "Enter the Username" },
			lastName: { required: "Enter the lastName " },  
			date: { required: "Enter the Date of Birth" }

		}
	});
	
	
	$("#form-add-employee button[type=reset]").click(function() {
		var tag = $(this).parent().parent().parent();
		tag.find("div[class=text-danger]").hide();
	});
	
	
// 	$("#username").focus();
});


</script>

</body>
</html>