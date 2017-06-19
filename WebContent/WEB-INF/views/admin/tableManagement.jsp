<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>SipNSlurp</title>
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
<script type="text/javascript" src="resourcs/js/lodash.min.js"></script>


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
.ql{
font-size: 65px !important;
    line-height: 70px;
    position: absolute;
    top: 50%;
    left: 15px;
    height: 70px;
    margin-top: -36px;
    opacity: .3;
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
<script type="text/javascript" src="resourcs/js/utilities/createTable.js"></script>
	

	
</head>

<body ng-app="myApp" ng-controller="myCtrl">

	<div id="loading">
		<img src="resourcs/assets-minified/images/spinner/loader-dark.gif"
			alt="Loading...">
	</div>
	<div id="sb-site">
		<div id="page-wrapper">
			<div id="page-header" class="clearfix">
				<div id="header-logo" class="rm-transition">
					<a href="#" class="tooltip-button hidden-desktop"
						title="Navigation Menu" id="responsive-open-menu"><i
						class="glyph-icon icon-align-justify"></i></a> <span>Admin Dashboard
					</span> <a id="collapse-sidebar" href="#" title=""><i
						class="glyph-icon icon-chevron-left"></i></a>
				</div>
				
				<div id="header-right">
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
											Dashboard</a> <a href="login.htm" class="btn vertical-button hover-green"
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
			<div id="page-sidebar" class="rm-transition">
				<div id="page-sidebar-wrapper">
					<div id="sidebar-top">
						<!-- <ul class="nav nav-pills nav-justified">
							<li class="active"><a href="#tab-example-1"
								data-toggle="tab"><i class="glyph-icon icon-users"></i></a></li>
							<li><a href="#tab-example-2" data-toggle="tab"><i
									class="glyph-icon icon-bell"></i></a></li>
							<li><a href="#tab-example-3" data-toggle="tab"><span
									class="small-badge bg-red"></span><i
									class="glyph-icon icon-bar-chart-o"></i></a></li>
							<li><a href="#tab-example-4" data-toggle="tab"><i
									class="glyph-icon icon-cogs"></i></a></li>
						</ul> -->
						<div class="tab-content">
							<div class="tab-pane clearfix fade active in" id="tab-example-1">
								<div class="user-profile-sm clearfix">
									<img width="45" class="img-rounded"
										src="resourcs/assets-minified/dummy-images/gravatar.jpg" alt="">
									<div class="user-welcome">
										Welcome back, <b>{{username}}</b>
									</div>
									<a href="#" title="" class="btn btn-sm btn-black-opacity-alt"><i
										class="glyph-icon icon-cog"></i></a>
								</div>
							</div>
							<div class="tab-pane clearfix fade" id="tab-example-2">
								<ul class="notifications-box notifications-box-alt">
									<li><span
										class="bg-purple icon-notification glyph-icon icon-users"></span>
										<span class="notification-text">This is an error
											notification</span>
									<div class="notification-time">
											a few seconds ago <span class="glyph-icon icon-clock-o"></span>
										</div>
										<a href="#"
										class="notification-btn btn btn-xs btn-black tooltip-button"
										data-placement="right" title="View details"><i
											class="glyph-icon icon-arrow-right"></i></a></li>
									<li><span
										class="bg-warning icon-notification glyph-icon icon-ticket"></span>
										<span class="notification-text">This is a warning
											notification</span>
									<div class="notification-time">
											<b>15</b> minutes ago <span class="glyph-icon icon-clock-o"></span>
										</div>
										<a href="#"
										class="notification-btn btn btn-xs btn-black tooltip-button"
										data-placement="right" title="View details"><i
											class="glyph-icon icon-arrow-right"></i></a></li>
									<li><span
										class="bg-green icon-notification glyph-icon icon-random"></span>
										<span class="notification-text font-green">A success
											message example.</span>
									<div class="notification-time">
											<b>2 hours</b> ago <span class="glyph-icon icon-clock-o"></span>
										</div>
										<a href="#"
										class="notification-btn btn btn-xs btn-black tooltip-button"
										data-placement="right" title="View details"><i
											class="glyph-icon icon-arrow-right"></i></a></li>
								</ul>
							</div>
							<div class="tab-pane clearfix fade" id="tab-example-3">
								<div class="info-box remove-border">
									<div class="chart-icon">
										<div class="infobox-sparkline"></div>
									</div>
									<b>Exchange rate</b> <span class="stats"><i
										class="glyph-icon icon-chevron-down font-red"></i> 43.79 <span
										class="font-green">+0.9</span></span>
								</div>
							</div>
							<div class="tab-pane clearfix fade" id="tab-example-4">
								<div class="complete-user-profile">
									<h4>Complete your profile</h4>
									<div class="progressbar-small progressbar" data-value="75">
										<div class="progressbar-value bg-azure tooltip-button"
											title="" data-original-title="45%"></div>
									</div>
									<b>Next step:</b> <a href="#" title="Verify identity">Verify
										identity</a>
								</div>
							</div>
						</div>
					</div>
					<div id="sidebar-menu">
						<ul>
							<li><a href="login.htm" title="Dashboard"><i
									class="glyph-icon icon-linecons-tv"></i> <span>Dashboard</span></a></li>
							<li><a href="#" title="Presentation websites"><i
									class="glyph-icon icon-linecons-cloud"></i> <span>Frontend
										presentation</span> <span class="bs-label label-success">32</span></a>
							<ul>
									<li class="header"><span>Homepage</span></li>
									<li><a href="featured-area-1.html" title="Hero area 1"><span>Hero
												area 1</span></a></li>
								
									<li class="header"><span>Widgets</span></li>
									<li><a href="carousels.html" title="Carousels"><span>Carousels</span></a></li>
									<li><a href="slideshows.html" title="Slideshows"><span>Slideshows</span></a></li>
									<li class="header"><span>Portfolios</span></li>
									<li><a href="portfolio-2col.html"
										title="Portfolio 2 columns"><span>2 columns</span></a></li>
									<li><a href="portfolio-3col.html"
										title="Portfolio 2 columns"><span>3 columns</span></a></li>
									<li><a href="portfolio-4col.html"
										title="Portfolio 4 columns"><span>4 columns</span></a></li>
									<li><a href="portfolio-6col.html"
										title="Portfolio 6 columns"><span>6 columns</span></a></li>
									<li><a href="portfolio-fw1.html"
										title="Portfolio full width"><span>Full width</span></a></li>
									<li><a href="portfolio-fw2.html"
										title="Portfolio full width alternate"><span>Full
												width alternate</span></a></li>
									<li><a href="portfolio-masonry.html"
										title="Portfolio masonry"><span>Full masonry</span></a></li>
									<li class="header"><span>Elements</span></li>
									<li><a href="icon-boxes.html" title="Icon boxes"><span>Icon
												boxes</span></a></li>
									<li><a href="page-titles.html" title="Page titles"><span>Page
												titles</span></a></li>
									<li><a href="pricing-table.html" title="Pricing tables"><span>Pricing
												tables</span></a></li>
									<li><a href="testimonials.html" title="Testimonials"><span>Testimonials</span></a></li>
									<li class="header"><span>Footers</span></li>
									<li><a href="footer-1.html" title="Simple black footer"><span>Simple
												black footer</span></a></li>
									<li><a href="footer-2.html" title="Simple blue footer"><span>Simple
												blue footer</span></a></li>
									<li><a href="footer-3.html" title="Grid footer 1"><span>Grid
												footer 1</span></a></li>
									<li><a href="footer-4.html" title="Grid footer 2"><span>Grid
												footer 2</span></a></li>
									<li class="header"><span>Headers</span></li>
									<li><a href="header-1.html" title=""><span>White
												transparent header</span></a></li>
									<li><a href="header-2.html" title=""><span>Alternate
												dropdown menu</span></a></li>
									<li><a href="header-3.html" title=""><span>White
												header</span></a></li>
									<li><a href="header-4.html" title=""><span>Mega
												dropdown menu</span></a></li>
									<li><a href="header-5.html" title=""><span>Blue
												header</span></a></li>
									<li><a href="header-6.html" title=""><span>Transparent
												header</span></a></li>
								</ul></li>
							<li class="divider"></li>
							<li><a href="#" title="Applications"><i
									class="glyph-icon icon-linecons-shop"></i> <span>Items Management</span></a>
								<ul>
									<li><a href="index.html" title="Dashboard example 1"><span>Add New Items</span></a></li>
									<li><a href="itemManagement.htm" title="Dashboard example 1"><span>View Items</span></a></li>
									<li><a href="tableManagement.htm" title="Dashboard example 1"><span>Tables Management</span></a></li>
								</ul>
								</li>
							<li><a href="#" title="Layouts"><i
									class="glyph-icon icon-linecons-desktop"></i> <span>User Management</span></a>
							<ul>
									<li><a href="#" title="Page blank"><span>Coming Soon<!-- Total Users --></span></a></li>
									<!-- <li><a href="page-container.html"
										title="Page with container"><span>Page with
												container</span></a></li>
									<li><a href="page-single-wrapper.html"
										title="Page with single wrapper"><span>Page with
												single wrapper</span></a></li>
									<li><a href="page-multiple-wrappers.html"
										title="Page with multiple wrappers"><span>Page with
												multiple wrappers</span></a></li>
									<li><a href="page-scrollbar.html"
										title="Page with custom scrollbar"><span>Page with
												custom scrollbar</span></a></li>
									<li><a href="page-tabs.html"
										title="Page with tabs navigation"><span>Page with
												tabs navigation</span></a></li> -->
								</ul></li>
							<li class="divider"></li>
							<li><a href="#" title="Extra pages"><i
									class="glyph-icon icon-linecons-params"></i> <span>Order Management
										</span></a>
							<ul>
									
									<li><a href="#" title="Dashboard example 1"><span>Coming Soon
												</span></a></li>
									
								</ul></li>
							<!-- <li class="divider"></li> -->
							<!-- <li><a href="#" title="Widgets"><i
									class="glyph-icon icon-linecons-cog"></i> <span>Widgets</span></a>
							<ul>
									<li><a href="accordions.html" title="Accordions"><span>Accordions</span></a></li>
									<li><a href="bs-carousel.html" title="Bootstrap carousel"><span>Bootstrap
												carousel</span></a></li>
									<li><a href="bs-datepicker.html"
										title="Bootstrap datepicker"><span>Bootstrap
												datepicker</span></a></li>
									<li><a href="calendar.html" title="Calendar"><span>Calendar</span></a></li>
									<li><a href="collapsable.html" title="Collapsable"><span>Collapsable</span></a></li>
									<li><a href="colorpicker.html" title="Colorpicker"><span>Colorpicker</span></a></li>
									<li><a href="custom-scrollbars.html"
										title="Custom scrollbars"><span>Custom scrollbars</span></a></li>
									<li><a href="dialogs.html" title="Dialogs"><span>Dialogs</span></a></li>
									<li><a href="dynamic-tables.html" title="Dynamic tables"><span>Dynamic
												tables</span></a></li>
									<li><a href="jgrowl-notifications.html"
										title="JGrowl notifications"><span>JGrowl
												notifications</span></a></li>
									<li><a href="jqueryui-datepicker.html"
										title="jQueryUI datepicker"><span>jQueryUI
												datepicker</span></a></li>
									<li><a href="lazyload.html" title="Images preloader"><span>Images
												preloader</span></a></li>
									<li><a href="loading-bar.html" title="Loading bar"><span>Loading
												bar</span></a></li>
									<li><a href="modals.html" title="Modals"><span>Modals</span></a></li>
									<li><a href="noty-notifications.html"
										title="Noty notifications"><span>Noty notifications</span></a></li>
									<li><a href="overlays.html" title="Overlays"><span>Overlays</span></a></li>
									<li><a href="popovers.html" title="Popovers"><span>Popovers</span></a></li>
									<li><a href="progress-bars.html" title="Progress bars"><span>Progress
												bars</span></a></li>
									<li><a href="sliders.html" title="Sliders"><span>Sliders</span></a></li>
									<li><a href="sortable.html" title="Sortable elements"><span>Sortable
												elements</span></a></li>
									<li><a href="tabs.html" title="Tabs"><span>Tabs</span></a></li>
									<li><a href="timepicker.html" title="Timepicker"><span>Timepicker</span></a></li>
									<li><a href="tooltips.html" title="Tooltips"><span>Tooltips</span></a></li>
								</ul></li>
							<li><a href="#" title="Elements"><i
									class="glyph-icon icon-linecons-beaker"></i> <span>Elements</span></a>
							<ul>
									<li><a href="badges.html" title="Badges"><span>Badges</span></a></li>
									<li><a href="buttons.html" title="Buttons"><span>Buttons</span></a></li>
									<li><a href="content-boxes.html" title="Content boxes"><span>Content
												boxes</span></a></li>
									<li><a href="dashboard-boxes.html" title="Dashboard boxes"><span>Dashboard
												boxes</span></a></li>
									<li><a href="icons.html" title="Icons"><span>Icons</span></a></li>
									<li><a href="images.html" title="Images"><span>Images</span></a></li>
									<li><a href="labels.html" title="Labels"><span>Labels</span></a></li>
									<li><a href="navigation-menus.html" title="Menus"><span>Menus</span></a></li>
									<li><a href="panel-boxes.html" title="Panel boxes"><span>Panel
												boxes</span></a></li>
									<li><a href="plain-tables.html" title="Tables"><span>Tables</span></a></li>
									<li><a href="response-messages.html"
										title="Response messages"><span>Response messages</span></a></li>
									<li><a href="ribbons.html" title="Ribbons"><span>Ribbons</span></a></li>
									<li><a href="scrollable-boxes.html"
										title="Scrollable boxes"><span>Scrollable boxes</span></a></li>
									<li><a href="social-boxes.html" title="Social boxes"><span>Social
												boxes</span></a></li>
									<li><a href="spinners.html" title="Loading spinners"><span>Loading
												spinners</span></a></li>
									<li><a href="tile-boxes.html" title="Tile boxes"><span>Tile
												boxes</span></a></li>
									<li><a href="timeline.html" title="Timeline"><span>Timeline</span></a></li>
								</ul></li>
							<li><a href="#" title="Forms"><i
									class="glyph-icon icon-linecons-doc"></i> <span>Forms</span> <span
									class="small-badge bg-primary"></span></a>
							<ul>
									<li><a href="forms-validation.html"
										title="Forms validation"><span>Forms validation</span></a></li>
									<li><a href="dropzone-uploader.html"
										title="Dropzone uploader"><span>Dropzone uploader</span></a></li>
									<li><a href="forms-elements.html" title="Forms elements"><span>Forms
												elements</span></a></li>
									<li><a href="image-crop.html" title="Image crop"><span>Image
												crop</span></a></li>
									<li><a href="input-masks.html" title="Input masks"><span>Input
												masks</span></a></li>
									<li><a href="knobs.html" title="Input knobs"><span>Input
												knobs</span></a></li>
									<li><a href="multi-upload.html" title="Multi uploader"><span>Multi
												uploader</span></a></li>
									<li><a href="wizard.html" title="Wizard"><span>Wizard</span></a></li>
									<li><a href="wysiwyg-editor.html" title="WYSIWYG Editors"><span>WYSIWYG
												Editors</span></a></li>
								</ul></li> -->
							<!-- <li><a href="#" title="Maps"><i
									class="glyph-icon icon-linecons-location"></i> <span>Maps</span>
									<span class="bs-label label-info">3</span></a>
							<ul>
									<li><a href="google-maps.html" title="Google maps"><span>Google
												maps</span></a></li>
									<li><a href="vector-maps.html" title="Vector maps"><span>Vector
												maps</span></a></li>
								</ul></li>
							<li><a href="#" title="Charts"><i
									class="glyph-icon icon-linecons-calendar"></i> <span>Charts</span></a>
							<ul>
									<li><a href="justgage.html" title="JustGage"><span>JustGage</span></a></li>
									<li><a href="morris-charts.html" title="Morris charts"><span>Morris
												charts</span></a></li>
									<li><a href="pie-gages.html" title="PieGages charts"><span>PieGages
												charts</span></a></li>
									<li><a href="sparklines.html" title="Sparklines charts"><span>Sparklines
												charts</span></a></li>
									<li><a href="xcharts.html" title="xCharts"><span>xCharts</span></a></li>
								</ul></li> -->
						</ul>
					</div>
					<div class="divider"></div>
					<!-- <div id="sidebar-files" class="mobile-hidden">
						<div class="divider-header">Cloud downloads</div>
						<ul class="files-box">
							<li><i
								class="files-icon glyph-icon font-red icon-file-archive-o"></i>
							<div class="files-content">
									<b>blog_export.zip</b>
									<div class="files-date">
										<i class="glyph-icon icon-clock-o"></i> added on <b>22.10.2014</b>
									</div>
								</div>
								<div class="files-buttons">
									<a href="#" class="btn btn-xs hover-info tooltip-button"
										data-placement="right" title="Download"><i
										class="glyph-icon icon-cloud-download"></i></a> <a href="#"
										class="btn btn-xs hover-danger tooltip-button"
										data-placement="right" title="Delete"><i
										class="glyph-icon icon-times"></i></a>
								</div></li>
							<li class="divider"></li>
							<li><i class="files-icon glyph-icon icon-file-code-o"></i>
							<div class="files-content">
									<b>homepage-test.html</b>
									<div class="files-date">
										<i class="glyph-icon icon-clock-o"></i> added <b>19.10.2014</b>
									</div>
								</div>
								<div class="files-buttons">
									<a href="#" class="btn btn-xs hover-info tooltip-button"
										data-placement="right" title="Download"><i
										class="glyph-icon icon-cloud-download"></i></a> <a href="#"
										class="btn btn-xs hover-danger tooltip-button"
										data-placement="right" title="Delete"><i
										class="glyph-icon icon-times"></i></a>
								</div></li>
							<li class="divider"></li>
							<li><i
								class="files-icon glyph-icon font-yellow icon-file-image-o"></i>
							<div class="files-content">
									<b>monthlyReport.jpg</b>
									<div class="files-date">
										<i class="glyph-icon icon-clock-o"></i> added on <b>10.9.2014</b>
									</div>
								</div>
								<div class="files-buttons">
									<a href="#" class="btn btn-xs hover-info tooltip-button"
										data-placement="right" title="Download"><i
										class="glyph-icon icon-cloud-download"></i></a> <a href="#"
										class="btn btn-xs hover-danger tooltip-button"
										data-placement="right" title="Delete"><i
										class="glyph-icon icon-times"></i></a>
								</div></li>
							<li class="divider"></li>
							<li><i
								class="files-icon glyph-icon font-green icon-file-word-o"></i>
							<div class="files-content">
									<b>new_presentation.doc</b>
									<div class="files-date">
										<i class="glyph-icon icon-clock-o"></i> added on <b>5.9.2014</b>
									</div>
								</div>
								<div class="files-buttons">
									<a href="#" class="btn btn-xs hover-info tooltip-button"
										data-placement="right" title="Download"><i
										class="glyph-icon icon-cloud-download"></i></a> <a href="#"
										class="btn btn-xs hover-danger tooltip-button"
										data-placement="right" title="Delete"><i
										class="glyph-icon icon-times"></i></a>
								</div></li>
						</ul>
					</div> -->
				</div>
			</div>
			<div id="page-content-wrapper" class="rm-transition">
				
				<link rel="stylesheet" type="text/css"
					href="resourcs/assets-minified/widgets/charts/xcharts/xcharts.css">
				<script type="text/javascript"
					src="resourcs/assets-minified/js-core/d3.js"></script>
				<script type="text/javascript"
					src="resourcs/assets-minified/widgets/charts/xcharts/xcharts.js"></script>
				<div id="page-content">
				<div class="row">
					<div class="panel-box col-md-12">
						<div class="panel-content bg-white">
							<h3><i class="fa fa-table" aria-hidden="true"></i> &nbsp;Table Management</h3>					
						</div>
					</div>
				</div>
					<div class="row">
						<div class="col-md-8">
						</div>
						
					</div>
					<div class="panel-box row">
						
					</div>
					<div class="panel-box col-md-12" style="background: white;margin-top:10px;">
					<button ng-click="showTableAdd()" class="btn btn-primary hvr-float-shadow" style="top: 20px;position: relative;background: #2b90d9;!important"><i class="fa fa-plus" aria-hidden="true"></i> &nbsp;Add Table</button>
					<div  class="panel-box row col-md-12" style="margin-top:15px;">
						<!-- id="tabdetails" --><table datatable="ng"  style="border: 1px solid gainsboro;min-width: 103%;max-width:103%;!important" class="table table-hover">
								<thead>
									<tr>

									<th>Sr. No</th>
									<th>Table Name</th>
									<th>Created On</th>
							        <th>Status</th>
							        <th>Actions</th>
									<th>Operations</th>
								</tr>
							</thead>
							<tbody>
							<tr ng-repeat="items in selectdetails">
							<td>{{$index+1}}</td>
							<td class="tab_name">{{items.tableName}}</td>
							<td class="tab_created">{{items.created}}</td>
							<td class="tab_status">{{items.status}}</td>
							<td><div ng-click="pununpub(items.tableId,this,$index)" ng-class="items.style">{{items.operations}}</div></td>
							<td><div style="display:inline-block;" ng-click="edit_item(items.tableId)" class="edit"><i class="fa fa-pencil-square-o" aria-hidden="true"></i>&nbsp;Edit</div>&nbsp;&nbsp<div style="display:inline-block;" ng-click="delete_item(items.tableId,$index)" class="delete"><i class="fa fa-trash-o" aria-hidden="true"></i>&nbsp;Delete</div></td>
							
							</tr>
							
							</tbody>
				  </table>
					</div>	
					</div>
					
				</div>
			</div>
		</div>
	</div>
	<!-- popup start-->
	
<div id="popup" style="z-index: 8;width: 100%;height: 100%;/* opacity: .95; */top: 0;left: 0;display: none; position: fixed;background-color: rgba(49, 49, 49, 0.82);overflow: auto;">
<div class="cont_centrar cent_active" style="border: 5px solid blanchedalmond;">
  <div class="cont_login">
    
    <div class="cont_tabs_login">
    <div style="position: absolute;top: 5px;right: 13px;z-index: 9;"><img style="width: 20px;position: absolute;right: -25px;top: -19px;cursor: pointer;" src="images/close_clip.png" title="close" onclick="closeTable()"></div>
      <ul class="ul_tabs">
        
        <li class="active"><a href="#">Create Table</a><span class="linea_bajo_nom"></span>
        </li>
      </ul>
      </div>
  <div class="cont_text_inputs">
      <input type="text" ng-model="tablename" class="input_form_sign d_block active_inp" placeholder="Table Name" name="name_us">
    
      </div>
<div class="cont_btn">
     <button class="hvr-glow btn_sign" ng-click="addTable(tablename)">Save</button>
      
      </div>
    </div>
    
  </div>
 <style>
.acpub{
    display: inline-block;
	cursor:pointer;
    font-weight: 100;
    padding: 4px 6px 4px 5px;
    color: white;
    background-color: #3cc051;
    background-image: none !important;
    text-shadow: none !important;
    text-decoration:none;
 }
.acunpub{
    display: inline-block;
	cursor:pointer;
 	font-weight: 100;
    padding: 4px 6px 4px 5px;
    color: white;
    background-color: #f87500;
    background-image: none !important;
    text-shadow: none !important;
    text-decoration:none;
}
.edit{
	cursor:pointer;
 	font-weight: 100;
    padding: 4px 6px 4px 5px;
    color: white;
    background-color: #00B3DF;
    background-image: none !important;
    text-shadow: none !important;
    text-decoration:none;
}
.delete{
cursor:pointer;
 font-weight: 100;
    padding: 4px 6px 4px 5px;
    color: white;
    background-color: #f83900;
    background-image: none !important;
    text-shadow: none !important;
    text-decoration:none;
}
      .hvr-glow {
  display: inline-block;
  vertical-align: middle;
  -webkit-transform: perspective(1px) translateZ(0);
  transform: perspective(1px) translateZ(0);
  box-shadow: 0 0 1px transparent;
  -webkit-transition-duration: 0.3s;
  transition-duration: 0.3s;
  -webkit-transition-property: box-shadow;
  transition-property: box-shadow;
}
.hvr-glow:hover, .hvr-glow:focus, .hvr-glow:active {
  box-shadow: 0 0 8px rgba(0, 0, 0, 0.6);
}
      * {
  margin: 0px auto;
  padding: 0px;
  font-family: 'Open Sans', sans-serif;
}
.cont_principal {
  position: absolute;
  width: 100%;
  height: 100%;
/* Rectangle 3: */
background-image: linear-gradient(-87deg, #F2F5F6 0%, #DDE5E8 100%);
}

.cont_centrar {
  position: absolute;
  width: 320px;
  left:50%;
  top:50%;
  margin-left: -160px;
  margin-top: -160px;
}

.cont_centrar {
  position: relative;
  width: 320px;
  float: left;
  background-image: linear-gradient(-226deg, #FFFFFF 8%, #EEF3F5 100%);

  border-radius: 8px;
transition: all 0.5s;
}

.cent_active {
    box-shadow: 11px 10px 14px 0px rgba(3,3,3,0.21);
}


.cont_tabs_login {
position: relative;
  float: left;
  width: 100%;
}

.ul_tabs > li { 
position: relative;
  float: left;
  width: 100%;
  list-style: none;
  text-align: center;

}

.ul_tabs > li > a  {  
text-decoration: none;
font-family: Helvetica;
font-size: 16px;
    color: #999;
line-height: 14px;
padding: 20px ;
display: block;
transition: all 0.5s;
}

  .ul_tabs > .active > a  {  
color: #FF8383;
background: #fafbfc;

}

.linea_bajo_nom {
  position: relative;
  width: 100%;
  float: left;
  background-color: #999;
  height: 2px;
}

.active .linea_bajo_nom {
  position: relative;
  width: 100%;
  float: left;
background-color: #FF8383;
height: 2px;
}

.cont_text_inputs {
position: relative;
  float: left;
  width: 100%;
  margin-top: 20px;
}

.input_form_sign {
  position: relative;
  float: left;
  width: 90%;
  border: none;
  border-bottom: 1px solid #B0BEC5 ;
  background-color: transparent;
  font-size: 14px;
  outline: none;
  transition: all 0.5s;
    height: 0px;
    margin: 0px;
    padding: 0px;  
opacity: 0;
display: none;
}

.active_inp {
  margin: 5% 5% ;  
  padding: 10px 0px;
  opacity: 1;
height: 5px;
}



.input_form_sign:focus {
  border-bottom: 1px solid #FF8383 ;}

.link_forgot_pass {
position: relative;
  margin-top: 0px;
  margin-left: 30%;
  text-decoration: none;
  color: #999;
  font-size: 13px;
  display: none;
  float: left;
  transition: all 0.5s;
}
.cont_btn {
  position: relative;
  float: left;
}

.btn_sign {
  background: rgba(255,64,88,0.74);
  box-shadow: 0px 2px 20px 2px rgba(255,114,132,0.50);
  border-radius: 8px;
  padding: 15px 30px;
  border: none;
  color: #fff;
  font-size: 14px;
  position: relative;  
  float: left;
  margin-left: 100px;
  margin-top: 20px;
  margin-bottom: 20px;
  cursor: pointer;
}

.terms_and_cons {
  width: 70%;  
  color: #999;
  font-size: 13px;
  transition: all 0.5s;
}

.d_none {
  display: none;
}

.d_block {
  display: block;
}

.cont_text_inputs > input:nth-child(1){
  transition-delay: 0.2s;
}

.cont_text_inputs > input:nth-child(2){
  transition-delay: 0.4s;
}
.cont_text_inputs > input:nth-child(3){
  transition-delay: 0.6s;
}
.cont_text_inputs > input:nth-child(4){
  transition-delay: 0.8s;
}
 
</style>
</div>
	<!-- popup end -->
	
	<link rel="stylesheet" type="text/css"
		href="resourcs/assets-minified/demo-widgets.css">
	<script type="text/javascript" src="resourcs/assets-minified/demo-widgets.js"></script>
	<!--  -->



</body>
<style>
.modal-content input[type=text]:focus{
  outline: 1px solid #68aed8;
}
@-webkit-keyframes hvr-icon-pulse {
  25% {
    -webkit-transform: scale(1.3);
    transform: scale(1.3);
  }
  75% {
    -webkit-transform: scale(0.8);
    transform: scale(0.8);
  }
}
@keyframes hvr-icon-pulse {
  25% {
    -webkit-transform: scale(1.3);
    transform: scale(1.3);
  }
  75% {
    -webkit-transform: scale(0.8);
    transform: scale(0.8);
  }
}
.hvr-icon-pulse {
  display: inline-block;
  vertical-align: middle;
  -webkit-transform: perspective(1px) translateZ(0);
  transform: perspective(1px) translateZ(0);
  box-shadow: 0 0 1px transparent;
  position: relative;
  padding-right: 2.2em;
}
.hvr-icon-pulse:before {
  position: absolute;
  right: 1em;
  padding: 0 1px;
  font-family: FontAwesome;
  -webkit-transform: translateZ(0);
  transform: translateZ(0);
  -webkit-transition-timing-function: ease-out;
  transition-timing-function: ease-out;
}
.hvr-icon-pulse:hover:before, .hvr-icon-pulse:focus:before, .hvr-icon-pulse:active:before {
  -webkit-animation-name: hvr-icon-pulse;
  animation-name: hvr-icon-pulse;
  -webkit-animation-duration: 1s;
  animation-duration: 1s;
  -webkit-animation-timing-function: linear;
  animation-timing-function: linear;
  -webkit-animation-iteration-count: infinite;
  animation-iteration-count: infinite;
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
  box-shadow: 0 5px 15px rgba(0,0,0,0.3);
  /* move the element up by 5px */
}
.hvr-float-shadow:hover:before, .hvr-float-shadow:focus:before, .hvr-float-shadow:active:before {
  opacity: 1;
  -webkit-transform: translateY(5px);
  transform: translateY(5px);
  /* move the element down by 5px (it will stay in place because it's attached to the element that also moves up 5px) */
}
div.dataTables_filter input {
    width: 200px;
    margin-left: -0.5em;
    display: inline-block;
    position: relative;
    left: 27px; !important
    }
div.dataTables_length label {
    position: relative;
    font-weight: normal;
    text-align: left;
    white-space: nowrap;
    top: 44px; !important
    }

</style>
<script type="text/javascript">
/* $(document).ready(function() {
	$('#tabdetails').dataTable();
} ); */
	function closeTable(){
	$('#popup').fadeOut();
	}</script>

</html>
