<!DOCTYPE html>
<html lang="en">
<head>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Edmin</title>
	<link type="text/css" href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link type="text/css" href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">
	<link type="text/css" href="css/theme.css" rel="stylesheet">
	<link type="text/css" href="images/icons/css/font-awesome.css" rel="stylesheet">
	<script src="scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
	<script src="scripts/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>
	<script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="scripts/flot/jquery.flot.js" type="text/javascript"></script>
	<link type="text/css" href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600' rel='stylesheet'>
	<script src="scripts/datatables/jquery.dataTables.js" type="text/javascript"></script>
	<script src="js/action.js"></script>
	<script src="js/validations.js"></script>
	<script>
	if (typeof (Storage) !== "undefined") {
        var useremail = localStorage.getItem("email");
      } else {
        window.alert('Please use a modern browser');
      }
	$.ajax({
			type		:	'GET',
			url			:	'/pullcomments',
			data		:	'',
			success		: 	function(data)
			{
// 				var jsonvars				=	JSON.parse(data);
			var jsonvars				=	JSON.parse(data);
	       	 console.log("ui");
	       	 console.log(jsonvars);
	       	 i=1;
	       	for(index in jsonvars)
			{
	       		var htmls = '<div class="media stream"><a href="#" class="media-avatar medium pull-left"><img src="images/user.png"></a>'+
				'<div class="media-body">'+
				'<div class="stream-headline">'+
					'<h5 class="stream-author">'+
						''+jsonvars[index].useremail+''+ 
						'<small>'+jsonvars[index].date+'</small>'+
					'</h5><div class="stream-text">'+jsonvars[index].comments+''+
                    '</div></div></div></div>';
                    $('#commentslist').append(htmls);
                    $('#totalupdates').html('<i class="icon-refresh shaded"></i>'+i+' updates');
                    i++;
			}
			}
	});
	</script>
</head>
<body>

	<div class="navbar navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container">
				<a class="btn btn-navbar" data-toggle="collapse" data-target=".navbar-inverse-collapse">
					<i class="icon-reorder shaded"></i>
				</a>

			  	<a class="brand" href="index.html">
			  		Cloud based Farm Management
			  	</a>

				<div class="nav-collapse collapse navbar-inverse-collapse">
					<ul class="nav nav-icons">
						<li class="active"><a href="#">
							<i class="icon-envelope"></i>
						</a></li>
						<li><a href="#">
							<i class="icon-eye-open"></i>
						</a></li>
						<li><a href="#">
							<i class="icon-bar-chart"></i>
						</a></li>
					</ul>

					<form class="navbar-search pull-left input-append" action="#">
						<input type="text" class="span3">
						<button class="btn" type="button">
							<i class="icon-search"></i>
						</button>
					</form>
				
					<ul class="nav pull-right">
						
						<li><a href="#">
							Support
						</a></li>
						<li class="nav-user dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">
								<img src="images/user.png" class="nav-avatar" />
								<b class="caret"></b>
							</a>
							<ul class="dropdown-menu">
								<li><a href="#">Your Profile</a></li>
								<li><a href="#">Edit Profile</a></li>
								<li><a href="#">Account Settings</a></li>
								<li class="divider"></li>
								<li><a href="#">Logout</a></li>
							</ul>
						</li>
					</ul>
				</div><!-- /.nav-collapse -->
			</div>
		</div><!-- /navbar-inner -->
	</div><!-- /navbar -->



	<div class="wrapper">
		<div class="container">
			<div class="row">
				<div class="span3">
					<div class="sidebar">

						<ul class="widget widget-menu unstyled">
							<li>
								<a href="general1.jsp" >
									<i class="menu-icon icon-inbox"></i>
									Profile Information
<!-- 									<b class="label green pull-right">11</b> -->
								</a>
							</li>
							
							<li >
								<a href="disease.jsp">
									<i class="menu-icon icon-tasks"></i>
									Disease Forecasting
<!-- 									<b class="label orange pull-right">19</b> -->
								</a>
							</li>
						</ul><!--/.widget-nav-->

						<ul class="widget widget-menu unstyled">
                                <li><a href="cooperative.jsp"><i class="menu-icon icon-bold"></i> Cooperative Harvesting </a></li>
                                <li ><a class="active" style="color: white;" href="#"><i class="menu-icon icon-book"></i>Exchange Data with Farmers </a></li>
                                <li><a href="statistics.jsp"><i class="menu-icon icon-paste"></i>Statistics Management </a></li>
                                <li><a href="decision.jsp"><i class="menu-icon icon-table"></i>Decision Making </a></li>
                                <li><a href="notification.jsp"><i class="menu-icon icon-table"></i><span id="notification">Notifications</span></a></li>
                                <li><a href="admin.jsp"><i class="menu-icon icon-bar-chart"></i>Admin Console </a></li>
                            </ul><!--/.widget-nav-->

						<ul class="widget widget-menu unstyled">
							<li>
								<ul id="togglePages" class="collapse unstyled">
									<li>
										<a href="other-login.html">
											<i class="icon-inbox"></i>
											Login
										</a>
									</li>
									<li>
										<a href="other-user-profile.html">
											<i class="icon-inbox"></i>
											Profile
										</a>
									</li>
									<li>
										<a href="other-user-listing.html">
											<i class="icon-inbox"></i>
											All Users
										</a>
									</li>
								</ul>
							</li>
							
							<li>
								<a href="#">
									<i class="menu-icon icon-signout"></i>
									Logout
								</a>
							</li>
						</ul>

					</div><!--/.sidebar-->
				</div><!--/.span3-->

				<div class="span9">
					<div class="content">

						<div class="module">
							<div class="module-head">
								<h3>News Feed</h3>
							</div>
							<div class="module-body">
								<div class="stream-composer media">
									<a href="#" class="media-avatar medium pull-left">
										<img src="images/user.png">
									</a>
									<div class="media-body">
										<div class="row-fluid">
											<textarea class="span12" id="usercomment" style="height: 70px; resize: none;"></textarea>
										</div>
										<div class="clearfix">
											<a id="updatecomments" class="btn btn-primary pull-right">
												Update Status
											</a>
											<a href="#" class="btn btn-small" rel="tooltip" data-placement="top" data-original-title="Upload a photo">
												<i class="icon-camera shaded"></i>
											</a>
											<a href="#" class="btn btn-small" rel="tooltip" data-placement="top" data-original-title="Upload a video">
												<i class="icon-facetime-video shaded"></i>
											</a>
											<a href="#" class="btn btn-small" rel="tooltip" data-placement="top" data-original-title="Pin your location">
												<i class="icon-map-marker shaded"></i>
											</a>
										</div>
									</div>
								</div>
								<div class="stream-list" id="commentslist">
									<div class="media stream new-update">
										<a href="#" id="totalupdates">
											<!-- <i class="icon-refresh shaded"></i>
											11 updates -->
										</a>
									</div>
									<!-- <div class="media stream">
										<a href="#" class="media-avatar medium pull-left">
											<img src="images/user.png">
										</a>
										<div class="media-body">
											<div class="stream-headline">
												<h5 class="stream-author">
													John Donga 
													<small>08 July, 2014</small>
												</h5>
												<div class="stream-text">
													 Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type. 
                                                </div>
											</div>
										</div>
									</div> -->
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="footer">
		<div class="container">
						<b class="copyright">&copy; 2016 Razeeya.com </b> All rights reserved.
		</div>
	</div>

	<script src="scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
	<script src="scripts/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>
	<script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
</body>