var list = [];
/*
$("#searchIt").keyup(function(){
    console.log($("#searchIt").val());
})*/
$("#searchIt").keyup(function(e){
	console.log(e.keyCode);
	if(document.getElementById("searchIt").value == ""){
		document.getElementById("searchIt").focus();
		document.getElementById("searchNm").value = "";
		document.getElementById("searchNm").disabled = false;}
    if(parseInt(e.keyCode) == 13){//} || parseInt(e.keyCode) == 9){
    	if(document.getElementById("searchIt").value == ""){
    		document.getElementById("searchIt").focus();
    		document.getElementById("searchNm").value = "";
			document.getElementById("searchNm").disabled = false;
    	}else{
    		var vals = $("#searchIt").val();
    		var data={value:vals};
    		$.ajax({
    			url:'admin/getItemNameByitemCode.htm',
    			data:data,
    			dataType:'json',
    			type:"POST",
    			success:function(result){
    				console.log(result);
    				if(result.result){
    					$('#quantity').focus();
    		    		$('#quantity').select();
    					document.getElementById("searchNm").value = result.itemName;
    					document.getElementById("price").value = result.itemPrice;
    					document.getElementById("searchNm").disabled = true; 
    				}else{
    					document.getElementById("searchNm").value = "";
    					document.getElementById("searchNm").disabled = false;
    					document.getElementById("searchIt").focus();
    					document.getElementById("searchIt").select();
    					$("#ermsg").fadeIn(100);
    					$("#ermsg").fadeOut(300);
    				}
    			},
    		})
    	}
}
});

$("#quantity").keyup(function(e){
	/*console.log($("#searchIt").val());
	console.log($("#searchNm").val());
	console.log($("#quantity").val());*/
    if(parseInt(e.keyCode) == 13){//} || parseInt(e.keyCode) == 9){
    	if(document.getElementById("quantity").value==null || document.getElementById("quantity").value == 0){
    		document.getElementById("quantity").focus();
    		document.getElementById("quantity").value = 1;
    	}else{
    		document.getElementById("searchIt").focus();
    		var table1 = document.getElementById("billTable");
    		
    		/*var row = table1.insertRow();
    	    var cell1 = row.insertCell(0);
    	    var cell2 = row.insertCell(1)
    	    var cell3 = row.insertCell(2)
    	    var cell4 = row.insertCell(3);
    	    var cell5 = row.insertCell(4);
    	    cell1.innerHTML='  #';
    	    cell2.innerHTML="    "+$("#searchIt").val();
    	    cell3.innerHTML="    "+$("#searchNm").val();
    	    cell4.innerHTML="    "+$("#quantity").val();*/
    	    var xyz ={itemCode:$("#searchIt").val(),itemQuantity: $("#quantity").val()};
    	    list.push(xyz);
    	    console.log(list);
    	    var price = parseInt($("#quantity").val())*($('#price').val());
    	    var newprice = $("#totprice").val(); 
    	    if(newprice==undefined || newprice == ""){
    	    	newprice=0;
    	    }
    	    console.log(newprice);
    	   // cell5.innerHTML=parseInt($("#quantity").val())*($('#price').val());
    	    var markup="<tr id='"+$("#searchIt").val()+"'><td>#</td><td class='itemcode'>"+$("#searchIt").val()+"</td><td class='itemname'>"+$("#searchNm").val()+"</td><td class='itemquantity'>"+$("#quantity").val()+"</td><td class='itemprice'>"+parseInt($("#quantity").val())*($('#price').val())+"</td></tr>";
    		$("table thead").append(markup);
    	    document.getElementById("totprice").value = parseInt(newprice)+parseInt(price);
    	    /*$('#totprice').html(parseInt($('#totprice').innerText)+parseInt($("#quantity").val())*($('#price').val()));*/
    	    document.getElementById("searchIt").value="";
    	    document.getElementById("quantity").value = 1;
    	    document.getElementById("searchNm").value = "";
    	    document.getElementById("price").value = "";
    		document.getElementById("searchNm").disabled = false;
    		document.getElementById("searchIt").disabled = false;
    		$('#selItms').html("");
			document.getElementById('selItms').style.display="none";
			$("#searchIt").focus();
			$("#searchIt").select();
    	}
	}
});

function myKeyUp(e){
	console.log(e);
	console.log(e.length);
	if(e=="" || e.length<1){
		$('#selItms').html("");
		document.getElementById('selItms').style.display="none";
	}else{
		var name = $("#searchNm").val();
		var data = {value:name};
		$('#selItms').html("")
		$.ajax({
			url:'admin/getItemNameFromSearch.htm',
			data:data,
			dataType:'json',
			type:"POST",
			success:function(result){
				if(result.length>0){
					document.getElementById('selItms').style.display="block";
					var str='';
					$.each(result,function(index,obj){
						str+='<option value="'+obj.itemId+'">'+obj.itemName+'</option>';	
					});
					$('#selItms').append(str);
					//$('#selItms').focus();
				}else{
					$("#ermsg1").fadeIn(100);
					$("#ermsg1").fadeOut(300);
					$('#selItms').html("");
					document.getElementById('selItms').style.display="none";
				}
				
			},
		});
	}
	
}

$("#selItms").keyup(function(e){
	console.log(e.keyCode);
	if(parseInt(e.keyCode) == 13 ){//|| parseInt(e.keyCode) == 9
		/*console.log($("#selItms option:selected").html());
		document.getElementById("searchNm").value=$("#selItms option:selected").html();
		document.getElementById('selItms').style.display="none";
		$('#quantity').focus();
		$('#quantity').select();*/
		document.getElementById("searchNm").value=$("#selItms option:selected").html();
		document.getElementById("searchIt").value=$("#selItms").val();
		var code = $("#selItms").val();
		console.log("code= "+code);
		$.ajax({
			url:'admin/getItemPriceById.htm',
			data:"itemId="+$("#selItms").val(),
			dataType:'json',
			type:"POST",
			success:function(result){
				console.log(result);
				document.getElementById("price").value = result.itemPrice;
			},
		});
		document.getElementById("searchIt").disabled = true;
		document.getElementById("searchNm").disabled = true;
		$('#quantity').value="1";
		$('#quantity').focus();
		$('#quantity').select();
	}
});
$("#discount").keyup(function(e){
	console.log(e.keyCode);
	if(parseInt(e.keyCode) == 13 ){//|| parseInt(e.keyCode) == 9
		var dis = 100 - parseInt($('#discount').val());
		var amount = $('#totprice').val();
		var discountedPrice = parseInt(amount)*(dis/100) ;
		console.log("dis="+discountedPrice);
	}
});
$('#selItms').on('change', function() {
	var code = $("#selItms").val();
	//console.log("code= "+code);
	$.ajax({
		url:'admin/getItemPriceById.htm',
		data:"itemId="+$("#selItms").val(),
		dataType:'json',
		type:"POST",
		success:function(result){
			console.log(result);
			document.getElementById("price").value = result.itemPrice;
		},
	});
})

function test(){
	document.getElementById("searchNm").value=$("#selItms option:selected").html();
	document.getElementById("searchIt").value=$("#selItms").val();
	document.getElementById("searchIt").disabled = true;
	document.getElementById("searchNm").disabled = true;
	$('#quantity').focus();
	$('#quantity').select();
}
toastr.options = {
		  "closeButton": false,
		  "debug": false,
		  "newestOnTop": false,
		  "progressBar": false,
		  "positionClass": "toast-top-center",
		  "preventDuplicates": false,
		  "onclick": null,
		  "showDuration": "300",
		  "hideDuration": "5000",
		  "timeOut": "5000",
		  "extendedTimeOut": "1000",
		  "showEasing": "swing",
		  "hideEasing": "linear",
		  "showMethod": "fadeIn",
		  "hideMethod": "fadeOut"
		}
function tes(){
	console.log(list);
	var datas={list:list};
	$.ajax({
		url:'admin/getItemsToPrint.htm',
		data:JSON.stringify(datas),
		dataType:'json',
		contentType: "application/json; charset=utf-8",
		type:"POST",
		success:function(result){
			console.log(result);
			
		},
	});
}
function increaseQuantity(){
	var qty = document.getElementById('quantity').value;
	var no = parseInt(qty)+1;
	document.getElementById("quantity").value=no;
}

function decreaseQuantity(){
	var qty = document.getElementById('quantity').value;
	if(parseInt(qty)>1){
		var no = parseInt(qty)-1;
		document.getElementById("quantity").value=no;
	}else{
		toastr.error("Quantity Cannot be Negative");
	}
}