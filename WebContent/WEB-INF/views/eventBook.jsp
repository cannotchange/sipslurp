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

	<title>HolyPlace.in</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
	<script src="js/booking.js"></script>
	<link type="text/css" rel="stylesheet" href="css/bootstrap.css" >
	<link type="text/css" rel="stylesheet" href="css/sb-admin.css"  >
	<link type="text/css" rel="stylesheet" href="css/pepper-grinder/jquery-ui-1.10.3.custom.min.css" >
	<link type="text/css" rel="stylesheet" href="font-awesome/css/font-awesome.min.css">
	<style type="text/css">

	
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
  		<h1 class="page-header">${events.eventName }</h1>
   
  <div class="row">
	<div class="col-sm-4"><br>
	<img style="width: 200px;" src="${events.temple.image }">
	
		
		<table class="table-condensed">
			<tr><td class="text-muted text-right">Event Name :</td><td class="text-primary text-left" id="event_name">${events.eventName }</td></tr>
			<tr><td class="text-muted text-right">Event Address :</td><td class="text-primary text-left" id="event_address">${events.formatted_address }</td></tr>
			<tr><td class="text-muted text-right">Religious :</td><td class="text-primary text-left" id="event_religious">${events.religion }</td></tr>	
			<tr><td class="text-muted text-right">Temple Name:</td><td class="text-primary text-left" id="temple_name">${events.temple.temple_name }</td></tr>
			<tr><td class="text-muted text-right">Temple Address:</td><td class="text-primary text-left" id="temple_address">${events.temple.address }</td></tr>
			
		</table>
	</div>
	<div class="col-sm-8">
	
	<table class="table-condensed">
		<tr><td class="text-muted text-right">Event Price:</td><td class="text-primary text-left" id="event_price">${events.price }</td></tr>
		<tr><td class="text-muted text-right">Number of Seats:</td><td class="text-primary text-left" id="event_seats">${events.seats }</td></tr>
		<tr><td class="text-muted text-right">Start Date:</td><td class="text-primary text-left" id="start_date">${events.date }</td></tr>
		
		<tr><td class="text-muted text-right">End Date:</td><td class="text-primary text-left" id="end_date">${events.date2 }</td></tr>
		<tr><td class="text-muted text-right">Contact Person:</td><td class="text-primary text-left" id="contact_person">${events.temple.contact_person }</td></tr>
		<tr><td class="text-muted text-right">Email_ID:</td><td class="text-primary text-left" id="email">${events.temple.email }<</td></tr>
		<tr><td class="text-muted text-right">Contact Number:</td><td class="text-primary text-left" id="contact_number">${events.temple.cont }</td></tr>
		<tr><td class="text-muted text-right">Start Time</td><td class="text-primary text-left" id="start_time">${events.start }</td></tr>
		<tr><td class="text-muted text-right">End Time:</td><td class="text-primary text-left" id="end_time">${events.end }</td></tr>

	</table>
	
		<div class="modal-footer" style="margin-top: 119px; margin-right: 455px;">
		    <a href="#Booking" type="button" class="btn btn-default" data-toggle="modal">Book/Reserve</a>
			<a href="allevents.do"  class="btn btn-default" id="cp1">Close</a>
		</div>
		
	</div>

</div>

</div>


 <div class="modal fade" id="Booking" role="dialog">
    <div class="modal-dialog">

      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Booking</h4>
        	</div>
        	<div class="modal-body">
          Name: <input type="text" class="form-control" name="name" id="b_name" placeholder="Enter your fullname">
          Number of seats: <input type="text" class="form-control" name="seats"   onkeyup="total()"  id="b_seats" placeholder="Enter number of seats">
          price: <input type="text" class="form-control" name="price" id="b_price" onkeyup="total()" value="${events.price }" disabled>
          Total Price: <input type="text" class="form-control" name="total_price" id="b_total" onclick="total()" placeholder="Total price" readonly>
          Email-ID: <input type="text" class="form-control" name="email" id="b_email" placeholder="Email">
          Contact No: <input type="text" class="form-control" name="contact" id="b_contact" placeholder="Enter your contact">
          <input type="hidden" id="eveid" value=${events.eventId}>
          <input type="hidden" id="devid" value=${devId}>
        	</div>
        	<div class="modal-footer">
          		<a href="" type="button" class="btn btn-default" onclick="event_booking()">Book</a>
         	    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
<jsp:include page="commonFiles.jsp" />
</div>

</div>

 </div>
 
<script type="text/javascript" >

 function total() {
	      var txtFirstNumberValue = document.getElementById('b_seats').value;
	       var txtSecondNumberValue = document.getElementById('b_price').value;
	    
	 
	       var result = parseInt(txtFirstNumberValue) * parseInt(txtSecondNumberValue);
	        
	           document.getElementById('b_total').value = result;
	      
	   }
</script>



</body>
</html>