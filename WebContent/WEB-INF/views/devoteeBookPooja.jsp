<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<style type="text/css">
	.kpl { padding-left: 0; }
	.kpr { padding-right: 0; }
/* 	.form-group { margin-bottom: 10px; } */
</style>
</head>
<body>
<div id="wrapper">
<!-- Sidebar -->
	<jsp:include page="header.jsp" />
<div id="page-wrapper">
	<div class="row">
	<div class="col-sm-12" id="page-header">
		<h3> Book for Pooja </h3>
		<ol class="breadcrumb">
			<li class="active"><i class="fa fa-cog"></i> To Book for the Pooja with Details</li>
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

	<fmt:formatNumber var="price" value="${info.price}" minFractionDigits="2" maxFractionDigits="2" scope="page"/>
	<div class="row">
	<div class="col-sm-10" style="margin: 0px auto;float: none;">
		<table class="table text-muted" style="width: 100%;border: 1px solid #DDD;">
			<tr><td>Pooja-Name :&nbsp;<span class="text-info">${info.name}</span></td>
				<td>Type :&nbsp;<span class="text-info">${info.type}</span></td>
				<td></td>
			</tr>
			<tr><td>Price :&nbsp;<span class="text-info">Rs&nbsp;${price}</span></td>
				<td>Start On :&nbsp;<span class="text-info">${info.date}</span></td>
				<td>Timings :&nbsp;<span class="text-info">${info.start} - ${info.end}</span></td>
			</tr>
		</table>
	</div></div><!-- /.row -->

	<div class="row">
	<div class="col-sm-6" style="margin: 0px auto;float: none;">
		<div class="page_main" style="border-radius: 8px;border: 1px solid #fff;padding: 12px;background-color: rgb(220, 220, 255);">
		<form class="form-horizontal" id="form-book-pooja" action="book4Pooja.do" method="post" target="target-fbp">
			<input type="hidden" name="poojaId" value="${info.id}">
			<div class="form-group">
				<label for="fullname" class="col-sm-3 control-label">Full Name</label>
				<div class="col-sm-8"><input type="text" class="form-control" name="fullname" placeholder="Enter the Name"></div>
			</div>
			<div class="form-group">
				<label for="name" class="col-sm-3 control-label">Contact No</label>
				<div class="col-sm-8"><input type="text" class="form-control" id="contact" name="contact" placeholder="Enter Contact No."></div>
			</div>
			<div class="form-group">
				<label for="name" class="col-sm-3 control-label">Email-ID</label>
				<div class="col-sm-8"><input type="email" class="form-control" name="email"></div>
			</div>
			<div class="form-group">
				<label for="name" class="col-sm-3 control-label">Address</label>
				<div class="col-sm-8"><textarea rows="3" class="form-control" name="address" placeholder="Enter the Address"></textarea></div>
			</div>
			<div class="form-group">
				<label for="name" class="col-sm-3 control-label">Amount Paid</label>
				<div class="col-sm-8"><input type="text" class="form-control" id="amount" name="amount" placeholder="Enter Amount Paid"></div>
			</div>
			<div class="form-group">
				<label for="name" class="col-sm-3 control-label">Date</label>
				<div class="col-sm-8"><input type="text" class="form-control" id="date" name="date" placeholder="Date of Pooja"></div>
			</div>
			<div class="form-group">
			<div class="col-sm-offset-3 col-sm-8">
				<button type="submit" class="btn btn-primary btn-sm">&nbsp;Book&nbsp;</button>
				<button type="reset" class="btn btn-info btn-sm">Reset</button>
			</div></div>
		</form>
		</div>
	</div></div><!-- /.row -->
</div><!-- /#page-wrapper -->

<!-- footer-stat -->
	<jsp:include page="footer.jsp" />
<!-- footer-end -->

</div><!-- /#wrapper -->
<iframe name="target-fbp" style="border: 0;height: 0;width: 0;display: none;"></iframe>

<jsp:include page="commonFiles.jsp" />

<script type="text/javascript">
$(document).ready(function() {
	$("#form-book-pooja").validate({
		rules: {
			email: { email: true },
			date: { required: true },
			amount: { required: true, number: true },
			contact: { required: true, number: true, minlength: 10, maxlength: 12 },
			fullname: { required: true, maxlength: 90 },
			address: { maxlength: 200 }
		},
		errorElement: "div" ,
		errorClass:"text-danger",
		messages: {
			date: { required: "Select Date for your Pooja" },
			fullname: { required: "Please Enter the Fullname" },
			contact: { required: "Enter the Contact No." },
			amount: { required: "Enter the Amount Paid" },
		}
	});

	$("#form-book-pooja button[type=reset]").click(function() {
		var tag = $(this).parent().parent().parent();
		tag.find("div[class=text-danger]").hide();
	});

	$("#amount, #contact").keyup(function() {
		this.value = this.value.replace(/[^0-9\.]+/g, '');
	});
	$("#amount").blur(function() {
		this.value = parseFloat(this.value).toFixed(2);
	});
	$("#contact").blur(function() {
		this.value = parseInt(this.value);
	});

	$("#date").datepicker({
		dateFormat: 'dd-mm-yy',
		changeMonth: true,
		changeYear:  true,
		yearRange: '0y:+5',
		minDate: '+1d'
	});
});
</script>
</body>
</html>