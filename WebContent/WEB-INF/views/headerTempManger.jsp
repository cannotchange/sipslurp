<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style type="text/css">
	#footer {
		position: fixed;
		width: 100%;
		bottom: 0px;
		height: 25px; /* Height of the footer */
		background: rgb(15, 72, 135);
		text-align: center;
		color: white;
	}
	  .side-nav {
	margin-left: -225px;
	left: 225px;
	width: 225px;
	position: fixed;
	top: 50px;
	height: 100%;
	border-radius: 0;
	border: none;
	background-color: rgb(15, 72, 135);
	overflow-y: auto;
  }
  
  .navbar navbar-inverse navbar-fixed-top{
  background-color: black;
  }
	.footer, .footer:hover, .footer:focus { color: white; }
</style>

	<style type="text/css">
		.head-list { width: 235px;font-size: 13px; }
		.action > li > a { padding-top: 8px;padding-bottom: 8px; }
	</style>
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#" style="color:white;">Holy place, Managers Page</a>
		</div>
<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse navbar-ex1-collapse">
			<ul class="nav navbar-nav side-nav head-list action">
			<li class="active"><a href="temple_manager.do"><i class="fa fa-dashboard"></i> Home</a></li>
				
				<li><a href="event.do"><i class="fa fa-user"></i>Add Events</a></li>
				<li><a href="publication.do"><i class="fa fa-user"></i>Add Facilities</a></li>
				<li><a href="news.do"><i class="fa fa-user"></i>Add News</a></li>
			    <li><a style="background: none;">&nbsp;</a></li>
				
			</ul>
			<c:set var="fullname" value="${(empty user.fullname)? user.username : user.fullname}" scope="page"/>
			<ul class="nav navbar-nav navbar-right navbar-user">
				<li class="dropdown user-dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> ${user.fullname} &nbsp;<b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="#" data-toggle="modal"><i class="fa fa-unlock-alt"></i> Change Password</a></li>
						<li><a href="#" data-toggle="modal" ><i class="fa fa-user"></i> Update Profile</a></li>
						<li class="divider"></li>
						<li><a href="logout.do"><i class="fa fa-power-off"></i>Log Out</a></li>
					</ul>
				</li>
			</ul>
		</div><!-- /.navbar-collapse -->
	</nav>

<%-- 	<div id="changePassword" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&Chi;</button>
				<h4 class="modal-title" id="myModalLabel">Change Password</h4>
			</div>
			<div class="modal-body">
				<div id="passMessage" style="display: none;"></div>
				<form action="changePassword.do" id="form-ch-pwd" method="post" target="target-cp">
					<div class="form-group">
					<div class="col-sm-8" style="margin: 0px auto; float: none;">
						<label for="password">New Password</label>
						<input class="form-control" type="password" id="password" name="password">
					</div></div>
					<div class="form-group">
					<div class="col-sm-8" style="margin: 0px auto; float: none;">
						<label for="password">Confirm Password</label>
						<input class="form-control" type="password" id="passwordConf" name="passwordConf">
					</div></div>
				</form>
			</div>
			<div class="modal-footer" style="margin-top: 0px;padding: 15px 20px;">
				<button type="button" class="btn btn-default btn-sm" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary btn-sm" id="btn-password">Change Password</button>
			</div>
		</div></div>
	</div>

	<div id="updateProfile" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&Chi;</button>
				<h4 class="modal-title" id="myModalLabel">Update the Profile details</h4>
			</div>
			<div class="modal-body">
				<div id="profileMessage" style="display: none;"></div>
				<form action="updateProfile.do" id="form-cpn" method="post" target="target-cpn">
					<div class="form-group">
					<div class="col-sm-8" style="margin: 0px auto; float: none;">
						<label for="name">User</label>
						<input class="form-control" type="text" name="username" value="${user.username}" disabled>
					</div></div>
					<div class="form-group">
					<div class="col-sm-8" style="margin: 0px auto; float: none;">
						<label for="fullname">Full Name</label>
						<input class="form-control" type="text" name="fullname" value="${user.fullname}">
					</div></div>
				</form>
			</div>
			<div class="modal-footer" style="margin-top: 0px;padding: 15px 20px;">
				<button type="button" class="btn btn-default btn-sm" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary btn-sm" id="btn-profile">Update Profile</button>
			</div>
		</div></div> --%>
	</div>
<iframe name="target-cp" style="border: 0;height: 0;width: 0;display: none;"></iframe>
<iframe name="target-cpn" style="border: 0;height: 0;width: 0;display: none;"></iframe>

