
angular.module('myApp').factory('adminFactory', function($http) {
    var factory = {};
    
    factory.saveItems = function(data){
		return $http({
			method  : 'POST',
		    url     : 'admin/saveItems.htm',
		    data    : $.param(data), 
		    headers : { 'Content-Type': 'application/x-www-form-urlencoded' }
			
		});
	}
    
    factory.getTotalItems = function(){
		return $http({
			method  : 'GET',
		    url     : 'admin/totalItems.htm',
		    headers : { 'Content-Type': 'application/x-www-form-urlencoded' }
			
		});
	}
    
    factory.getUserDetails = function(){
		return $http({
			method  : 'GET',
		    url     : 'admin/userDetails.htm',
		    headers : { 'Content-Type': 'application/x-www-form-urlencoded' }
			
		});
    }
    
    factory.getOrderInvoice = function(){
		return $http({
			method  : 'GET',
		    url     : 'admin/orderInvoiceDetails.htm',
		    headers : { 'Content-Type': 'application/x-www-form-urlencoded' }
			
		});
    }
    
    factory.getSelectOptions = function(){
		return $http({
			method  : 'GET',
		    url     : 'admin/getSelectoption.htm',
		    headers : { 'Content-Type': 'application/x-www-form-urlencoded' }
			
		});
    }
    
    factory.createTable = function(data){
		return $http({
			method  : 'POST',
		    url     : 'admin/createTable.htm',
		    data	:$.param(data),
		    headers : { 'Content-Type': 'application/x-www-form-urlencoded' }
			
		});
    }
    
    factory.deleteTableItem = function(data){
		return $http({
			method  : 'POST',
		    url     : 'admin/deleteTableItem.htm',
		    data	:$.param(data),
		    headers : { 'Content-Type': 'application/x-www-form-urlencoded' }
			
		});
    }
    
    factory.publishTable = function(data){
		return $http({
			method  : 'POST',
		    url     : 'admin/publishTable.htm',
		    data	:$.param(data),
		    headers : { 'Content-Type': 'application/x-www-form-urlencoded' }
			
		});
    }
    
   factory.getAllItems = function(){
		return $http({
			method  : 'GET',
		    url     : 'admin/getAllItems.htm',
		    headers : { 'Content-Type': 'application/x-www-form-urlencoded' }
			
		});
    }
   
   factory.deleteItem = function(data){
		return $http({
			method  : 'POST',
		    url     : 'admin/deleteItem.htm',
		    data	:$.param(data),
		    headers : { 'Content-Type': 'application/x-www-form-urlencoded' }
			
		});
   }
    
    return factory;
 });
 