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
	.form-group { margin-top: 10px;margin-bottom: 10px; }
	.table thead > tr > th {
		text-align: center;background-color: rgb(198,198,198);
	}
</style>
</head>
<body>
<div id="wrapper">
<!-- Sidebar -->
	<jsp:include page="header.jsp" />
<div id="page-wrapper">
	<div class="row">
	<div class="col-sm-12">
		<h3> View the Bookings </h3>
		<ol class="breadcrumb">
			<li class="active"><i class="fa fa-cog"></i> To View &amp; Print the bookings of the particular date.</li>
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
	<div class="col-sm-12" style="margin: 0px auto 20px auto;float: none;">
		<div class="page_main" style="border-radius: 8px;border: 1px solid #fff;padding: 12px;background-color: rgb(220, 220, 255);">
		<form class="form-horizontal" id="form-check-booking" action="#" method="post">
			<div class="form-group">
			<div class="col-sm-6">
				<label for="name" class="col-sm-1 control-label">Date</label>
				<div class="col-sm-6"><input type="text" class="form-control" name="date" placeholder="Select the Date"></div>
				<div class="col-sm-4"><button type="button" class="btn btn-primary">Check Avalability</button></div>
			</div></div><!-- /.form-group -->
		</form>
		</div>
	</div></div><!-- /.row -->

	<div class="row">
	<div class="col-sm-11" style="margin: 0px auto;float: none;">
		<input type="hidden" id="poojaDate" value="" style="display: none;">
		<table class="table table-bordered table-condensed table-stripped text-center" id="bookingTable">
			<thead>
				<tr><th>S.No</th>
					<th>Pooja</th>
					<th>Person Name</th>
					<th>Charge</th>
					<th>Paid</th>
					<th>Due</th>
					<th>Date</th>
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

<div id="payDue" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&Chi;</button>
			<h4 class="modal-title" id="myModalLabel">To Pay the due amount for Pooja.</h4>
		</div>
		<div class="modal-body">
			<div id="passMessage" style="display: none;"></div>
			<form action="#" id="form-pay-due" method="post" target="target-fpd"><!-- action="payDue.do" -->
				<div class="form-group">
				<div class="col-sm-8" style="margin: 0px auto; float: none;">
					<label class="text-muted">Balance Amount :&nbsp;<span class="text-info"></span></label>
					<input type="text" id="id" name="id" value="" style="display: none;">
				</div></div>
				<div class="form-group">
				<div class="col-sm-8" style="margin: 0px auto; float: none;">
					<label for="due">Amount Paid</label>
					<input class="form-control" type="text" id="due" name="due">
					<div for="due" generated="true" class="text-danger">This field is required.</div>
				</div></div>
			</form>
		</div>
		<div class="modal-footer" style="margin-top: 0px;padding: 15px 20px;">
			<button type="button" class="btn btn-default btn-sm" data-dismiss="modal">Close</button>
			<button type="button" class="btn btn-primary btn-sm" id="btn-pay">Pay Due</button>
		</div>
	</div></div>
</div>

<a id="due_pay" href="#payDue" data-toggle="modal" style="display: none;">Pay Due</a>
<form id="report-form" action="report.do" method="post" style="display: none;"></form>
<jsp:include page="commonFiles.jsp" />

<script type="text/javascript">
var tagPD = $("#form-pay-due");
var tagRF = $("#report-form");
var dueAmount;
$(document).ready(function() {
	var form = $("#form-check-booking");
	form.validate({
		rules: { date: { required: true } },
		errorElement: "div" ,
		errorClass:"text-danger",
		messages: { date: { required: "Select the Date" } }
	});

	tagPD.validate({
		rules: {
			id: { required: true },
			due: { required: true, number : true }
		},
		errorElement: "div" ,
		errorClass:"text-danger"
	});

	var dateTag = $("#form-check-booking input");
	$("#form-check-booking button").click(function() {
		if(form.valid()) {
			var date = $.trim(dateTag.val());
			$.ajax({
				type: "POST",
				data: "date="+date,
				url: "viewBookingsOn.do",
				dataType: "json",
				dataFilter: function(data) { return data; },
				success: function(data) {
					var tag = $("#bookingTable").find("tbody");
					if(data.length > 0) {
						$("#poojaDate").val(date);
						var code, diff, index = 0;
					//	var payCode = '<a class="due_pay" href="#payDue" data-toggle="modal">Pay Due</a>';
						var payCode = '<a class="text-info due_pay" href="#">Pay Due</a>';
						var printCode = '<a class="text-info" href="#">Print</a>';
						tag.html("");
						$.map(data, function(item) {
							diff = parseFloat((item.actual - item.paid)).toFixed(2);
							code = '<tr><td>'+(++index)+'</td>'
								+'		<td>'+item.name+'</td>'
								+'		<td>'+item.person+'</td>'
								+'		<td>Rs&nbsp;'+parseFloat(item.actual).toFixed(2)+'</td>'
								+'		<td>Rs&nbsp;'+parseFloat(item.paid).toFixed(2)+'</td>'
								+'		<td>'+((diff > 0)? "Rs "+diff : "0")+'</td>'
								+'		<td>'+item.date+'</td>'
								+'		<td>'+item.start+' - '+item.end+'</td>'
								+'		<td id="'+item.id+'" class="'+((diff <= 0)? 0 : diff)+'">'+((diff <= 0)? printCode : payCode)+'</td>'
								+'	</tr>';
							tag.append(code);
						});
					} else {
						$("#poojaDate").val("");
						tag.html('<td colspan="8"><span class="text-info">Sorry, No Pooja&#39;s Available.</td>');
					}
				},
				error: function(XMLHttpRequest, textStatus, errorThrown) {
					$("#poojaTable").find("tbody").html('<td colspan="8"><span class="text-info">Sorry, No Pooja&#39;s Available.</td>');
				}
			});
		}
	});

	dateTag.datepicker({
		dateFormat: 'dd-mm-yy',
		changeMonth: true,
		changeYear:  true,
		yearRange: '0y:+5',
		minDate: '0d'
	});

	var dueTag = $("#due");
	dueTag.keyup(function() {
		this.value = this.value.replace(/[^0-9\.]+/g, '');
	});
	dueTag.blur(function() {
		this.value = this.value.replace(/[^0-9\.]+/g, '');
		if(this.value != "") {
			this.value = parseFloat(this.value).toFixed(2);
		}
	});

	$("#btn-pay").click(function() {
		if(tagPD.valid()) {
			var id = $.trim(tagPD.find("#id").val());
			var due = $.trim(tagPD.find("#due").val());
			if((id != "") && (due != "")) {
				due = parseFloat(due).toFixed(2);
				$.ajax({
					type: "POST",
					data: "id="+id+"&due="+due,
					url: "payDueAmount.do",
					success: function(data) {
						if(data.name == "success") {
							$("#payDue").find(".close").click();
							var amounPaid = parseFloat(data.paid).toFixed(2);
							var balance = parseFloat(data.actual - data.paid).toFixed(2);

							var tag= $("td[id="+id+"]").parent();
							tag.find(':nth-child(5)').html("Rs&nbsp"+amounPaid);
							if(balance > 0) {
								tag.find(':nth-child(6)').html("Rs&nbsp"+balance);
								tag.find(':nth-child(9)').attr("class", balance);
							} else {
								tag.find(':nth-child(6)').html(0);
								tag.find(':nth-child(9)').removeAttr("class");
								tag.find(':nth-child(9)').html('<a class="text-info" href="#">Print</a>');
							}
						}
					}
				});
			}
		}
	});
});
$("#bookingTable tbody").on("click", "a[class=text-info]", function() {
	var id = $.trim($(this).parent().attr("id"));
	if(id != "") {
		tagRF.html('<input type="hidden" name="id" value="'+id+'">');
		tagRF.submit();
	}
});
$("#bookingTable tbody").on("click", ".due_pay", function() {
	$("#due_pay").trigger("click");

	var tag = $(this).parent();
	dueAmount = $.trim(tag.attr("class"));
	dueAmount = parseFloat(dueAmount).toFixed(2);
	tagPD.find("span[class=text-info]").html("Rs&nbsp;"+dueAmount);
	tagPD.find("#id").val($.trim(tag.attr("id")));
	tagPD.find("#due").val("");
	tagPD.find(".text-danger").html("");
});
</script>
</body>
</html>