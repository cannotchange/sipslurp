<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
	<!-- 	<h3> Temple Managers, how have got registered to the website</h3> -->  
      <ol class="breadcrumb">
			<li class="active"><i class="fa fa-cog"></i> Temple Managers, who got registered to the website</li>
		</ol>
       <div class="row">
	<div class="col-sm-11" style="margin: 0px auto;float: none;">
		<input type="hidden" id="poojaDate" value="" style="display: none;">
		<table class="table table-bordered table-condensed table-stripped text-center" id="bookingTable">
			<thead>
       <tr>
           <th>ID</th>
           <th>Temple Name</th>
           <th>Contact Person</th>
           <th>Email-ID</th>
           <th>Contact Number</th>
           <th>Religious</th>
           <th>Address</th>
           <th>Status</th>
           <th>Approve</th>
       </tr>
       
			</thead>
			<tbody>
			
			<c:forEach var="item" items="${temple_reg}">
			<tr><td>${item.reg_id }</td>
			    <td>${item.temple_name }</td>
			    <td>${item.contact_person }</td>
			    <td>${item.email }</td>
			    <td>${item.cont }</td>
			    <td>${item.religious }</td>
			    <td>${item.address }</td>
			    <td id="${item.reg_id}">${item.status }</td>
			    <td><button onclick="myFunction(this,${item.reg_id})" value="${item.toApprove }">${item.toApprove }</button></td>
		 
		    </tr>
		</c:forEach>
		
		</tbody>
		
		</table>
		
	</div>


</div><!-- /#wrapper -->

<jsp:include page="commonFiles.jsp" />

	</div>
	</div>	
	
<script type="text/javascript" >



function myFunction(tag,id){

console.log(id);
//e.innerHTML='reject';
//var RegisteredData = $form.serialize();
	//$("input[type=reg_id]").change(function() {
	    $.ajax({
	        url: "checkregistered.do",
	        type: "post",
	        data: "id="+id
	        }).done(function(result) {
	        alert('Updated!');
	        var status=document.getElementById(id);
	        console.log(status.innerHTML);
	        console.log("tag="+tag.innerHTML);
	        
	        if(status.innerHTML == "Active"){
	        	 status.innerHTML ="Inactive";
	        	}
	        else{
	        	 status.innerHTML ="Active";
	        }
	        
	        if(tag == "Inactive"){
	        	tag.innerHTML = "Active";
	        }
	        else{
	        	tag.innerHTML = "Inactive";
	        	}
	        
	        
	    });
	//});	
	 
}
            
 
</script>

	

</body>
</html>