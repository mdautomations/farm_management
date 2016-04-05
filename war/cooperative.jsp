<!DOCTYPE html>
<html lang="en">
<head>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Cloud based Farm Management</title>
        <link type="text/css" href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link type="text/css" href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">
        <link type="text/css" href="css/theme.css" rel="stylesheet">
        <link type="text/css" href="images/icons/css/font-awesome.css" rel="stylesheet">
        <link type="text/css" href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600'
            rel='stylesheet'>
            <script src="scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
        <script src="scripts/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>
        <script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<!--         <script src="scripts/flot/jquery.flot.js" type="text/javascript"></script> -->
<!--         <script src="scripts/flot/jquery.flot.resize.js" type="text/javascript"></script> -->
        <script src="scripts/datatables/jquery.dataTables.js" type="text/javascript"></script>
<!--         <script src="scripts/common.js" type="text/javascript"></script> -->
<script>
	if (typeof (Storage) !== "undefined") {
        var useremail = localStorage.getItem("email");
      } else {
        window.alert('Please use a modern browser');
      }
	$.ajax({
			type		:	'GET',
			url			:	'/checknotification',
			data		:	{useremail : useremail},
			success		: 	function(data)
			{
// 				var jsonvars				=	JSON.parse(data);
				console.log("dathis is this :;"+data);
				$('#notification').html("Notifications <b class='label orange pull-right'>"+data+"</b>");
			}
	});
	</script>
    </head>
    <body>
        <div class="navbar navbar-fixed-top">
            <div class="navbar-inner">
                <div class="container">
                    <a class="btn btn-navbar" data-toggle="collapse" data-target=".navbar-inverse-collapse">
                        <i class="icon-reorder shaded"></i></a><a class="brand">Farm Data </a>
                    <div class="nav-collapse collapse navbar-inverse-collapse">
                        <ul class="nav nav-icons">
                            <li class="active"><a href="#"><i class="icon-envelope"></i></a></li>
                            <li><a href="#"><i class="icon-eye-open"></i></a></li>
                            <li><a href="#"><i class="icon-bar-chart"></i></a></li>
                        </ul>
                        <form class="navbar-search pull-left input-append" action="#">
                        <input type="text" class="span3">
                        <button class="btn" type="button">
                            <i class="icon-search"></i>
                        </button>
                        </form>
                        <ul class="nav pull-right">
                            <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown
                                <b class="caret"></b></a>
                                <ul class="dropdown-menu">
                                    <li><a href="#">Item No. 1</a></li>
                                    <li><a href="#">Don't Click</a></li>
                                    <li class="divider"></li>
                                    <li class="nav-header">Example Header</li>
                                    <li><a href="#">A Separated link</a></li>
                                </ul>
                            </li>
                            <li><a href="#">Support </a></li>
                            <li class="nav-user dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <img src="images/user.png" class="nav-avatar" />
                                <b class="caret"></b></a>
                                <ul class="dropdown-menu">
                                    <li><a href="#">Your Profile</a></li>
                                    <li><a href="#">Edit Profile</a></li>
                                    <li><a href="#">Account Settings</a></li>
                                    <li class="divider"></li>
                                    <li><a href="#">Logout</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <!-- /.nav-collapse -->
                </div>
            </div>
            <!-- /navbar-inner -->
        </div>
        <!-- /navbar -->
        <div class="wrapper">
            <div class="container">
                <div class="row">
                    <div class="span3">
                        <div class="sidebar">
                            <ul class="widget widget-menu unstyled">
							<li class="active">
								<a href="#" >
									<i class="menu-icon icon-inbox"></i>
									Profile Information
<!-- 									<b class="label green pull-right">11</b> -->
								</a>
							</li>
							
							<li>
								<a href="disease.jsp">
									<i class="menu-icon icon-tasks"></i>
									Disease Forecasting
<!-- 									<b class="label orange pull-right">19</b> -->
								</a>
							</li>
						</ul><!--/.widget-nav-->
                            <!--/.widget-nav-->
                            
                            
                            <ul class="widget widget-menu unstyled">
                                <li class="active"><a href="#" style="color: white;"><i class="menu-icon icon-bold"></i> Cooperative Harvesting </a></li>
                                <li><a href="activity.jsp"><i class="menu-icon icon-book"></i>Exchange Data with Farmers </a></li>
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
                        </div>
                        <!--/.sidebar-->
                    </div>
                    <!--/.span3-->
                    <div class="span9">
                        <div class="content">
                            <div class="module">
                                <div class="module-head">
                                    <h3>
                                        Co-Operative Harvesting</h3>
                                </div>
                                <div class="module-body table">
                                <table id="initial" class="datatable-1 table table-bordered table-striped display" cellspacing="0" width="100%" style="width: 100% !important;">
	                    <thead>
	                        <tr id="transcripts_list_header" >
	                            <th>useremail</th>
	                            <th>climatetype</th>
		                              <th>weather</th>
		                              <th>pesticides</th>
		                              <th>cultivation</th>
	                        </tr>
	                    </thead>
	                	<tbody id="dataIns1">  </tbody>		
					</table><br><br>
                                    <table id="datastables" cellpadding="0" cellspacing="0" border="0" class="datatable-1 table table-bordered table-striped	 display"
                                        width="100%">
                                        <thead>
                                           <tr>
		                              <th>useremail</th>
		                              <th>fieldname</th>
		                              <th>location</th>
		                              <th>soiltype</th>
		                              <th>ownership</th>
		                              <th>totalarea</th>
		                        </tr>
                                        </thead>
                                        <tbody id="dataIns">
                                           
                                        </tbody>
                                    </table><br><br><br><br>
                                </div>
                            </div>
                            <!--/.module-->
                        </div>
                        <!--/.content-->
                    </div>
                    <div class="span9" style="margin-left: 27%;">
                        <div class="content">
                            <div class="module">
                                <div class="module-head">
                                    <h3>
                                        Colloborative Partner</h3>
                                </div>
                                <div class="module-body table">
                                    <form class="form-horizontal row-fluid">
										<div class="control-group">
											<label class="control-label" for="basicinput"><b>Collaborate with</b></label>
											<div class="controls">
												<input type="text" id="cooperate" placeholder="Enter to whom you want to collaborate" class="span8">
											</div>
										</div><br>
										<div class="control-group">
											<div class="controls">
												<button type="button" id="collaborate" class="btn" style="background-color: #9BEC9B;color: white;">Send Request</button>
											</div>
										</div>
										</form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--/.wrapper-->
        <div class="footer">
		<div class="container">
			 

			<b class="copyright">&copy; 2016 Razeeya.com </b> All rights reserved.
		</div>
	</div>
         <script src="js/action.js"></script>
         <script src="scripts/reports.js" type="text/javascript"></script>
         <script src="js/validations.js"></script>
    </body>
