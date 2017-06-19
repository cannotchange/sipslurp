var app = angular.module('myApp',['datatables']);

 
app.controller('itemCtrl', function($scope, adminFactory) {
	
	$scope.username = "";
	$scope.totalItems='';
	
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
	
 
    $scope.loadUserDetails = function getUserDetails(){
    	adminFactory.getUserDetails().success(function(data){
    		if(data.result){
    			$scope.username = data.username;
    		}
    	});	 
    }
    $scope.loadUserDetails();
    
    
    $scope.loadOptionsForSelect = function getUserDetails(){
    	adminFactory.getSelectOptions().success(function(data){
    		console.log(data);
    			$scope.selectdetails = data;
    	});	 
    }
    
  
    
    $scope.delete_item = function(item,idx) {
    	console.log(item);
    	var x= confirm("Do You Really want to delete the item?");
    	if(x){
    		adminFactory.deleteItem({itemId:item}).success(function(data){
    			if(data.result){
    				$scope.totalItems.splice(idx, 1);
    				toastr.success("Success, Product has been delete!!");
    			}else{
    	    			toastr.error("Sorry Unable to delete Product.");
    			}
    			
    		});
    		//console.log($scope.selectdetails);
    		//$scope.selectdetails.push({tableName:"tst",created:"",status:"",operations:"",tableId:1});
    		//$scope.selectdetails.splice($scope.selectdetails.length-1,0,{tableName:"tst",created:"",status:"",operations:"",tableId:1});
    	}
    	
    	
    }
    
    $scope.edit_item = function(item) {
    	console.log(item);
    	
    }
    
    $scope.loadAllItems = function getUserDetails(){
    	adminFactory.getAllItems().success(function(data){
    		console.log(data);
    		if(data.length>0){
    			$scope.totalItems = data;	
    		}
    	});	 
    }
    $scope.loadAllItems();
    
    
 });