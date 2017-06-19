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
	.table thead > tr > th {
		text-align: center;background-color: rgb(198,198,198);
	}
	.table tbody > tr > td { vertical-align: middle; }
	.table tbody > tr > td > b{ text-decoration: underline; }
</style>
</head>
<body>
<div id="wrapper">
<!-- Sidebar -->
	<jsp:include page="header.jsp" />
<div id="page-wrapper">
	<div class="row">
	<div class="col-sm-12">
		<h3> Check Collection </h3>
		<ol class="breadcrumb">
			<li class="active"><i class="fa fa-cog"></i> To View &amp; Check the Collection between two dates.</li>
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
		<form class="form-horizontal" id="form-check-collection" action="#" method="post">
			<div class="form-group">
				<div class="col-sm-3 kpr">
					<label for="name" class="col-sm-2 control-label">From</label>
					<div class="col-sm-10 kpr">
						<input type="text" class="form-control" id="from" name="from" placeholder="Select the Start-Date">
						<div for="from" generated="true" class="text-danger"></div>
					</div>
				</div>
				<div class="col-sm-3 kpr">
					<label for="name" class="col-sm-2 control-label">To</label>
					<div class="col-sm-10 kpr">
						<input type="text" class="form-control" id="to" name="to" placeholder="Select the End-Date">
						<div for="to" generated="true" class="text-danger"></div>
					</div>
				</div>
				<div class="col-sm-2"><button type="button" class="btn btn-primary">Check Collection</button></div>
			</div><!-- /.form-group -->
		</form>
		</div>
	</div></div><!-- /.row -->

	<div class="row">
	<div class="col-sm-11" style="margin: 0px auto;float: none;">
		<table class="table table-bordered table-condensed table-striped text-center" id="dataTable">
			<thead>
				<tr><th>S.No</th>
					<th>Date/Month/Year</th>
					<th>Pooja Name</th>
					<th>Timings</th>
					<th>Tickets Sold</th>
					<th>Collection&nbsp;(in Rs)</th>
					<th>Total&nbsp;(in Rs)</th>
				</tr>
			</thead>
			<tbody></tbody>
			<tfoot style="display: none">
				<tr><td colspan="7"><button class="btn btn-primary btn-xs pull-right" id="printDetails">Print the Details</button></td></tr>
			</tfoot>
		</table>
	</div></div><!-- /.row -->
</div><!-- /#page-wrapper -->

<!-- footer-stat -->
	<jsp:include page="footer.jsp" />
<!-- footer-end -->

</div><!-- /#wrapper -->
<form action="collections.do" method="post" id="formCLS"></form>
<jsp:include page="commonFiles.jsp" />

<script type="text/javascript">
var tagPD = $("#form-pay-due");
var tagRF = $("#report-form");
var dueAmount;
$(document).ready(function() {
	var formCC = $("#form-check-collection");
	formCC.validate({
		rules: {
			to: { required: true },
			from: { required: true }
		},
		errorElement: "div" ,
		errorClass:"text-danger",
		messages: {
			to: { required: "Select the End-Date" },
			from: { required: "Select the Start-Date" }
		}
	});

	$("#from, #to").datepicker({
		dateFormat: 'dd-mm-yy',
		changeYear: true,
		changeMonth: true,
		yearRange: '2000:+0',
		maxDate: '0d'
	});

	var tt = $("#to");
	var ff = $("#from");
	var fromDate="", toDate="";
	$("#form-check-collection button").click(function() {
		if(formCC.valid()) {
			var endDate = $.trim(tt.val());
			var startDate = $.trim(ff.val());

			var dd = getNumber(startDate.substring(0, 2));
			var mm = getNumber(startDate.substring(3, 5))-1;
			var yy = getNumber(startDate.substring(6));
			var dateA = new Date(yy, mm, dd);

			dd = getNumber(endDate.substring(0, 2));
			mm = getNumber(endDate.substring(3, 5))-1;
			yy = getNumber(endDate.substring(6));
			var dateB = new Date(yy, mm, dd);

			if(getDateDiff(dateA, dateB) < 0) {
				tt.parent().find(".text-danger").show();
				ff.parent().find(".text-danger").show();
				tt.parent().find(".text-danger").html("Invalid End-Date");
				ff.parent().find(".text-danger").html("Invalid Start-Date");
			} else {
				var date1 = getFormatDate(dateA.toDateString().substring(4));
				var date2 = getFormatDate(dateB.toDateString().substring(4));
				fromDate = startDate;
				toDate = endDate;
				$.ajax({
					type: "POST",
					data: "from="+startDate+"&to="+endDate,
					url: "checkCollection.do",
					dataType: "json",
					dataFilter: function(data) { return data; },
					success: function(data) {
						var tag = $("#dataTable").find("tbody");
						if(data.length > 0) {
							tag.html("");
							var total = 0, inner, index = 0;
							$.map(data, function(item) {
								total = parseFloat(total)+parseFloat(item.price);
								inner = '<tr><td rowspan="'+item.data.length+'">'+(++index)+'</td>'
									+		'<td rowspan="'+item.data.length+'">'+item.date+'</td>'
									+		'<td class="text-left" style="padding-left: 15px">'+item.data[0].name+'</td>'
									+		'<td>'+item.data[0].start+' - '+item.data[0].end+'</td>'
									+		'<td>'+item.data[0].contact+'</td>'
									+		'<td>Rs '+parseFloat(item.data[0].actual).toFixed(2)+'</td>'
									+		'<td rowspan="'+item.data.length+'">Rs '+parseFloat(item.price).toFixed(2)+'</td>'
									+	'</tr>';
								tag.append(inner);
								for(var i=1; i<item.data.length;i++) {
									inner = '<tr><td class="text-left" style="padding-left: 15px">'+item.data[i].name+'</td>'
										+		'<td>'+item.data[i].start+' - '+item.data[i].end+'</td>'
										+		'<td>'+item.data[i].contact+'</td>'
										+		'<td>Rs '+parseFloat(item.data[i].actual).toFixed(2)+'</td>'
										+	'</tr>';
									tag.append(inner);
								}
							});
							inner = '<tr class="text-info">'
								+		'<td class="text-right" colspan="6" style="padding-right: 15px">'
								+			'Total Collection between&nbsp;&nbsp;<b>'+date1+'</b>&nbsp;&nbsp;to&nbsp;&nbsp;<b>'+date2+'</b>'
								+		'</td>'
								+		'<td>Rs '+parseFloat(total).toFixed(2)+'</td>'
								+	'</tr>';
							tag.append(inner);
							$("#dataTable").find("tfoot").show();
						} else {
							$("#poojaDate").val("");
							var code = 'Sorry, No Collection between&nbsp;&nbsp;<b>'+date1+'</b>&nbsp;&nbsp;to&nbsp;&nbsp;<b>'+date2+'</b>';
							$("#dataTable").find("tbody").html('<td colspan="7"><span class="text-danger">'+code+'</span></td>');
							$("#dataTable").find("tfoot").hide();
						}
					},
					error: function(XMLHttpRequest, textStatus, errorThrown) {
						var code = 'Sorry, No Collection between&nbsp;&nbsp;<b>'+date1+'</b>&nbsp;&nbsp;to&nbsp;&nbsp;<b>'+date2+'</b>';
						$("#dataTable").find("tbody").html('<td colspan="7"><span class="text-danger">'+code+'</span></td>');
						$("#dataTable").find("tfoot").hide();
					}
				});
			}
		}
	});

	$("#printDetails").click(function() {
		fromDate = $.trim(fromDate);
		toDate = $.trim(toDate);
		if((fromDate != "") && (toDate != "")) {
			var code = '<input type="hidden" name="from" value="'+fromDate+'"><input type="hidden" name="to" value="'+toDate+'">';
			$("#formCLS").html(code);
			$("#formCLS").submit();
		}
	});
});
function getFormatDate(date) {
	var arr = $.trim(date).split(" ");
	return arr[1]+"-"+arr[0]+"-"+arr[2];
}
function getNumber(code) {
	var str = (code.substring(0, 1) == "0")? code.substring(1) : code;
	return parseInt(str);
}
function getDateDiff(dateA, dateB) {
	var datediff = dateB.getTime() - dateA.getTime();
    return (datediff / (24 * 60 * 60 * 1000));
}
</script>
</body>




</html>