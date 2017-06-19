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
	<div class="col-sm-12">
		<h3> Create New Pooja </h3>
		<ol class="breadcrumb">
			<li class="active"><i class="fa fa-cog"></i> To Create the New Pooja</li>
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
		<form class="form-horizontal" id="form-add-marks" action="createPooja.do" method="post">
			<div class="form-group">
				<label for="result" class="col-sm-3 control-label">Pooja Name</label>
				<div class="col-sm-8"><input type="text" class="form-control" id="name" name="name"></div>
			</div>
			<div class="form-group">
				<label for="result" class="col-sm-3 control-label">Total Charge</label>
				<div class="col-sm-8"><input type="text" class="form-control" id="price" name="price"></div>
			</div>
			<div class="form-group">
				<label for="result" class="col-sm-3 control-label">Timings</label>
				<div class="col-sm-8"><input type="text" class="form-control" id="timings"></div>
			</div>
			<div class="form-group">
				<label for="result" class="col-sm-3 control-label">Date</label>
				<div class="col-sm-8"><input type="text" class="form-control" id="date" name="date" placeholder="Date"></div>
			</div>
			<div class="form-group">
				<label for="result" class="col-sm-3 control-label">Time</label>
				<div class="col-sm-8">
					<div class="col-sm-6 kpl"><input type="text" class="form-control" id="start" name="start" placeholder="Start"></div>
					<div class="col-sm-6 kpr"><input type="text" class="form-control" id="end" name="end" placeholder="End"></div>
				</div>
			</div>
			<div class="form-group">
				<label for="result" class="col-sm-3 control-label">eeeeeeeeee</label>
				<div class="col-sm-8"><input type="text" class="form-control" id="action" name="action"></div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-3 col-sm-8"><button type="submit" class="btn btn-primary">Create Pooja</button></div>
			</div>
		</form>
		</div>
	</div></div><!-- /.row -->
</div><!-- /#page-wrapper -->
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
	var date = new Date();
	var dated = date.getDate()+"-"+(date.getMonth()+1)+"-"+date.getFullYear();
	$('#timings').daterangepicker(
		{
			format: 'DD-MM-YYYY hh:mm A',
			startDate: dated,
			minDate: '1d',
			timePicker: true,
			timePicker12Hour: true,
			timePickerIncrement: 1
		}
	);
	

	$('#timings').on("apply.daterangepicker", function(av, picker) {
		$("#date").val(picker.startDate.format('YYYY-MM-DD'));
		$("#start").val(picker.startDate.format('hh:mm A'));
		$("#end").val(picker.endDate.format('hh:mm A'));
	/* 	for(var key in picker) {//function to iterate over the 'object' & find variables
			if (picker.hasOwnProperty(key))
				console.log(key+":"+picker[key]);
		} */
	});
});
</script>
</body>
</html>