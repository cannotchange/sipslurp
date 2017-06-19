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
	h5 { font-size: 15px; }
	.btn-lg { margin-bottom: 20px;font-size: 15px; }
	.form-group { margin-top: 10px;margin-bottom: 10px; }
	.table thead > tr > th {
		text-align: center;background-color: rgb(198,198,198);
	}
	.page_main {
		padding: 0 12px;
		border-radius: 8px;
		border: 1px solid #fff;
		background-color: rgb(220, 220, 255);
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
		<h3> Daily Pooja&#39;s </h3>
		<ol class="breadcrumb">
			<li class="active"><i class="fa fa-cog"></i> To View all the available for the Day.</li>
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
		<div class="page_main">
			<h5>Daily Pooja&#39;s [${today}]</h5>
		</div>
	</div></div><!-- /.row -->

	<div class="row">
	<div class="col-sm-12" style="margin: 0px auto;float: none;">
		<c:forEach var="item" items="${dailyPoojas}">
			<div class="col-sm-3">
				<button type="button" name="btn-daily" class="btn btn-primary btn-lg btn-block" value="${item.id}">
					<fmt:formatNumber var="price" value="${item.price}" minFractionDigits="2" maxFractionDigits="2" scope="page"/>
					<div><b>Name : </b>${item.name}</div>
					<div><b>Price : </b>Rs ${price}</div>
					<div><b>Timing : </b>${item.time}</div>
				</button>
			</div>
		</c:forEach>
	</div></div><!-- /.row -->

	<div class="row">
	<div class="col-sm-12" style="margin: 0px auto 20px auto;float: none;">
		<div class="page_main">
			<h5>Weekly Pooja&#39;s [${today} ${day}]</h5>
		</div>
	</div></div><!-- /.row -->

	<div class="row">
	<div class="col-sm-12" style="margin: 0px auto;float: none;">
		<c:forEach var="item" items="${weeklyPoojas}">
			<div class="col-sm-3">
				<button type="button" name="btn-weekly" class="btn btn-primary btn-lg btn-block" value="${item.id}">
					<fmt:formatNumber var="price" value="${item.price}" minFractionDigits="2" maxFractionDigits="2" scope="page"/>
					<div><b>Name : </b>${item.name}</div>
					<div><b>Price : </b>Rs ${price}</div>
					<div><b>Timing : </b>${item.time}</div>
				</button>
			</div>
		</c:forEach>
	</div></div><!-- /.row -->

	<div class="row">
	<div class="col-sm-11" style="margin: 0px auto;float: none;">
	</div></div><!-- /.row -->
</div><!-- /#page-wrapper -->

<!-- footer-stat -->
	<jsp:include page="footer.jsp" />
<!-- footer-end -->

</div><!-- /#wrapper -->

<form id="report-ticket" action="ticket.do" method="post" style="display: none;"></form>
<jsp:include page="commonFiles.jsp" />

<script type="text/javascript">
$(document).ready(function() {
	var tagRT = $("#report-ticket");
	$("button[name=btn-daily], button[name=btn-weekly]").click(function() {
		var id = $.trim(this.value);
		if(id != "") {
			tagRT.html('<input type="hidden" name="pooja" value="'+id+'">');
			tagRT.submit();
		}
	});
});
</script>
</body>
</html>