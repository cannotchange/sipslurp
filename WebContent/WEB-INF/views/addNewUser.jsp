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
		<h3> Create New User </h3>
		<ol class="breadcrumb">
			<li class="active"><i class="fa fa-cog"></i> To Create the New User</li>
		</ol>
		<c:if test="${not empty success}">
			<div class="alert alert-success alert-dismissable" style="margin: 0px auto 20px auto;float: none;">
				<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button> ${success}
			</div>
		</c:if>
		<c:if test="${not empty error}">
			<div class="alert alert-danger alert-dismissable" style="margin: 0px auto 20px auto;float: none;">
				<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button> ${error}
			</div>
		</c:if>
	</div></div><!-- /.row -->

	<div class="row">
	<div class="col-sm-6" style="margin: 0px auto;float: none;">
		<div class="page_main" style="border-radius: 8px;border: 1px solid #fff;padding: 12px;background-color: rgb(220, 220, 255);">
		<form class="form-horizontal" id="form-add-user" action="createUser.do" method="post">
			<div class="form-group">
				<label for="name" class="col-sm-3 control-label">Username</label>
				<div class="col-sm-8"><input type="text" class="form-control" name="username" placeholder="Enter the Username"></div>
			</div>
			<div class="form-group">
				<label for="pass" class="col-sm-3 control-label">Password</label>
				<div class="col-sm-8"><input type="password" class="form-control" name="password" placeholder="Enter the Password"></div>
			</div>
			<div class="form-group">
				<label for="name" class="col-sm-3 control-label">Full Name</label>
				<div class="col-sm-8"><input type="text" class="form-control" name="fullname" placeholder="Enter the Full-Name"></div>
			</div>
			<div class="form-group">
				<label for="operation" class="col-sm-3 control-label">Operations</label>
				<div class="col-sm-8">
					<c:forEach var="item" items="${allRoles}">
						<div class="checkbox"><label><input type="checkbox" name="roles" value="${item.id}">&nbsp;${item.rolename}</label></div>
					</c:forEach>
					<div for="roles" generated="true" class="text-danger"></div>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-3 col-sm-8">
					<button type="submit" class="btn btn-primary btn-sm">Create User</button>
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
	$("#form-add-user").validate({
		rules: {
			username: { required: true, minlength: 5, maxlength: 45 },
			password: { required: true, minlength: 5, maxlength: 45 },
			fullname: { maxlength: 100 },
			roles: { required: true }
		},
		errorElement: "div" ,
		errorClass:"text-danger",
		messages: {
			username: { required: "Enter the Username" },
			password: { required: "Enter the Password" },
			fullname: { required: "Enter the Full-Name" },
			roles: { required: "Select atleast One-Operation" }
		}
	});

	var userTag = $("input[name=username]");
	userTag.blur(function() {
		var user = $.trim(this.value);
		if(user != "") {
			$.ajax({
				type: "POST",
				data: "user="+user,
				url: "checkUser.do",
				success: function(data) {
					var username = data.username;
					if(username != null) {
						if(username.toLowerCase() == user.toLowerCase()) {
							userTag.val(data.username);
							$("input[name=fullname]").val(data.fullname);
							$("input[name=roles]").prop("checked", false);
							$.map(data.roles, function(item) {
								$("input[name=roles][value="+item+"]").prop("checked", true);
							});
						}
					}
				},
				error: function(XMLHttpRequest, textStatus, errorThrown) {}
			});
		}
	});

	$("#form-add-user button[type=reset]").click(function() {
		var tag = $(this).parent().parent().parent();
		tag.find("div[class=text-danger]").hide();
	});
});
</script>
</body>
</html>