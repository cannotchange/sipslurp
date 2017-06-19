var app = angular.module('myApp',['datatables']);


app.controller('myCtrl', function($scope, adminFactory) {
	
	$scope.firstName = "John";
	$scope.lastName = "Doe";
	$scope.username = "";
	$scope.totalItems='';
	$scope.selectdetails='';
	$scope.tabcontent=['vinay','harsh','navjeet','deepak','nano'];
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
	
    $scope.saveItemss = function(){
    	var name = $('#itemName').val();
    	var price = $('#itemPrice').val();
    	var type = $('#selectItems').val();
//    	console.log(name);
//    	console.log(price);
//    	console.log(type);
    	var data={itemName:name,itemPrice:price,itemType:type};
    	
    	adminFactory.saveItems(data).success(function(data){
    		if(data.result){
    			document.getElementById('adItm').reset();
    			$scope.loadTotalItems();
    			document.getElementById('abc').style.display = "none";
    			toastr.success("Success, Item Has Been Added Successfully!!");}
    			else
    			toastr.error("Sorry Unable to save item.");
    	});	 	
    }
    
    $scope.loadTotalItems = function(){
    	adminFactory.getTotalItems().success(function(data){
    		//console.log(data);
    		$scope.totalItems = data.totalItems;
    	});
    }
    
    $scope.showSearchResult = function(keyVal){
    	console.log(keyVal);
    }
    $scope.loadUserDetails = function getUserDetails(){
    	adminFactory.getUserDetails().success(function(data){
    		if(data.result){
    			$scope.username = data.username;
    		}
    	});	 
    }
    $scope.loadUserDetails();
    
    $scope.loadTotalItems();
    
    
    $scope.item_name = "";
    
    $scope.items_lsit = function() {
    	var data={value:$scope.item_name};
    	$.ajax({
			url:'admin/getItemNameFromSearch.htm',
			data:data,
			dataType:'json',
			type:"POST",
			success:function(result){
				$scope.all_items = result;
			},
		})
    }
    
    
    
    $scope.loadOrderInvoice = function getUserDetails(){
    	adminFactory.getOrderInvoice().success(function(data){
    		if(data.result){
    			$scope.username = data.username;
    		}
    	});	 
    }
    
    $scope.loadOptionsForSelect = function getUserDetails(){
    	adminFactory.getSelectOptions().success(function(data){
    		console.log(data);
    			$scope.selectdetails = data;
    	});	 
    }
    

    
    
    $scope.addTable=function(tablename){
    	adminFactory.createTable({tableName:tablename}).success(function(data){
    		if(data.result){
    			$scope.selectdetails.push(data);
    			$('#popup').fadeOut();
    			$scope.tablename='';
    		}else{
    			toastr.error(data.msg);
    		}
    	});	
    }
    
    $scope.loadOptionsForSelect();
    
    $scope.showTableAdd = function(){
    	$('#popup').fadeIn();
    }
    
    $scope.fillTable = function(){
    	adminFactory.getSelectOptions().success(function(data){
    			$scope.selectdetails = data;
    			var dataSets = [];
    			$(data).each(function(index,obj){
    				var d = [];
            		d.push(index+1);
            		d.push(obj.tableName);
            		d.push(obj.created);
            		d.push(obj.status);
            		d.push(obj.operations);
            		d.push('<a class="edit" ng-click="edits()" rel="'+obj.tableId+'" href="#"><i class="fa fa-pencil-square-o" aria-hidden="true"></i>&nbsp;Edit</a>&nbsp;&nbsp <a onclick="delet(this)" class="delete" rel="'+obj.tableId+'" href="#"><i class="fa fa-trash-o" aria-hidden="true"></i>&nbsp;Delete</a>');
            		//dataSets.push(d);
    			});
            	oTable = $('#tabdetails').dataTable({
                	"data": dataSets,
                	"bDestroy": true
                });
    	});
    }
    
    $scope.fillTable();
  
    
    $scope.delete_item = function(item,idx) {
    	console.log(item);
    	var x= confirm("Do You Really want to delete the table?");
    	if(x){
    		adminFactory.deleteTableItem({tableId:item}).success(function(data){
    			if(data.result){
    				$scope.selectdetails.splice(idx, 1);
    				toastr.success("Success, Table has been rmeoved!!");
    			}else{
    	    			toastr.error("Sorry Unable to delete Table.");
    			}
    			
    		});
    		//console.log($scope.selectdetails);
    		//$scope.selectdetails.push({tableName:"tst",created:"",status:"",operations:"",tableId:1});
    		//$scope.selectdetails.splice($scope.selectdetails.length-1,0,{tableName:"tst",created:"",status:"",operations:"",tableId:1});
    	}
    	
    	
    }
    $scope.pununpub = function(item,tag,indx) {
    	console.log(indx);
    	adminFactory.publishTable({tableId:item}).success(function(data){
			if(data.result){
				console.log(data);
				
				$scope.selectdetails.splice(indx, 1,data);
				//$scope.selectdetails.push(data);
				toastr.success(data.msg);
			}else{
	    			toastr.error("Sorry currently unable to process the request.");
			}
			
		});
    	
    }
    $scope.edit_item = function(item) {
    	console.log(item);
    	
    }
    
    $scope.loadAllItems = function getUserDetails(){
    	adminFactory.getAllItems().success(function(data){
    		console.log(data);
    		if(data.length>0){
    			$scope.totItems = data;	
    		}
    	});	 
    }
    $scope.loadAllItems();
    
    $scope.saveOrder = function(){
    	console.log("saving order");
    }
    
    
 });