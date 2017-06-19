var list = [];

$("#searchIt").keyup(function(e){
	console.log(e.keyCode);
	if(document.getElementById("searchIt").value == ""){
		document.getElementById("searchIt").focus();
		document.getElementById("searchNames").value = "";
		document.getElementById("searchNames").disabled = false;}
    if(parseInt(e.keyCode) == 13){//} || parseInt(e.keyCode) == 9){
    	if(document.getElementById("searchIt").value == ""){
    		document.getElementById("searchIt").focus();
    		document.getElementById("searchNames").value = "";
			document.getElementById("searchNames").disabled = false;
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
    					document.getElementById("searchNames").value = result.itemName;
    					document.getElementById("price").value = result.itemPrice;
    					document.getElementById("searchNames").disabled = true; 
    				}else{
    					document.getElementById("searchNames").value = "";
    					document.getElementById("searchNames").disabled = false;
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
$('#price').keyup(function(e){
	if(parseInt(e.keyCode)==13){
		document.getElementById("quantity").focus();
		document.getElementById("quantity").select();
	}
});
$("#quantity").keyup(function(e){
	
    if(parseInt(e.keyCode) == 13){//} || parseInt(e.keyCode) == 9){
    	if(document.getElementById("quantity").value==null || document.getElementById("quantity").value == 0){
    		document.getElementById("quantity").focus();
    		document.getElementById("quantity").value = 1;
    	}else{
    		document.getElementById("searchIt").focus();
    		var table1 = document.getElementById("billTable");
    		
    	    var price = parseInt($("#quantity").val())*($('#price').val());
    	    var newprice = $("#totprice").val(); 
    	    if(newprice==undefined || newprice == ""){
    	    	newprice=0;
    	    }
    	    var code = $("#searchIt").val();
    	    var itemDiv = document.getElementById(code);
    	    if(itemDiv==null || itemDiv==undefined){
    	    	 var markup="<tr><td>#</td><td class='itemcode'>"+$("#searchIt").val()+"</td><td class='itemname'>"+$("#searchNames").val()+"</td><td id='"+$("#searchIt").val()+"' class='itemquantity'>"+$("#quantity").val()+"</td><td id='p"+$("#searchIt").val()+"' class='itemprice'>"+parseInt($("#quantity").val())*($('#price').val())+"</td></tr>";
    	    		$("table thead").append(markup);
    	    		
    	    }else{
    	    	var actPrice = $('#price').val();
    	    	var prevPrice = document.getElementById('p'+code);
    	    	var prevQuantity = parseInt(itemDiv.innerText);
    	    	itemDiv.innerText = prevQuantity +parseInt($("#quantity").val());
    	    	prevPrice.innerText =  parseInt(prevPrice.innerText)+parseInt(actPrice) * +parseInt($("#quantity").val());
    	    }
    	   
    	    document.getElementById("totprice").value = parseInt(newprice)+parseInt(price);
    	    $('#billprice')[0].innerHTML = "";
    		$('#billprice')[0].innerHTML = parseInt(newprice)+parseInt(price);
    	    document.getElementById("searchIt").value="";
    	    document.getElementById("quantity").value = 1;
    	    document.getElementById("searchNames").value = "";
    	    document.getElementById("price").value = "";
    		document.getElementById("searchNames").disabled = false;
    		document.getElementById("searchIt").disabled = false;
    		//$('#selItms').html("");
			//document.getElementById('selItms').style.display="none";
    		var discountP = $('#discount').val();
     	    if(discountP!=undefined && parseInt(discountP)>0){
     	    	console.log("dis= "+discountP);
     	    	var dis = 100 - parseInt(discountP);
    			var amount = $('#totprice').val();
    			var discountedPrice = parseInt(amount)*parseInt(discountP)/100;
    			var finalPrice = parseInt(amount)*(dis/100) ;
    			var billdiv = $('#billprice');
    			document.getElementById('disccPrice').style.display="block";
    			$('#discprice')[0].innerHTML="";
    			$('#discprice')[0].innerHTML=discountedPrice;
    			$('#billprice')[0].innerHTML="";
    			$('#billprice')[0].innerHTML=finalPrice;
     	    }
			$("#searchIt").focus();
			$("#searchIt").select();
    	}
	}
});
//$("#searchNames").keyup(function(e){
//console.log(e);
//});

function searchByNameValue(name,id){
	console.log("clicked="+name);
	console.log("id="+id);
	$.ajax({
		url:'admin/getItemPriceById.htm',
		data:"itemId="+id,
		dataType:'json',
		type:"POST",
		success:function(result){
			setTimeout(function(){
				console.log(result);
				document.getElementById("price").value="";
				$('#quantity').value="";
				document.getElementById("searchIt").value = "";
				document.getElementById("price").value = result.itemPrice;
				document.getElementById("searchIt").value = result.itemId;
				/*document.getElementById("searchIt").disabled = true;
				document.getElementById("searchNames").disabled = true;*/
				$('#quantity').focus();
				$('#quantity').select();
			},200);
			
		},
	});
	
	
}

$("#searchNames").keyup(function(e){
	/*var $listItems = $('li');
	$selected = $listItems.filter('.selected');
	$current='';
	console.log(e);
	console.log(e.keyCode);
	$('#searchNamesres').html("");
	
	
	if(e=="" || $("#searchNames").val().length<1){
		//$('#selItms').html("");
		document.getElementById('selItms').style.display="none";
	}else{
		var name = $("#searchNames").val();
		var data = {value:name};
		//$('#selItms').html("")
		$.ajax({
			url:'admin/getItemNameFromSearch.htm',
			data:data,
			dataType:'json',
			type:"POST",
			success:function(result){
				if(result.length>0){
					//document.getElementById('selItms').style.display="block";
					var str1='';
					var str='';
					$('#searchNamesres').html("");
					$.each(result,function(index,obj){
						
						str+='<option value="'+obj.itemId+'">'+obj.itemName+'</option>';
						str1+='<li id="'+obj.itemId+'">'+obj.itemName+'</li>';
					});
					//$('#selItms').append(str);
					$('#searchNamesres').append(str1);
					//$('#selItms').focus();
				}else{
					$("#ermsg1").fadeIn(100);
					$("#ermsg1").fadeOut(300);
					//$('#selItms').html("");
					//document.getElementById('selItms').style.display="none";
				}
				
			},
		});
	}
	*/
});

/*$("#selItms").keyup(function(e){
	console.log(e.keyCode);
	if(parseInt(e.keyCode) == 13 ){//|| parseInt(e.keyCode) == 9
		document.getElementById("searchNames").value=$("#selItms option:selected").html();
		document.getElementById("searchIt").value=$("#selItms").val();
		var code = $("#selItms").val();
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
		document.getElementById("searchNames").disabled = true;
		$('#quantity').value="1";
		$('#quantity').focus();
		$('#quantity').select();
	}
});*/
$("#discount").keyup(function(e){
	if(parseInt(e.keyCode) == 13 ){
		if($('#totprice').val()=="" || $('#totprice').val()==undefined){
			document.getElementById('disccPrice').style.display="none";
			$("#discount").select();
			$("#discount").focus();
		}else{
			//|| parseInt(e.keyCode) == 9
			var dis = 100 - parseInt($('#discount').val());
			var amount = $('#totprice').val();
			var discountedPrice = parseInt(amount)*parseInt($('#discount').val())/100;
			var finalPrice = parseInt(amount)*(dis/100) ;
			var billdiv = $('#billprice');
			document.getElementById('disccPrice').style.display="block";
			$('#discprice')[0].innerHTML="";
			$('#discprice')[0].innerHTML=discountedPrice;
			$('#billprice')[0].innerHTML="";
			$('#billprice')[0].innerHTML=finalPrice;
		
		}
	}
});
$('#selItms').on('change', function() {
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
})

function test(){
	console.log("");
	document.getElementById("searchNames").value=$("#selItms option:selected").html();
	document.getElementById("searchIt").value=$("#selItms").val();
	document.getElementById("searchIt").disabled = true;
	document.getElementById("searchNames").disabled = true;
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

var dataFocusd=[];
var prev='';
var prevDisc='';
$("#selectbills").on('focus', function () {
	dataFocusd=[];
    prev = this.value;
    prevDisc='';
    prevDisc=$('#discount').val();
    $('table tr').each(function(index,obj){
		if(index>0){
		var itemcode='',itemq='',itemp='';
		itemcode = $(this).find('.itemcode')[0].innerText;
		itemq = $(this).find('.itemquantity')[0].innerText;
		itemp = $(this).find('.itemprice')[0].innerText;
		var xyz ={itemCode:itemcode,itemQuantity:itemq,itemPrice:itemp};
		dataFocusd.push(xyz);
		}
	});
	
})

//called when select is changed
function saveOrder(){
	console.log("Saving for"+prev);
	$('#discprice')[0].innerHTML="";
	document.getElementById('discount').value=0;
	$('#mobileno').value=0;

	var data=[];
		var mob = $('#mobileno').val();
		if(mob==undefined || mob == null || mob==""){
			mob=0;
		}
		var order = $('#order').val();
		if(order==undefined || order == null || order==""){
			order=0;
		}
		var invoice = $('#invoice').val();
		if(invoice==undefined || invoice == null || invoice==""){
			invoice=0;
		}
		var table = $('#selectbills').val();
		if(table==undefined || table == null || table==""){
			table=0;
		}
		var discount = $('#discount').val();
		if(discount==undefined || discount == null || discount==""){
			discount=0;
		}
		var datas={list:dataFocusd,mobile:mob,orderId:order,tableId:prev,discount:prevDisc,resultTableId:table};
		document.getElementById('discount').value="";
		
		$.ajax({
			url:'admin/saveTableOrders.htm',
			data:JSON.stringify(datas),
			dataType:'json',
			contentType: "application/json; charset=utf-8",
			type:"POST",
			success:function(result){
				
				$('table tr').each(function(index,obj){
					if(index>0){
					$(this).remove();	
					}
				});
					if(result.list.length>0){
						var tot=0;
						console.log(result);
						setTimeout(function(){
							$(result.list).each(function(ind,obj){
								 var markup="<tr><td>#</td><td class='itemcode'>"+obj.itemCode+"</td><td class='itemname'>"+obj.itemName+"</td><td id='"+obj.itemCode+"' class='itemquantity'>"+obj.itemQuantity+"</td><td id='p"+obj.itemCode+"' class='itemprice'>"+obj.itemPrice+"</td></tr>";
				    	    		$("table thead").append(markup);
				    	    		tot = parseInt(tot) + parseInt(obj.itemPrice);
							});
							$('#billprice')[0].innerHTML=tot;
							document.getElementById('totprice').value = tot;
							if(parseInt(result.discount)>0)
							{document.getElementById('discount').value = parseInt(result.discount);
								calculate_discount(parseInt(result.discount));
							}else{document.getElementById('discount').value="";}
						},200);
						
					}
				
				
			},
		});
}
function calculate_discount(discount){
	var dis = 100 - discount;
	var amount = $('#totprice').val();
	var discountedPrice = parseInt(amount)*discount/100;
	var finalPrice = parseInt(amount)*(dis/100) ;
	var billdiv = $('#billprice');
	document.getElementById('disccPrice').style.display="block";
	$('#discprice')[0].innerHTML="";
	$('#discprice')[0].innerHTML=discountedPrice;
	$('#billprice')[0].innerHTML="";
	$('#billprice')[0].innerHTML=finalPrice;
}

function printBill(){
	var list1 = []
	console.log("going to print");
	$('table tr').each(function(index,obj){
		if(index>0){
		var itemcode='',itemq='',itemp='';
		itemcode = $(this).find('.itemcode')[0].innerText;
		itemq = $(this).find('.itemquantity')[0].innerText;
		itemp = $(this).find('.itemprice')[0].innerText;
		var xyz ={itemCode:itemcode,itemQuantity:itemq,itemPrice:itemp};
		list1.push(xyz);
		}
	});
	var x = confirm("Do u really want to print the bill?");
	if(x && list1.length>0){
		var mob = $('#mobileno').val();
		if(mob==undefined || mob == null || mob==""){
			mob=0;
		}
		var order = $('#order').val();
		if(order==undefined || order == null || order==""){
			order=0;
		}
		var invoice = $('#invoice').val();
		if(invoice==undefined || invoice == null || invoice==""){
			invoice=0;
		}
		var table = $('#selectbills').val();
		if(table==undefined || table == null || table==""){
			table=0;
		}
		var discount = $('#discount').val();
		if(discount==undefined || discount == null || discount==""){
			discount=0;
		}
		
		var datas={list:list1,mobile:mob,orderId:order,tableId:table,discount:discount};
		console.log(datas);
		$.ajax({
			url:'admin/getItemsToPrint.htm',
			data:JSON.stringify(datas),
			dataType:'json',
			contentType: "application/json; charset=utf-8",
			type:"POST",
			success:function(result){
				console.log(result);
				if(result.result){
					$('table tr').each(function(index,obj){
						if(index>0){
						$(this).remove();	
						}
					});
					document.getElementById("totprice").value=0;
					$('#billprice')[0].innerHTML = "";
				}
				
			},
		});
	}else{
		alert("Sorry!! no data available to print.")
		return false;
	}
}

function clearBill(){
	console.log("here to clear bill");
	var tableid = $('#selectbills').val();
	
	var clearData={tabId:tableid}
	console.log(clearData);
	$.ajax({
		url:'admin/clearBill.htm',
		data:clearData,
		dataType:'json',
		type:"POST",
		success:function(result){
			console.log(result);
			//if(result.result){
			$('table tr').each(function(index,obj){
				if(index>0){
				$(this).remove();	
				}
			});
			document.getElementById('mobileno').value=0;
			$('#discprice')[0].innerHTML="";
			document.getElementById("discount").value=0;
			document.getElementById("totprice").value=0;
			
			$('#billprice')[0].innerHTML = "";
			document.getElementById("searchIt").focus();
			//}
			
		},
	});
	
	
}