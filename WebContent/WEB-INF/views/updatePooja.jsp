<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	<link type="text/css" rel="stylesheet" href="css/daterangepicker-bs3.css" >

<style type="text/css">
	.kpl { padding-left: 0; }
	.kpr { padding-right: 0; }
</style>
</head>
<body>
<div id="wrapper">
<!-- Sidebar -->
	<jsp:include page="header.jsp" />
<div id="page-wrapper">
	<div class="row">
	<div class="col-sm-12" id="page-header">
		<h3> Update Pooja </h3>
		<ol class="breadcrumb">
			<li class="active"><i class="fa fa-cog"></i> To Update/Remove the details of Pooja</li>
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
		<form class="form-horizontal" id="form-update-pooja" action="updatePoojas.do" method="post" target="target-fup">
			<input type="hidden" id="id" name="id" value="${pooja.id}">
			<div class="form-group">
				<label for="result" class="col-sm-3 control-label">Pooja Name</label>
				<div class="col-sm-8"><input type="text" class="form-control" name="name" value="${pooja.name}"></div>
			</div>
			<div class="form-group">
				<label for="result" class="col-sm-3 control-label">Total Charge</label>
				<fmt:formatNumber var="price" value="${pooja.price}" minFractionDigits="2" maxFractionDigits="2" scope="page"/>
				<div class="col-sm-8"><input type="text" class="form-control" id="price" name="price" value="${price}"></div>
			</div>
			<div class="form-group">
				<label for="result" class="col-sm-3 control-label">Timings</label>
				<c:set var="data" value="${pooja.date} ${pooja.start} - ${pooja.date} ${pooja.end}" scope="page"/>
				<div class="col-sm-8"><input type="text" class="form-control" id="timings" value="${data}" placeholder="Select Date & Time from here."></div>
			</div>
			<div class="form-group">
				<label for="result" class="col-sm-3 control-label">Date</label>
				<div class="col-sm-8"><input type="text" class="form-control" id="date" name="date" value="${pooja.date}" placeholder="Date"></div>
			</div>
			<div class="form-group">
				<label for="result" class="col-sm-3 control-label">Time</label>
				<div class="col-sm-8">
					<div class="col-sm-6 kpl"><input type="text" class="form-control" id="start" name="start" value="${pooja.start}" placeholder="Start"></div>
					<div class="col-sm-6 kpr"><input type="text" class="form-control" id="end" name="end" value="${pooja.end}" placeholder="End"></div>
				</div>
			</div>
			<div class="form-group">
				<label for="result" class="col-sm-3 control-label">Frequency</label>
				<div class="col-sm-8">
					<select class="form-control" name="frequency">
						<option value="">--Select the Pooja-Type--</option>
						<option value="Daily" ${(pooja.type == 'Daily')? 'selected' : ''}>Daily</option>
						<option value="Weekly" ${(pooja.type == 'Weekly')? 'selected' : ''}>Weekly</option>
						<option value="Monthly" ${(pooja.type == 'Monthly')? 'selected' : ''} style="display: none;">Monthly</option>
						<option value="Yearly" ${(pooja.type == 'Yearly')? 'selected' : ''} style="display: none;">Yearly</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label for="result" class="col-sm-3 control-label">Description</label>
				<div class="col-sm-8"><textarea rows="3" class="form-control" name="description" placeholder="About Pooja">${pooja.about}</textarea></div>
			</div>
			<div class="form-group">
			<div class="col-sm-offset-3 col-sm-8">
				<button type="submit" class="btn btn-primary btn-sm">Upate Pooja</button>
				<button type="reset" class="btn btn-info btn-sm">Reset</button>
			</div></div>
		</form>
		</div>
	</div></div><!-- /.row -->
</div><!-- /#page-wrapper -->
<iframe name="target-fup" style="border: 0;height: 0;width: 0;display: none;"></iframe>

<!-- footer-stat -->
	<jsp:include page="footer.jsp" />
<!-- footer-end -->

</div><!-- /#wrapper -->

<!-- JavaScript -->
<script src="js/jquery-1.10.2.js"></script>
<script src="js/jquery-ui-1.10.3.custom.js"></script>
<script src="js/jquery.validate.min.js"></script>
<script src="js/bootstrap/bootstrap.js"></script>
<script src="js/moment.js"></script>
<script src="js/daterangepicker.js"></script>
<script src="js/password.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	$("#form-update-pooja").validate({
		rules: {
			end: { required: true },
			name: { required: true },
			date: { required: true },
			start: { required: true },
			frequency: { required: true },
			description: { maxlength: 200 },
			price: { required: true, number:true }
		},
		errorElement: "div" ,
		errorClass:"text-danger",
		messages: {
			name: { required: "Please Enter the Name" },
			frequency: { required: "Select the Pooja-Type" }
		}
	});

	$("#form-update-pooja button[type=reset]").click(function() {
		var tag = $(this).parent().parent().parent();
		tag.find("div[class=text-danger]").hide();
	});

	var price = $("#price");
	price.keyup(function() {
		this.value = this.value.replace(/[^0-9\.]+/g, '');
	});
	price.blur(function() {
		this.value = parseFloat(this.value).toFixed(2);
	});

	var date = new Date();
	var dated = date.getDate()+"-"+(date.getMonth()+1)+"-"+date.getFullYear();
	var timings = $("#timings");
	timings.daterangepicker({
		format: 'DD-MM-YYYY hh:mm A',
		startDate: dated,
		minDate: '1d',
		timePicker: true,
		timePicker12Hour: true,
		timePickerIncrement: 1
	});
	timings.on("apply.daterangepicker", function(av, picker) {
		$("#date").val(picker.startDate.format('DD-MM-YYYY'));
		$("#start").val(picker.startDate.format('hh:mm A'));
		$("#end").val(picker.endDate.format('hh:mm A'));
	});
});
</script>
</body>
</html>