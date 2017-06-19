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
			<li class="active"><i class="fa fa-cog"></i> Events Approval</li>
		</ol>
       <div class="row">
	<div class="col-sm-11" style="margin: 0px auto;float: none;">
		<input type="hidden" id="poojaDate" value="" style="display: none;">
		<table class="table table-bordered table-condensed table-stripped text-center" id="bookingTable">
			<thead>
       <tr>
           <th>ID</th>
           <th>Image</th>
           <th>Name</th>
           <th>Contact Person</th>
           <th>Event Name</th>
           <th>Event Address</th>
           <th>Date</th><!-- start & end date -->
           <th>Time</th><!-- start & end time -->
           <th>No of seats</th>
           <th>Event Price</th>
           <th>Contact Number</th>
           <th>View</th>
           <th>Status</th>
           <th>Approve</th>
       </tr>
       
			</thead>
			<tbody>
			
			
			<c:forEach var="item" items="${list}">
			<tr><td>${item.eventId }</td>
			    <td><a href="#viewTempleinfo" onclick="view_templeinfo('');" data-toggle="modal"><img style="width: 70px;" src="${item.image }"/></a></td>
			    <td>${item.templeName }</td>
			    <td>${item.contactPerson}</td>
			    <td>${item.eventName }</td>
			    <td>${item.formatted_address }</td>
			    <td>From: ${item.date } To: ${item.date2}</td>
			    <td>From: ${item.start } To: ${item.end}</td>
			    <td>${item.seats }</td>
			    <td>${item.price}</td>
			    <td>${item.contactNo}</td>
			    <td><a href="#viewproperty" onclick="view_info('${item.eventId}');" data-toggle="modal">View </a></td>
			    <td id="${item.eventId}">${item.status }</td>
			    <td><button onclick="myFunction(this,${item.eventId})" value="${item.approveStatus }">${item.approveStatus }</button></td>
		 
		    </tr>
		</c:forEach> 
		
		</tbody>
		
		</table>
		
	</div>




<div class="modal fade" id="viewproperty" tabindex="-1" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
<div class="modal-content"><div class="modal-header"><p class="text-muted" id="myProperty" style="margin-bottom: 0;"></p></div>
<div class="row">
	<div class="col-sm-4"><br>
	<div id="map" style="width:100%;height:200px"></div>
	
	
		<table class="table-condensed">
			<tr><td class="text-muted text-right">Event Name :</td><td class="text-primary text-left" id="event_name"></td></tr>
			<tr><td class="text-muted text-right">Event Address :</td><td class="text-primary text-left" id="event_address"></td></tr>
			<tr><td class="text-muted text-right">Religious :</td><td class="text-primary text-left" id="event_religious"></td></tr>	
			<tr><td class="text-muted text-right">Temple Name:</td><td class="text-primary text-left" id="temple_name"></td></tr>
			<tr><td class="text-muted text-right">Temple Address:</td><td class="text-primary text-left" id="temple_address"></td></tr>
			
		</table>
	</div>
	<div class="col-sm-8">
	
	<table class="table-condensed">
		<tr><td class="text-muted text-right">Event Price:</td><td class="text-primary text-left" id="event_price"></td></tr>
		<tr><td class="text-muted text-right">Number of Seats:</td><td class="text-primary text-left" id="event_seats"></td></tr>
		<tr><td class="text-muted text-right">Start Date:</td><td class="text-primary text-left" id="start_date"></td></tr>
		
		<tr><td class="text-muted text-right">End Date:</td><td class="text-primary text-left" id="end_date"></td></tr>
		<tr><td class="text-muted text-right">Contact Person:</td><td class="text-primary text-left" id="contact_person"></td></tr>
		<tr><td class="text-muted text-right">Email_ID:</td><td class="text-primary text-left" id="email"></td></tr>
		<tr><td class="text-muted text-right">Contact Number:</td><td class="text-primary text-left" id="contact_number"></td></tr>
		<tr><td class="text-muted text-right">Start Time - End Time:</td><td class="text-primary text-left" id="start_time"></td></tr>
		<tr><td class="text-muted text-right">End Time:</td><td class="text-primary text-left" id="end_time"></td></tr>
		
		
	</table>
	<div class="modal-footer" style="margin-top: 0;">
			<button type="button" class="btn btn-default" id="cp1" data-dismiss="modal">Close</button>
		</div>
	</div>
</div>

	
		
</div></div>


</div><!-- /#wrapper -->

<jsp:include page="commonFiles.jsp" />

	</div>
	</div>	
	</div>
	</div>

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAsxVN8whU6Trwzsb11nQ_pT1My0BhxmVo&callback=myMap"></script>	
<script type="text/javascript" >

 

function myFunction(tag,id){

console.log(id);
//e.innerHTML='reject';
//var RegisteredData = $form.serialize();
	//$("input[type=reg_id]").change(function() {
	    $.ajax({
	        url: "checkEventRegistered.do",
	        type: "post",
	        data: "id="+id
	        }).done(function(result) {
	        alert('Updated!');
	        console.log("status = "+result.status);
	        console.log("app status = "+result.approveStatus);
	        var status=document.getElementById(id);
	        status.innerHTML=result.status;
	        tag.innerHTML=result.approveStatus;
	       /*  if(status.innerHTML == "Active"){
	        	 status.innerHTML ="Inactive";
	        	}
	        else{
	        	 status.innerHTML ="Active";
	        }

	        if(tag,innerHTML == "Active"){
	        	tag.innerHTML = "Inactive";
	        }else{
	        	tag.innerHTML = "Active";
	        } */
	        
	    });
	//});	
	 
} 

function view_info(id)
{
	//$("#myproperty").html("Property details");
	console.log( "id" +id);
	
	$.ajax({
		type: "POST",
		url: "getViewEvents.do",
		data: "id=" +id,
		success:function(result){
			console.log(result);
			myMap(result.lat,result.lng);
			$("#event_name").html(result.eventName); 
			$("#event_address").html(result.formatted_address);
			$("#event_religious").html(result.religion);
			$("#temple_name").html(result.temple.temple_name);<!--templereg	-->
			$("#temple_address").html(result.temple.address);<!--templereg	-->
			$("#event_price").html(result.price);
			$("#event_seats").html(result.seats);
			$("#start_date").html(result.date);
			$("#end_date").html(result.date2);
			$("#contact_person").html(result.temple.contact_person);<!--templereg	-->
			$("#email").html(result.temple.email);
			$("#contact_number").html(result.temple.cont);<!--templereg	-->
			$("#start_time").html(result.start);
			$("#end_time").html(result.end); 
			
			
			
			},
		error: function(e) {console.log("fail");}
	});	
}
            
function myMap(lat,lon) {
	  var myCenter = new google.maps.LatLng(lat,lon);
	  var mapCanvas = document.getElementById("map");
	  var mapOptions = {center: myCenter, zoom: 14};
	  var map = new google.maps.Map(mapCanvas, mapOptions);
	  var marker = new google.maps.Marker({position:myCenter});
	  marker.setMap(map);
	}
</script>

	

</body>
</html>