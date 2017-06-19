<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div id="wrapper">

	<jsp:include page="loginsuccess.jsp" />
<div id="page-wrapper">
	<div class="row">
	<div class="col-sm-12">
		<h1 style="background: none repeat scroll 0% 0% rgb(0, 153, 204);color:white;text-align:center;">Devotee </h1>
		<p></p>
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

<!-- 	<div class="row">
	<div class="col-sm-12">
		<div class="col-sm-4" style="margin:0px auto;float:none;">
			<img width="100%" src="images/GOPURAM.jpg" />
		</div>
	</div></div> --><!-- /.row -->
</div><!-- /#page-wrapper -->

<%-- <!-- footer-stat -->
	<jsp:include page="footer.jsp" />
<!-- footer-end --> --%>

</div><!-- /#wrapper -->

<jsp:include page="commonFiles.jsp" />

</body>
</body>
</html>