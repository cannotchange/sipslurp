<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="">

	<title>Holy Place .in</title>

	<link type="text/css" rel="stylesheet" href="css/bootstrap.css" >
	<link type="text/css" rel="stylesheet" href="css/sb-admin.css"  >
	<link type="text/css" rel="stylesheet" href="css/pepper-grinder/jquery-ui-1.10.3.custom.min.css" >
	<link type="text/css" rel="stylesheet" href="font-awesome/css/font-awesome.min.css">
	<link type="text/css" rel="stylesheet" href="css/daterangepicker-bs3.css" >
	 <link rel="stylesheet" type="text/css" href="css/styles.css" />
	
	 <link rel="stylesheet" type="text/css" href="styles.css" />
    <style type="text/css" media="screen">
      .map_canvas { float: right; 
                    position: absolute;
                    }
         form { width: 420px; float: left; }
      fieldset { width: 320px; margin-top: 20px}
      fieldset label { display: block; margin: 0.5em 0 0em; }
      fieldset input { width: 95%; } */
    </style>
</head>
<body>
<div id="wrapper">
<!-- Sidebar -->
<jsp:include page="headerTempManger.jsp" />
<div id="page-wrapper">
	<div class="row">
	<div class="col-sm-12" style="text-align: center;">
		<h1 >Event Page</h1>
		<ol class="breadcrumb">
			<li class="active"><i class="fa fa-cog"></i> To Add the New Events</li>
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
	<div class="col-sm-6" style="margin: 0px auto;float: none;">
		<!-- <div class="page_main" style="border-radius: 8px;border: 1px solid #fff;padding: 12px;background-color: rgb(220, 220, 255);"> -->
		<form class="form-horizontal" id="form-add-events" action="addevent.do" method="post" ><!-- enctype="multipart/form-data" -->
			<div class="form-group">
				<label for="name" class="col-sm-3 control-label">Event Name</label>
				<div class="col-sm-8"><input type="text" class="form-control" name="eventName" placeholder="Enter the Eventname"></div>
			</div>
			 	<div class="form-group">
				<label for="result" class="col-sm-3 control-label">Booking Date &Timings</label>
				<div class="col-sm-8"><input type="text" class="form-control" id="timings" placeholder="Select Date & Time from here."></div>
			</div>
			<div class="form-group">
				<label for="result" class="col-sm-3 control-label">Date</label>
				<div class="col-sm-8">
					<div class="col-sm-6"><input type="text" class="form-control" id="date" name="date" placeholder="strt_Date"></div>
					<div class="col-sm-6"><input type="text" class="form-control" id="date2" name="date2" placeholder="end_Date"></div>
				</div>
			</div>
			<div class="form-group">
				<label for="result" class="col-sm-3 control-label">Time</label>
				<div class="col-sm-8">
					<div class="col-sm-6 kpl"><input type="text" class="form-control" id="start" name="start" placeholder="Start"></div>
					<div class="col-sm-6 kpr"><input type="text" class="form-control" id="end" name="end" placeholder="End"></div>
				</div>
			</div>
			
			<div class="form-group">
							<label for="religious" class="col-sm-3 control-label">Religion</label> 
						    <div class="col-sm-8"><select name="religion" class="form-control" >
						        <option>Select</option>
								<option value="1">Hindu</option>
								<option value="2">Christian</option>
								<option value="3"> Sikh</option>
								<option value="4">Jain</option>
								<option value="5">Muslim</option>
								<option value="6">Others</option>
							</select></div>
						</div>
			
					<div class="form-group">
						<label for="address" class="col-sm-3 control-label">Address</label>
							<div class="col-sm-8"> <input id="geocomplete" class="form-control" type="text" placeholder="Type in an address" value="" />
							
						</div>
						</div>
						
						
			<div class="form-group">
				<label for="operation" class="col-sm-3 control-label">Number of Seats available</label>
				<div class="col-sm-8"><input type="number" class="form-control" id="seats" name="seats" placeholder="Number od f seats" onkeypress="return isNumberKey(event)"></div>
			</div>
			
			<div class="form-group">
				<label for="operation" class="col-sm-3 control-label">Price for the Event</label>
				<div class="col-sm-8"><input type="number" class="form-control" id="price" name="price" placeholder="Enter the Price for the Event" onkeypress="return isNumberKey(event)"></div>
			</div>
			
			
		<!-- 	<div class="form-group">
				<label for="operation" class="col-sm-3 control-label">Add images</label>
				<div class="col-sm-8">  <input type="file" class="form-control" name="file" ></div>
				
			</div>  -->
			
			
			
						<input name="lat" type="hidden" value="">
						<input name="lng" type="hidden" value="">
						<input name="formatted_address" type="hidden" value="">
						<input name="postal_code" type="hidden" value="">
						<input name="country" type="hidden" value="">
						<input name="administrative_area_level_1" type="hidden" value="">
						<input name="country" type="hidden" value="">
						    
						    
			
			
			<div class="form-group">
				<div class="col-sm-offset-3 col-sm-8">
					<button type="submit" class="btn btn-primary btn-sm">Create Event</button>
					<button type="reset" class="btn btn-info btn-sm">Reset</button>
				</div>
			</div>
		</form>
		
		<div class="form-group">
				<div class="map_canvas"></div>
			</div>
		</div>
	</div></div><!-- /.row -->
</div><!-- /#page-wrapper -->

<!-- footer-stat -->
	<jsp:include page="footerTempManager.jsp" />
<!-- footer-end -->

<jsp:include page="commonFiles.jsp" />
<script src="js/jquery-1.10.2.js"></script>
 <!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script> -->
<script src="js/jquery-ui-1.10.3.custom.js"></script>
<script src="js/jquery.validate.min.js"></script>
<script src="js/bootstrap/bootstrap.js"></script>
<script src="js/moment.js"></script>
<script src="js/daterangepicker.js"></script>
<script src="js/password.js"></script>


<script type="text/javascript">

$(document).ready(function() {
	
	/* function isNumberKey(evt){
	    var charCode = (evt.which) ? evt.which : event.keyCode
	    if (charCode > 31 && (charCode < 48 || charCode > 57)){
	        return false;
	    }else{
	    	return true;
	    	 }     
	 } */
	 
	 
		var price = $("#seats");
		price.keyup(function() {
			this.value = this.value.replace(/[^0-9\.]+/g, '');
		});
		price.blur(function() {
			this.value = parseFloat(this.value).toFixed(2);
		});
		
		var price = $("#price");
		price.keyup(function() {
			this.value = this.value.replace(/[^0-9\.]+/g, '');
		});
		price.blur(function() {
			this.value = parseFloat(this.value).toFixed(2);
		});
		
		
		
$("#form-add-events").validate({
		rules: {
			eventName: { required: true },
			timings: { required: true },  
			religion: { required: true },
			address: { required: true },
		
		},
		errorElement: "div",
		errorClass: "text-danger",
		
		messages: {
	
			eventName: { required: "Enter the EventName " }, 
			religion: { required: "Enter the contact number" },
			timings: { required: "Please select date and time" },
			 address: { required: "Enter the address" },
			
		} 


});

	$("#form-add-events button[type=reset]").click(function() {
		var tag = $(this).parent().parent().parent();
		tag.find("div[class=text-danger]").hide();
	});

var date = new Date();
var dated = date.getDate()+"-"+(date.getMonth()+1)+"-"+date.getFullYear();
var timings = $("#timings");
timings.daterangepicker({
	format: 'DD-MM-YYYY hh:mm A',
	startDate: dated,
	minDate: '1d',
	timePicker: true,
	timePicker12Hour: true,
	timePickerIncrement: 1
});

var date2=new Date();
var dated2 = date2.getDate()+"-"+(date2.getMonth()+1)+"-"+date2.getFullYear();
var timings = $("#timings");
timings.daterangepicker({
	format: 'DD-MM-YYYY hh:mm A',
	endDate: dated2,
	minDate: '1d',
	timePicker: true,
	timePicker12Hour: true,
	timePickerIncrement: 1


});
timings.on("apply.daterangepicker", function(av, picker) {
	$("#date").val(picker.startDate.format('DD-MM-YYYY'));
	$("#date2").val(picker.endDate.format('DD-MM-YYYY'));
	$("#start").val(picker.startDate.format('hh:mm A'));
	$("#end").val(picker.endDate.format('hh:mm A'));
});
});



</script>
    <script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyAsxVN8whU6Trwzsb11nQ_pT1My0BhxmVo&sensor=false&amp;libraries=places"></script>
   

    <script src="js/jquery.geocomplete.js"></script>

    <script>
      $(function(){
        $("#geocomplete").geocomplete({
          map: ".map_canvas",
          details: "form",
          types: ["geocode", "establishment"],
        });

        $("#find").click(function(){
          $("#geocomplete").trigger("geocode");
        });
      });
    </script>


<!--  <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBEmH8foTzjnDXxLLYmwKOwqm10QEG05o8&callback=initMap"></script> 
<script> 
    jQuery(document).ready(function () {
        var map;
        </script> -->
</body>
</html>