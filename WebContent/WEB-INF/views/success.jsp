<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose>
<c:when test="${action == 'bookPooja'}">
	<script type="text/javascript">
		var inner, result = "${result}";
		if(result == "success") {
			inner = '<div class="alert alert-success alert-dismissable" style="margin: 0px auto 20px auto;float: none;">'
				+		'<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>'
				+		'&nbsp;You has booked your pooja Successfully.'
				+	'</div>';
		} else {
			inner = '<div class="alert alert-danger alert-dismissable" style="margin: 0px auto 20px auto;float: none;">'
				+		'<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>'
				+		'&nbsp;Sorry, error occured during booking. Try againg later.'
				+	'</div>';
		}
		parent.$("#page-header").append(inner);
		parent.$("#form-book-pooja").trigger("reset");
	</script>
</c:when>
<c:when test="${action == 'updatePoojas'}">
	<script type="text/javascript">
		var result = '${result}'.toLowerCase();
		var inner = '<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>';
		if(result == "success") {
			inner = '<div class="alert alert-success alert-dismissable" style="margin: 0px auto 20px auto;float: none;">'
				+		'&nbsp;Congrats, the details of Pooja has been updated Successfully.'+inner
				+	'</div>';
		} else {
			inner = '<div class="alert alert-danger alert-dismissable" style="margin: 0px auto 20px auto;float: none;">'
				+		'&nbsp;Error occured while updating the details of Pooja, Try again later.'+inner
				+	'</div>';
		}
		parent.$("#page-header").append(inner);
		parent.$("#form-book-pooja").trigger("reset");
	</script>
</c:when>



</c:choose>