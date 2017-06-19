  function event_booking()
 {
	  console.log("hello");
	  var data={ eventName:$("#b_name").val(),seats:$("#b_seats").val(),price:$("#b_price").val(),total_price:$("#b_total").val(),email:$("#b_email").val(),eventId:$("#eveid").val(),personId:$("#devid")};
 	$.ajax({
 		
 		type: "POST",
 		url: "save_booking.do",
 		data: data,
 		success:function(result){
 			alert("stored");
 			console.log(result);
 			
 		
 		}
 	});
 }
  
  function test(){
	  alert("hi");
  }