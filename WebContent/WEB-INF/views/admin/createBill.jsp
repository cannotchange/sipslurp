<!DOCTYPE html>
<html lang="en">
<%@ page import = "java.io.*,java.util.*, javax.servlet.*" %>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>Place An Order</title>
<meta name="description" content="">
<meta name="viewport"
	content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="resourcs/assets-minified/images/icons/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="resourcs/assets-minified/images/icons/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="resourcs/assets-minified/images/icons/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="resourcs/assets-minified/images/icons/apple-touch-icon-57-precomposed.png">
<link rel="shortcut icon"
	href="resourcs/assets-minified/images/icons/snsfav.png">
	

<script type="text/javascript" src="resourcs/assets-minified/js-core.js"></script>
<script type="text/javascript">
	$(window).load(function() {
		setTimeout(function() {
			$('#loading').fadeOut(400, "linear");
		}, 300);
	});
</script>


<style>
#loading {
	position: fixed;
	width: 100%;
	height: 100%;
	left: 0;
	top: 0;
	right: 0;
	bottom: 0;
	display: block;
	background: #fff;
	z-index: 10000;
}

#loading img {
	position: absolute;
	top: 50%;
	left: 50%;
	margin: -23px 0 0 -23px;
}
</style>
<link rel="stylesheet" type="text/css"
	href="resourcs/assets-minified/helpers/helpers-all.css">
<link rel="stylesheet" type="text/css"
	href="resourcs/assets-minified/elements/elements-all.css">
<link rel="stylesheet" type="text/css"
	href="resourcs/assets-minified/icons/fontawesome/fontawesome.css">
<link rel="stylesheet" type="text/css"
	href="resourcs/assets-minified/icons/linecons/linecons.css">
<link rel="stylesheet" type="text/css"
	href="resourcs/assets-minified/snippets/snippets-all.css">
<link rel="stylesheet" type="text/css"
	href="resourcs/assets-minified/applications/mailbox.css">
<link rel="stylesheet" type="text/css"
	href="resourcs/assets-minified/themes/supina/layout.css">
<link id="layout-color" rel="stylesheet" type="text/css"
	href="resourcs/assets-minified/themes/supina/default/layout-color.css">
<link id="framework-color" rel="stylesheet" type="text/css"
	href="resourcs/assets-minified/themes/supina/default/framework-color.css">
<link rel="stylesheet" type="text/css"
	href="resourcs/assets-minified/themes/supina/border-radius.css">
<link rel="stylesheet" type="text/css"
	href="resourcs/assets-minified/helpers/colors.css">
	
	<jsp:include page="../imports/commonfiles.jsp"></jsp:include>
	
	<script type="text/javascript" src="Scripts/Controllers/dashboardCtrl.js"></script>
	<script type="text/javascript" src="Scripts/Factories/adminFactory.js"></script>
	<script type="text/javascript" src="resourcs/js/utilities/utlity.js"></script>
</head>
<body ng-app="myApp" ng-controller="myCtrl">
	<div id="loading">
		<img src="resourcs/assets-minified/images/spinner/loader-dark.gif"
			alt="Loading...">
	</div>
	<div id="sb-site">
		<div id="page-wrapper">
			<div id="page-header" class="clearfix" style="border-bottom: 1px solid beige;">
				<div id="header-logo" class="rm-transition">
					<a href="#" class="tooltip-button hidden-desktop"
						title="Navigation Menu" id="responsive-open-menu"><i
						class="glyph-icon icon-align-justify"></i></a> <span><form action="login.htm"><button type="submit" class="btn btn-sm btn-info"><i class="fa fa-reply" aria-hidden="true"></i>&nbsp;Goto Dashboard</button></form><i class="opacity-80"></i>
					</span> <i id="collapse-sidebar" style="top: -50px;position: relative;cursor: pointer;left: 220px;"
						class="glyph-icon icon-chevron-left"></i>
				</div>
				<div style="display: inline-block;left:222px;text-align: center;margin-top: 0px;position: relative;top: 10px;">
					<small style="font-size: 16px;">Date:</small>
				  <h5 id="tme" style="display: inline-block;">Sat May 27 2017 09:56:55</h5>
				</div>
				<!-- <div style="display: inline-block;left: 270px;text-align: center;margin-top: 0px;position: relative;top: 10px;">
					<small style="font-size: 16px;">Cash Memo</small>
				    <input type="radio" name="check" style="margin-left: 5px;">
				    <small style="margin-left: 30px;font-size: 16px;">Sip-n-Slurp</small>
					<input type="radio" name="check" style="margin-left: 5px;">   
				</div> -->
				
				<div style="display: inline-block; left: 270px; text-align: center; margin-top: 0px; position: relative; top: 10px;">
					<div class='radio-group'>
						<label class='radio-label'> <input name='snacks'
							type='radio' id='pizza' checked='checked'> <span
							class='inner-label'>Cash Memo</span>
						</label> <label class='radio-label' style="margin-left: 15px;"> <input name='snacks'
							type='radio' id='nachos'> <span class='inner-label'>Sip n Slurp</span>
						</label>
					</div>
				</div>
				
				
				<div id="header-right" style="float: right;margin-right: 5px;">
					<div class="user-profile dropdown">
						<a href="#" title="" class="user-ico clearfix"
							data-toggle="dropdown"><img width="36"
							src="resourcs/assets-minified/dummy-images/gravatar.jpg" alt="">
							<i class="glyph-icon icon-chevron-down"></i></a>
						<div class="dropdown-menu pad0B float-right">
							<div class="box-sm">
								<div class="login-box clearfix">
									<div class="user-img">
										<a href="#" title="" class="change-img">Change photo</a> <img
											src="resourcs/assets-minified/dummy-images/gravatar.jpg" alt="">
									</div>
									<div class="user-info">
										<span>{{username}} <i>Front-end web developer</i></span> <a
											href="#" title="">Edit profile</a> <a href="#" title="">View
											notifications</a>
									</div>
								</div>
								<div class="divider"></div>
								<ul class="reset-ul mrg5B">
									<li><a href="#">View login page example <i
											class="glyph-icon float-right icon-caret-right"></i></a></li>
									<li><a href="#">View lockscreen example <i
											class="glyph-icon float-right icon-caret-right"></i></a></li>
									<li><a href="#">View account details <i
											class="glyph-icon float-right icon-caret-right"></i></a></li>
								</ul>
								<div class="pad5A button-pane button-pane-alt text-center">
									<a href="logout.htm" class="btn display-block font-normal btn-danger"><i
										class="glyph-icon icon-power-off"></i> Logout</a>
								</div>
							</div>
						</div>
					</div>
					<div class="top-icon-bar float-right">
						<div class="dropdown">
							<a data-toggle="dropdown" href="#" title=""><i
								class="glyph-icon icon-linecons-megaphone"></i></a>
							<div class="dropdown-menu float-right">
								<div class="popover-title display-block clearfix pad10A">Notifications</div>
								<div
									class="scrollable-content scrollable-nice box-md scrollable-small">
									<ul class="no-border notifications-box">
										<li><span
											class="bg-danger icon-notification glyph-icon icon-bullhorn"></span>
											<span class="notification-text">This is an error
												notification</span>
										<div class="notification-time">
												a few seconds ago <span class="glyph-icon icon-clock-o"></span>
											</div></li>
										<li><span
											class="bg-warning icon-notification glyph-icon icon-users"></span>
											<span class="notification-text font-blue">This is a
												warning notification</span>
										<div class="notification-time">
												<b>15</b> minutes ago <span class="glyph-icon icon-clock-o"></span>
											</div></li>
										<li><span
											class="bg-green icon-notification glyph-icon icon-sitemap"></span>
											<span class="notification-text font-green">A success
												message example.</span>
										<div class="notification-time">
												<b>2 hours</b> ago <span class="glyph-icon icon-clock-o"></span>
											</div></li>
										<li><span
											class="bg-azure icon-notification glyph-icon icon-random"></span>
											<span class="notification-text">This is an error
												notification</span>
										<div class="notification-time">
												a few seconds ago <span class="glyph-icon icon-clock-o"></span>
											</div></li>
										<li><span
											class="bg-warning icon-notification glyph-icon icon-ticket"></span>
											<span class="notification-text">This is a warning
												notification</span>
										<div class="notification-time">
												<b>15</b> minutes ago <span class="glyph-icon icon-clock-o"></span>
											</div></li>
										<li><span
											class="bg-blue icon-notification glyph-icon icon-user"></span>
											<span class="notification-text font-blue">Alternate
												notification styling.</span>
										<div class="notification-time">
												<b>2 hours</b> ago <span class="glyph-icon icon-clock-o"></span>
											</div></li>
										<li><span
											class="bg-purple icon-notification glyph-icon icon-user"></span>
											<span class="notification-text">This is an error
												notification</span>
										<div class="notification-time">
												a few seconds ago <span class="glyph-icon icon-clock-o"></span>
											</div></li>
										<li><span
											class="bg-warning icon-notification glyph-icon icon-user"></span>
											<span class="notification-text">This is a warning
												notification</span>
										<div class="notification-time">
												<b>15</b> minutes ago <span class="glyph-icon icon-clock-o"></span>
											</div></li>
										<li><span
											class="bg-green icon-notification glyph-icon icon-user"></span>
											<span class="notification-text font-green">A success
												message example.</span>
										<div class="notification-time">
												<b>2 hours</b> ago <span class="glyph-icon icon-clock-o"></span>
											</div></li>
										<li><span
											class="bg-purple icon-notification glyph-icon icon-user"></span>
											<span class="notification-text">This is an error
												notification</span>
										<div class="notification-time">
												a few seconds ago <span class="glyph-icon icon-clock-o"></span>
											</div></li>
										<li><span
											class="bg-warning icon-notification glyph-icon icon-user"></span>
											<span class="notification-text">This is a warning
												notification</span>
										<div class="notification-time">
												<b>15</b> minutes ago <span class="glyph-icon icon-clock-o"></span>
											</div></li>
									</ul>
								</div>
								<div class="pad10A button-pane button-pane-alt text-center">
									<a href="#" class="btn btn-primary"
										title="View all notifications">View all notifications</a>
								</div>
							</div>
						</div>
						<div class="dropdown">
							<a data-toggle="dropdown" href="#" title=""><span
								class="bs-badge badge-absolute bg-red">2</span> <i
								class="glyph-icon icon-linecons-params"></i></a>
							<div class="dropdown-menu float-right" id="progress-dropdown">
								<div
									class="scrollable-content scrollable-nice box-sm scrollable-small">
									<ul class="no-border progress-box progress-box-links">
										<li><a href="#" title=""><div class="progress-title">
													Finishing uploading files <b>23%</b>
												</div>
												<div class="progressbar-smaller progressbar" data-value="23">
													<div class="progressbar-value bg-blue-alt">
														<div class="progressbar-overlay"></div>
													</div>
												</div></a></li>
										<li><a href="#" title=""><div class="progress-title">
													Roadmap progress <b>91%</b>
												</div>
												<div class="progressbar-smaller progressbar" data-value="91">
													<div class="progressbar-value bg-red">
														<div class="progressbar-overlay"></div>
													</div>
												</div></a></li>
										<li><a href="#" title=""><div class="progress-title">
													Images upload <b>58%</b>
												</div>
												<div class="progressbar-smaller progressbar" data-value="58">
													<div class="progressbar-value bg-green"></div>
												</div></a></li>
										<li><a href="#" title=""><div class="progress-title">
													WordPress migration <b>74%</b>
												</div>
												<div class="progressbar-smaller progressbar" data-value="74">
													<div class="progressbar-value bg-purple"></div>
												</div></a></li>
										<li><a href="#" title=""><div class="progress-title">
													Agile development procedures <b>91%</b>
												</div>
												<div class="progressbar-smaller progressbar" data-value="91">
													<div class="progressbar-value bg-black">
														<div class="progressbar-overlay"></div>
													</div>
												</div></a></li>
										<li><a href="#" title=""><div class="progress-title">
													Systems integration <b>58%</b>
												</div>
												<div class="progressbar-smaller progressbar" data-value="58">
													<div class="progressbar-value bg-azure"></div>
												</div></a></li>
										<li><a href="#" title=""><div class="progress-title">
													Code optimizations <b>97%</b>
												</div>
												<div class="progressbar-smaller progressbar" data-value="97">
													<div class="progressbar-value bg-yellow"></div>
												</div></a></li>
									</ul>
								</div>
								<div class="pad5A button-pane button-pane-alt text-center">
									<a href="#" class="btn display-block font-normal hover-green"
										title="View all notifications">View all notifications</a>
								</div>
							</div>
						</div>
						<div class="dropdown">
							<a href="#" data-toggle="dropdown" data-placement="left"
								class="popover-button-header tooltip-button"
								title="Example menu"><span
								class="bs-badge badge-absolute bg-green">9</span> <i
								class="glyph-icon icon-linecons-cog"></i></a>
							<div class="dropdown-menu float-right">
								<div class="box-sm">
									<div
										class="pad5T pad10B pad10L pad10R dashboard-buttons clearfix">
										<a href="#" class="btn vertical-button hover-blue-alt"
											title=""><span
											class="glyph-icon icon-separator-vertical pad0A medium"><i
												class="glyph-icon icon-dashboard opacity-80 font-size-20"></i></span>
											Dashboard</a> <a href="#" class="btn vertical-button hover-green"
											title=""><span
											class="glyph-icon icon-separator-vertical pad0A medium"><i
												class="glyph-icon icon-tags opacity-80 font-size-20"></i></span>
											Widgets</a> <a href="#" class="btn vertical-button hover-orange"
											title=""><span
											class="glyph-icon icon-separator-vertical pad0A medium"><i
												class="glyph-icon icon-fire opacity-80 font-size-20"></i></span>
											Tables</a> <a href="#" class="btn vertical-button hover-orange"
											title=""><span
											class="glyph-icon icon-separator-vertical pad0A medium"><i
												class="glyph-icon icon-bar-chart-o opacity-80 font-size-20"></i></span>
											Charts</a> <a href="#" class="btn vertical-button hover-purple"
											title=""><span
											class="glyph-icon icon-separator-vertical pad0A medium"><i
												class="glyph-icon icon-laptop opacity-80 font-size-20"></i></span>
											Buttons</a> <a href="#" class="btn vertical-button hover-azure"
											title=""><span
											class="glyph-icon icon-separator-vertical pad0A medium"><i
												class="glyph-icon icon-code opacity-80 font-size-20"></i></span>
											Panels</a>
									</div>
									<div
										class="bg-gray text-transform-upr font-size-12 font-gray-dark pad10A">Dashboard
										menu</div>
									<div
										class="pad5T pad10B pad10L pad10R dashboard-buttons clearfix">
										<a href="#" class="btn vertical-button remove-border btn-info"
											title=""><span
											class="glyph-icon icon-separator-vertical pad0A medium"><i
												class="glyph-icon icon-dashboard opacity-80 font-size-20"></i></span>
											Dashboard</a> <a href="#"
											class="btn vertical-button remove-border btn-danger" title=""><span
											class="glyph-icon icon-separator-vertical pad0A medium"><i
												class="glyph-icon icon-tags opacity-80 font-size-20"></i></span>
											Widgets</a> <a href="#"
											class="btn vertical-button remove-border btn-purple" title=""><span
											class="glyph-icon icon-separator-vertical pad0A medium"><i
												class="glyph-icon icon-fire opacity-80 font-size-20"></i></span>
											Tables</a> <a href="#"
											class="btn vertical-button remove-border btn-azure" title=""><span
											class="glyph-icon icon-separator-vertical pad0A medium"><i
												class="glyph-icon icon-bar-chart-o opacity-80 font-size-20"></i></span>
											Charts</a> <a href="#"
											class="btn vertical-button remove-border btn-yellow" title=""><span
											class="glyph-icon icon-separator-vertical pad0A medium"><i
												class="glyph-icon icon-laptop opacity-80 font-size-20"></i></span>
											Buttons</a> <a href="#"
											class="btn vertical-button remove-border btn-warning"
											title=""><span
											class="glyph-icon icon-separator-vertical pad0A medium"><i
												class="glyph-icon icon-code opacity-80 font-size-20"></i></span>
											Panels</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div id="page-content">
					<div class="main-container">
						<div class="page-box">
<!-- 							<h3 class="page-title1">
								<div style="text-align: center;margin-top: -36px;"><img style="width:100px;" src="images/sns.png"><h3 style="display: inline-block;">&nbsp;&nbsp;Sip n Slurp&nbsp;&nbsp;</h3>
								<small style="font-size:20px;display: inline;">-Place an Order</small>
								<div style="font-size: 17px;position: absolute;right: 20px;top: 60px;">Mobile No.<input type="text" class="qtys" style="width: 120px;"></div>
</div>
							</h3>
							<h1 class="font-gray-dark text-center mrg25T mrg15B"></h1>
							<h3 class="page-title" style="margin-bottom:5px;"></h3><br> -->
							<h3 class="page-title1" style="min-height: 150px;">
															
							<div id="searchCode" style="position:relative;top:-40px;">
								<div class="col-md-9 searchable">
									<input class="srch1" type="text" name="search" id="searchIt" placeholder="Item Code Here">
									<div style="font-size: 10px;display: inline-block;">
										<span style="cursor:pointer;position:relative;left: 12px;" class="glyphicon glyphicon-minus" onclick="decreaseQuantity()"></span>
										<input class="qty" type="number" min="1" name="search" id="quantity" value="1" placeholder="quantity">
										<span style="cursor:pointer;position:relative;right: 12px;" class="glyphicon glyphicon-plus" onclick="increaseQuantity()"></span>
									</div>
									<div style="font-size: 10px;display: inline-block;">
									<i style="cursor:pointer;position:relative;left: 25px;font-size: 17px;" class="fa fa-inr"></i>
										<input stle="background:none !important;" class="qty" type="number" min="1" name="search" id="price" value="" placeholder="price" disabled>
									</div>
								</div>
								<div class="col-md-3 searchable">
									<small>Bill For</small>
									<select onchange="saveOrder()" id="selectbills" style="width: 170px;height: 24px;font-size: 14px;text-align: center;">  <!-- ng-options="items.tableId as items.tableName for items in selectdetails" ng-model="selectdetails"> -->
									<option ng-repeat="item in selectdetails" ng-if="item.status=='Published'" value="{{item.tableId}}">{{item.tableName}}</option> 
									<!-- <option>Table1</option>
									<option>Table2</option> -->
									</select>
								</div>
								<%-- <div class="col-md-3 searchable">
									<small>Date:</small>
									<% Date date = new Date();out.print("<h5 id='tme' style='display: inline-block;'>"+date.toString()+"</h5>");%>
								</div> --%>
							</div>
							<div id="ermsg">No Such Code!</div>
							<div id="searchItm" style="position:relative;top: -25px;">
								<div class="col-md-9 searchable">
									<!-- <input class="srch" type="text"  name="searchName" id="searchNm" ng-change="items_lsit()" ng-model="item_name" placeholder="Item Name Here"> -->
									<!-- <ul id="searchnmres">
									</ul> -->
									<!-- <select class="selbox" onchange="test();" name="selectItms" style="display:none;" id="selItms">
										
									</select> -->
									<!-- <ul class="" role="listbox" style="cursor: default;">
										<li ng-repeat="item in all_items">{{item.itemName}}</li>
									</ul> -->
									<!-- test -->
									<select id="combobox">
    									<option ng-repeat="item in totItems" value="{{item.itemCode}}">{{item.itemName}}</option>
  									</select>
									
								</div>
								<div class="col-md-3">
								<div style="font-size: 14px;position: absolute;">Mobile No.<input type="text" id="mobileno" class="qtys" style="width: 120px;"></div>
								
								<div style="top: 32px;font-size: 14px;position: relative;float: right;">
								<a class="btn btn-sm btn-primary hvr-float-shadow" onclick="clearBill()" href="#" style="top: 61px;position: absolute;right: -10px;border: 1px solid black;background: #f87500;"> Clear <i class="fa fa-trash" style="font-size:14px;"aria-hidden="true"></i></a></div>
								</div>
							</div><div id="ermsg1">No Such Name!</div>
							</h3>
							
							<h3 class="page-title" style="margin-top: 30px;padding: 11px 18px 4px 24px;margin-bottom: 5px;background: #fbfbfb;"></h3><br>
							<div calss="col-md-12" class="page-title" style="background: #ffffff;"><!-- overflow: auto; -->
							<div class="col-md-12" style="min-height: 343px;background: white;margin: -21px 0px 0px -21px;">
								<h4 class="font-gray-dark text-center mrg25T mrg15B" style="text-align: left !important;min-height: 61px;padding: 0px 0 0 0;margin-left: 24px;"><div style="font-size: 14px;position: relative;top: -35px;">
								<!-- <b>Invoice <span id="invoiceid">#007612</span></b> --><br><br><b>Order ID:</b> <span id="orderid">4F3S8J</span><br><b>
								  </b></div>
								  </h4>
						<div class="bill-table" >
						<a class="btn btn-sm btn-primary hvr-float-shadow" onclick="printBill()" href="#" style="top: -33px;position: absolute;right: 4px;"><i class="fa fa-print"></i> Print</a>
							<table id="billTable" style="border: 1px solid gainsboro;" class="table table-hover">
								<thead>
									<tr>
										<th>#</th>
										<th>Item Code</th>
										<th>Item Name</th>
										<th>Quantity</th>
										<th>Sub Total</th>
									</tr>
								</thead>
								<tbody id="table_body">
								
								</tbody>
							</table>
							<div class="tots" >
							<span>Amount: Rs</span><input class="qtys" type="text" id="totprice" disabled>
							
							<div id="discPrice" style="position: relative;left: 112x;top: 12px;">Discount-<span id="disprice" style="position: relative;left: 65px;"><input class="qty" type="text" name="discount" id="discount" style="top: -13px;background: none;position: relative;right:20px;padding-left:5px;width:65px!important;"placeholder="Discount(%)"></span></div>
							<!-- <input class="qty" type="text" name="discount" id="discount" style=" position: absolute;right: 23px;background:none;"placeholder="Discount(%)"> -->
						<div id="disccPrice" style="display:none;position: relative;left: 112x;top: 10px;">Discounted. Price-<span id="discprice" style="position: relative;left: 35px;">0</span></div>
						<div id="billPrice" style="position: relative;left: 35px;top: 15px;font-size:18px;margin-left:-35px;color: red;">Billing Amount-<span id="billprice" style="position: relative;left: 60px;"></span></div>
							</div>
						</div>
						</div>
							<!-- <div class="col-md-4" style="position: relative;display: inline-block;min-height: 343px;margin: -21px 0px 0px 21px;background: aliceblue;right: -22px;">
								<div class="col-md-12" style="width: 105% !important;background: beige;margin-left: -11px;margin-top: 3px;border: 1px solid black;">
									<h2 class="font-gray-dark text-center mrg25T mrg15B">Search Results:-</h2>
								</div>
								<div id="searchRes" class="col-md-12" style="width: 105% !important;margin-left: -11px;margin-top: 3px;border: 1px solid black;">
									ajshdkjashdk
								</div>
							</div> -->
							</div>
						</div>
					</div>
				</div>
			
		</div>
		
	</div>
	
	
	
	
	
	
	
	
	
	
	<link rel="stylesheet" type="text/css" href="resourcs/assets-minified/demo-widgets.css">
	<script type="text/javascript" src="resourcs/assets-minified/demo-widgets.js"></script>
	
</body>
<script type="text/javascript" src="resourcs/js/utilities/utlity.js"></script>
<style>
.srch1{
    width: 180px;
    box-sizing: border-box;
    border-width: 0 0 2px 0;
    border-color: blue;
    font-size: 16px;
    background-color: white;
    background-image: url(images/search-icon.png);
    background-position: 3px 8px;
    background-repeat: no-repeat;
    padding: 5px 0px 10px 32px;
}

.srch {
    width: 180px;
    box-sizing: border-box;
    border-width: 0 0 2px 0;
    border-color: blue;
    font-size: 16px;
    background-color: white;
    background-image: url(images/search-icon.png);
    background-position: 3px 8px;
    background-repeat: no-repeat;
    padding: 5px 0px 10px 32px;
    transition: width 0.4s ease-in-out;
}

.srch:focus {
    width: 215px;
    border-color:orange;
}
.qty{
    text-align: center;
 	width: 100px;
    box-sizing: border-box;
    border-width: 0 0 2px 0;
    border-color: #22ab09;;
    font-size: 16px;
    background-color: white;
    background-position: 3px 8px;
    background-repeat: no-repeat;
    padding: 0px 0px 10px 0px;
    transition: width 0.4s ease-in-out;
}
.qty::-webkit-outer-spin-button,
.qty::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}
.bill-table{

    margin-bottom: 60px !important;
	left: 10px !important;
	background:aliceblue;
	margin-top: -45px;
    position: relative;
    margin-bottom: 40px;
    padding: 67px 25px 0;
    /* border-width: 1px;
    border-style: solid;
    border-radius: 6px; */
    border-color: #eee;
}
#billTable{
	position: relative;
    border: 1px solid gainsboro;
    top: -35px;
    color: black;
}
.selbox{
    left: 240px;
    top: 13px;
    font-size: 14px;
    width: 170px;
    text-align: center;
    position: absolute;
    }
 .qty{
     text-align: center;
    width: 100px;
    box-sizing: border-box;
    border-width: 0 0 2px 0;
    border-color: #22ab09;
    font-size: 15px;
    background-color: white;
    background-position: 3px 8px;
    background-repeat: no-repeat;
  }
  .qtys{
    padding: 12px 0px 2px 0px;
    text-align: center;
    width: 100px;
    box-sizing: border-box;
    border-width: 0 0 2px 0;
    border-color: #22ab09;
    font-size: 15px;
    background-color: white;
    background-position: 3px 8px;
    background-repeat: no-repeat;
    position: relative;
    top: -7px;
    left:5px;
    background: none !important;
  }
 .tots{
 	float: right;
    right: 0;
    position: relative;
    padding: 0px 31px 11px 9px;
    margin-top: 10px;
    margin-bottom: 10px;
    } 
 #ermsg{
 color: red;
 font-size: 13px;
 display:none;
 position: absolute;
 left: 71px;
 }
 #ermsg1{
 	color: red;
 	font-size: 13px;
    position: absolute;
    float: left;
    display:none;
    top: 112px;
    left: 71px;
  }
  .qtyq{
    padding: 12px 0px 2px 0px;
    text-align: center;
    width: 100px;
    box-sizing: border-box;
    border-width: 0 0 2px 0;
    border-color: #22ab09;
    font-size: 15px;
    background-color: white;
    background-position: 3px 8px;
    background-repeat: no-repeat;
    position: relative;
    top: -7px;
    left:5px;
    background: none !important;
  }
 #searchnmres li{n-left: -40px;
    */
    padding-left: 6px;
    border: 1px solid beige;
    list-style: none;
    font-size: 16px;
    max-height: 69px;
    max-width: 213px;
    padding: 2px 0px 0px -3px;
    overflow: auto;
    margin-left: -40px;
    }
#searchnmres{
	max-width: 213px;
    max-height: 103px !important;
    overflow: auto;
    cursor: pointer;
    /**/
   /*  border: 1px solid beige; */
    line-height: 23px;
    background: aliceblue;
    padding: 0px 0px 0px 40px;
#onselect{
background: antiquewhite;
    border: 1px solid burlywood;
}

</style>
<script>
$(document).ready(function(){
	setInterval(function(){ 
		document.getElementById("tme").innerHTML = Date().substr(0,24);
				}, 1000);
	
	$(document).on('keyup',function(e){
		var code = e.keyCode || e.which;
		if(e.ctrlKey && e.keyCode == 80){
			printBill();
	        return false;
	    }
	});
})
</script>
<style>
/*  */
/*  */
#ui-id-1{
max-height:150px !important;
overflow:scroll;	
}
  .custom-combobox {
    position: relative;
    display: inline-block;
  }
  .custom-combobox-toggle {
    position: absolute;
    top: 0;
    bottom: 0;
    margin-left: -1px;
    padding: 0;
  }
  .custom-combobox-input {
    margin: 0;
    padding: 5px 10px;
  }
 .hvr-bubble-bottom {
  display: inline-block;
  vertical-align: middle;
  -webkit-transform: perspective(1px) translateZ(0);
  transform: perspective(1px) translateZ(0);
  box-shadow: 0 0 1px transparent;
  position: relative;
}
.hvr-bubble-bottom:before {
  pointer-events: none;
  position: absolute;
  z-index: -1;
  content: '';
  border-style: solid;
  -webkit-transition-duration: 0.3s;
  transition-duration: 0.3s;
  -webkit-transition-property: transform;
  transition-property: transform;
  left: calc(50% - 10px);
  bottom: 0;
  border-width: 10px 10px 0 10px;
  border-color: #e1e1e1 transparent transparent transparent;
}
.hvr-bubble-bottom:hover:before, .hvr-bubble-bottom:focus:before, .hvr-bubble-bottom:active:before {
  -webkit-transform: translateY(10px);
  transform: translateY(10px);
}

.hvr-float-shadow {
  display: inline-block;
  vertical-align: middle;
  -webkit-transform: perspective(1px) translateZ(0);
  transform: perspective(1px) translateZ(0);
  box-shadow: 0 0 1px transparent;
  position: relative;
  -webkit-transition-duration: 0.3s;
  transition-duration: 0.3s;
  -webkit-transition-property: transform;
  transition-property: transform;
}
.hvr-float-shadow:before {

  pointer-events: none;
  position: absolute;
  z-index: -1;
  content: '';
  top: 100%;
  left: 5%;
  height: 10px;
  width: 90%;
  opacity: 0;
  background: -webkit-radial-gradient(center, ellipse, rgba(0, 0, 0, 0.35) 0%, transparent 80%);
  background: radial-gradient(ellipse at center, rgba(0, 0, 0, 0.35) 0%, transparent 80%);
  /* W3C */
  -webkit-transition-duration: 0.3s;
  transition-duration: 0.3s;
  -webkit-transition-property: transform, opacity;
  transition-property: transform, opacity;
}
.hvr-float-shadow:hover, .hvr-float-shadow:focus, .hvr-float-shadow:active {
  -webkit-transform: translateY(-5px);
  transform: translateY(-5px);
  /* move the element up by 5px */
}
.hvr-float-shadow:hover:before, .hvr-float-shadow:focus:before, .hvr-float-shadow:active:before {
  opacity: 1;
  -webkit-transform: translateY(5px);
  transform: translateY(5px);
  /* move the element down by 5px (it will stay in place because it's attached to the element that also moves up 5px) */
}
  </style>
  <!-- <script type="text/javascript" src="resourcs/search_req/jquery-1.12.4.js"></script> -->
  <script type="text/javascript" src="resourcs/search_req/jquery-ui.js"></script>
  
  <script>
  $( function() {
	  console.log("called");
    $.widget( "custom.combobox", {
      _create: function() {
        this.wrapper = $( "<span>" )
          .addClass( "custom-combobox" )
          .insertAfter( this.element );
 
        this.element.hide();
        this._createAutocomplete();
      },
 
      _createAutocomplete: function() {
    	  console.log("called");
      	
        var selected = this.element.children( ":selected" ),
          value = selected.val() ? selected.text() : "";
        this.input = $( "<input>" )
          .appendTo( this.wrapper )
          .val( value )
          .attr( "id", "searchNames" )
          .attr( "placeholder", "Item Name Here" )
          .addClass( "srch" )
          .autocomplete({
            delay: 0,
            minLength: 0,
            source: $.proxy( this, "_source" )
          })
          .tooltip({
            classes: {
              "ui-tooltip": "ui-state-highlight"
            }
          });
 
        this._on( this.input, {
          autocompleteselect: function( event, ui ) {
            ui.item.option.selected = true;
            this._trigger( "select", event, {
              item: ui.item.option
            });
            searchByNameValue(ui.item.value,ui.item.option.value);
          },
 
          autocompletechange: "_removeIfInvalid"
        });
        
      },
      
      
 
      _source: function( request, response ) {
        var matcher = new RegExp( $.ui.autocomplete.escapeRegex(request.term), "i" );
        response( this.element.children( "option" ).map(function() {
          var text = $( this ).text();
          if ( this.value && ( !request.term || matcher.test(text) ) )
            return {
              label: text,
              value: text,
              option: this
            };
        }) );
      },
 
      _removeIfInvalid: function( event, ui ) {
    	  console.log(ui.item.value);
        // Selected an item, nothing to do
        if ( ui.item ) {
          return;
        }
 
        // Search for a match (case-insensitive)
        var value = this.input.val(),
          //valueLowerCase = value.toLowerCase(),
          valid = false;
        this.element.children( "option" ).each(function() {
          if ( $( this ).text().toLowerCase() === valueLowerCase ) {
            this.selected = valid = true;
            return false;
          }
        });
 
        // Found a match, nothing to do
        if ( valid ) {
          return;
        }
        // Remove invalid value
        this.input
          .val( "" )
          .attr( "title", value + " didn't match any item" )
          .tooltip( "open" );
        this.element.val( "" );
        this._delay(function() {
          this.input.tooltip( "close" ).attr( "title", "" );
        }, 2500 );
        this.input.autocomplete( "instance" ).term = "";
      },
 
      _destroy: function() {
        this.wrapper.remove();
        this.element.show();
      }
    });
 
    $( "#combobox" ).combobox();
    $( "#toggle" ).on( "click", function() {
      $( "#combobox" ).toggle();
    });
  } );
  </script>
</html>