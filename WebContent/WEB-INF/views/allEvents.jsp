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
	
	 #wrapper {
	padding-left: 0px;
  }
</style>
</head>

<body>
<div id="wrapper">


<jsp:include page="loginsuccess.jsp" />

 
 <div id="page-wrapper">
	<div class="row">
	<div class="col-sm-12" style="margin-left: 229px; width: 1100px;">
     <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">All Events</h1>
                    
    <div class="row">
	<div class="col-sm-11" style="margin: 0px auto;float: none;">
		<input type="hidden" id="poojaDate" value="" style="display: none;">
      		<table class="table table-bordered table-condensed table-stripped text-center" id="bookingTable">
			<thead>
      <tr>
           <th>ID</th>
           <th>Image</th>
           <th>Event Name</th>
           <th>Temple Name</th>
           <th>Contact Person</th>
           <th>Date</th>
           <th>Time</th>
           <th>Price</th>
           <th>Venue</th>
           <th>contact Number</th>
           <th>Availability</th>
           <th>Status</th>
           
       </tr>
       
			</thead>
			<tbody>
			
		<c:forEach var="item" items="${events}">
			<tr><td>${item.eventId }</td>
			    <td><a href="eventbook.do?id=${item.eventId }"><img style="width: 70px;" src="${item.image }" onclick=""></a></td>
			     <td>${item.eventName }</td>
			    <td>${item.templeName }</td>
			    <td>${item.contactPerson}</td>
			    <td>From: ${item.date } To: ${item.date2}</td>
			    <td>From: ${item.start } To: ${item.end}</td>
			    <td>${item.price}</td>
			     <td><a href="#viewEvents" onclick="view_info('${item.eventId}');" data-toggle="modal">Venue</a></td>
			     <td>${item.contactNo}</td>
			    <td>no. of seats</td>
			    <td><a href="#Booking" type="button" class="btn btn-default" data-toggle="modal">Book/Reserve</a></td>
			   
		    </tr>
		</c:forEach> 
		
		
		
		</tbody>
		
		</table>
        </div>
    


 
  <!-- Modal -->
  <div class="modal fade" id="viewEvents" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content" style="width: 638px; height: 375px;">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Event Address</h4>
        </div>
        <div class="modal-body">
         
		<div id="map" style="width:100%;height:200px">
	
		<!-- Event Address : <textarea id="event_address"></textarea> -->
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div> 
  </div>
  
  
   <!-- Modal -->
  <div class="modal fade" id="Booking" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content" style="width: 490px; height: 496px;">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Booking</h4>
        </div>
         <div class="modal-body">
          Name: <input type="text" class="form-control" name="name" id="b_name" placeholder="Enter your fullname">
          Number of seats: <input type="text" class="form-control" name="seats" id="b_seats" placeholder="Enter number of seats">
          price: <input type="text" class="form-control" name="price" id="b_price" value="" disabled>
          Total Price: <input type="text" class="form-control" name="total_price" id="b_total" placeholder="Total price">
          Email-D: <input type="text" class="form-control" name="email" id="b_email" placeholder="Email">
          Contact No: <input type="text" class="form-control" name="contact" id="b_contact" placeholder="Enter your contact">
        </div>
        <div class="modal-footer">
          <a href="" type="button" class="btn btn-default">Book</a>
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
 
 
 
 
 
 </div><!-- /#wrapper -->

<jsp:include page="commonFiles.jsp" />

	</div>
	</div>	
	</div>
	</div>
	</div>
	</div>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAsxVN8whU6Trwzsb11nQ_pT1My0BhxmVo&callback=myMap"></script>	
<script type="text/javascript" >
                   
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
			$("#temple_name").html(result.temple.temple_name);
			$("#event_price").html(result.price);
			$("#event_seats").html(result.seats);
			$("#start_date").html(result.date);
			$("#end_date").html(result.date2);
			$("#contact_person").html(result.temple.contact_person);
			$("#email").html(result.temple.email);
			$("#contact_number").html(result.temple.cont);
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