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
	.kpr { padding-right: 0; }
	.form-group { margin-top: 10px;margin-bottom: 10px; }
	.table thead > tr > th { text-align: center;background-color: rgb(198,198,198); }
</style>
</head>
<body>
<div id="wrapper">
<!-- Sidebar -->
	<jsp:include page="header.jsp" />
<div id="page-wrapper">
	<div class="row">
	<div class="col-sm-12">
		<h3> Update Pooja </h3>
		<ol class="breadcrumb">
			<li class="active"><i class="fa fa-cog"></i> To Update/Change the details of Pooja</li>
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
	<div class="col-sm-12" style="margin: 0px auto;float: none;">
		<div class="page_main" style="border-radius: 8px;border: 1px solid #fff;padding: 12px;background-color: rgb(220, 220, 255);">
		<form class="form-horizontal" id="form-update-pooja" action="#" method="post">
			<div class="form-group">
				<div class="col-sm-3 kpr">
					<label for="name" class="col-sm-2 control-label">Date</label>
					<div class="col-sm-10 kpr"><input type="text" class="form-control" id="date" name="date" placeholder="Select the Date"></div>
				</div>
				<div class="col-sm-2"><button type="button" class="btn btn-primary">Check Avalability</button></div>
			</div><!-- /.form-group -->
		</form>
		</div>
	</div></div><!-- /.row -->

	<div class="row">
	<div class="col-sm-12" style="margin: 20px auto 0px auto;float: none;">
		<table class="table table-bordered table-condensed table-stripped text-center" id="poojaTable">
			<thead>
				<tr><th>S.No</th>
					<th>Pooja Name</th>
					<th>Type</th>
					<th>Price(in Rs)</th>
					<th>Created On</th>
					<th>Timings</th>
					<th></th>
				</tr>
			</thead>
			<tbody></tbody>
		</table>
	</div></div><!-- /.row -->
</div><!-- /#page-wrapper -->

<!-- footer-stat -->
	<jsp:include page="footer.jsp" />
<!-- footer-end -->

</div><!-- /#wrapper -->

<jsp:include page="commonFiles.jsp" />

<script type="text/javascript">
$(document).ready(function() {
	var form = $("#form-update-pooja");
	form.validate({
		rules: { date: { required: true } },
		errorElement: "div" ,
		errorClass:"text-danger",
		messages: { date: { required: "Select the Date" } }
	});

	var dateTag = $("#date");
	$("#form-update-pooja button").click(function() {
		if(form.valid()) {
			var date = $.trim(dateTag.val());
			$.ajax({
				type: "POST",
				data: "date="+date,
				url: "checkPoojas2Update.do",
				dataType: "json",
				dataFilter: function(data) { return data; },
				success: function(data) {
					var tag = $("#poojaTable").find("tbody");
					if(data.length > 0) {
						tag.html("");
						var type, code, index = 0;
						$.map(data, function(item) {
							type = (item.type.toLowerCase() == "weekly")? "("+item.day+")" : "";
							code = '<tr><td>'+(++index)+'</td>'
								+'		<td>'+item.name+'</td>'
								+'		<td>'+item.type+type+'</td>'
								+'		<td>Rs&nbsp;'+parseFloat(item.price).toFixed(2)+'</td>'
								+'		<td>'+item.date+'</td>'
								+'		<td>'+item.start+' - '+item.end+'</td>'
								+'		<td><a class="text-info" href="viewPooja.do?id='+item.id+'" target="_tab">View Details</a></td>'
								+'	</tr>';
							tag.append(code);
						});
					} else {
						tag.html('<td colspan="8"><span class="text-info">Sorry, No Pooja&#39;s Available on the given date.</td>');
					}
				},
				error: function(XMLHttpRequest, textStatus, errorThrown) {
					$("#poojaTable").find("tbody").html('<td colspan="8"><span class="text-info">Sorry, No Pooja&#39;s Available on the given date.</td>');
				}
			});
		}
	});

	dateTag.datepicker({
		dateFormat: 'dd-mm-yy',
		changeMonth: true,
		changeYear:  true,
		yearRange: '2000:+1'
	});
});
</script>
</body>
</html>