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
        <link type="text/css" href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600'rel='stylesheet'>
            <script src="scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
        <script src="scripts/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>
        <script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="scripts/datatables/jquery.dataTables.js" type="text/javascript"></script>
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
				$('#useremail').val(useremail);
			}
	});
	</script>
    </head>
    <body>
        <div class="navbar navbar-fixed-top">
            <div class="navbar-inner">
                <div class="container">
                    <a class="btn btn-navbar" data-toggle="collapse" data-target=".navbar-inverse-collapse">
                        <i class="icon-reorder shaded"></i></a><a class="brand" href="index.html">Farm Data </a>
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
							<li >
								<a href="general1.jsp">
									<i class="menu-icon icon-inbox"></i>
									Profile Information
								</a>
							</li>
							
							<li>
								<a href="disease.jsp">
									<i class="menu-icon icon-tasks"></i>
									Disease Forecasting
								</a>
							</li>
						</ul><!--/.widget-nav-->
                            <!--/.widget-nav-->
                            
                            
                            <ul class="widget widget-menu unstyled">
                                <li><a href="cooperative.jsp"><i class="menu-icon icon-bold"></i> Cooperative Harvesting </a></li>
                                <li><a href="activity.jsp"><i class="menu-icon icon-book"></i>Exchange Data with Farmers </a></li>
                                <li><a href="statistics.jsp"><i class="menu-icon icon-paste"></i>Statistics Management </a></li>
                                <li class="active"><a href="#" style="color: white;"><i class="menu-icon icon-table"></i>Decision Making </a></li>
                                <li><a href="notification.jsp"><i class="menu-icon icon-table"></i>Notifications</a></li>
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
                    <div class="span9">
                    <div class="content">
                    <div class="module">
                    <div class="module-head">
                    <h3> Select the crop you wish</h3>
                    </div>
                    <div class="module-body">
                    <form class="form-horizontal row-fluid">
                    <div class="control-group">
											<label class="control-label" for="basicinput">Select your crop</label>
											<div class="controls">
											<select tabindex="1" id="fav_culti" data-placeholder="Select your Fav Crop" class="span8">
																<option value="">Select Your Favourite Crop..</option>
																<option value="Rice, paddy">Rice, paddy</option>
																<option value="Cow's milk, whole, fresh">Cow's milk, whole, fresh</option>
																<option value="Cattle, meat">Cattle, meat</option>
																<option value="Pig, meat">Pig, meat</option>
																<option value="Chicken, meat">Chicken, meat</option>
																<option value="Wheat">Wheat</option>
																<option value="Soybeans">Soybeans</option>
																<option value="Tomatoes">Tomatoes</option>
																<option value="Sugar cane">Sugar cane</option>
																<option value="Maize (Corn)">Maize (Corn)</option>
																<option value="Eggs, in shell">Eggs, in shell</option>
																<option value="Potatoes">Potatoes</option>
																<option value="Vegetables, not elsewhere specified">Vegetables, not elsewhere specified</option>
																<option value="Grapes">Grapes</option>
																<option value="Water Buffalo milk">Water Buffalo milk</option>
																<option value="Cotton, lint">Cotton, lint</option>
																<option value="Apples">Apples</option>
																<option value="Bananas">Bananas</option>
																<option value="Cassava (yuca)">Cassava (yuca)</option>
																<option value="Mangos,Mangosteens, Guavas">Mangos,Mangosteens, Guavas</option>
																<option value="Sheep, meat">Sheep, meat</option>
																<option value="Coffee">Coffee</option>
																<option value="Palm oil">Palm oil</option>
																<option value="Onions, dry">Onions, dry</option>
																<option value="Beans, dry and green">Beans, dry and green</option>
																<option value="Peanuts, in shell">Peanuts, in shell</option>
																<option value="Olives">Olives</option>
																<option value="Rapeseed">Rapeseed</option>
																<option value="Chilis and peppers, green and dry">Chilis and peppers, green and dry</option>
																<option value="Rubber">Rubber</option>
																<option value="Tea">Tea</option>
																<option value="Oranges">Oranges</option>
																<option value="Cucumbers">Cucumbers</option>
																<option value="Yams">Yams</option>
																<option value="Peaches, nectarines">Peaches, nectarines</option>
																<option value="Lettuce, Chicory">Lettuce, Chicory</option>
																<option value="Cacao (Chocolate)">Cacao (Chocolate)</option>
																<option value="Goat, meat">Goat, meat</option>
																<option value="Sunflower seed">Sunflower seed</option>
																<option value="Sugar beets">Sugar beets</option>
																<option value="Watermelons">Watermelons</option>
																<option value="Buffalo, meat">Buffalo, meat</option>
																<option value="Asparagus">Asparagus</option>
																<option value="Turkey, meat">Turkey, meat</option>
																<option value="Carrots, Turnips">Carrots, Turnips</option>
																<option value="Duck, meat">Duck, meat</option>
																<option value="Coconuts">Coconuts</option>
																<option value="Tangerines">Tangerines</option>
																<option value="Almonds">Almonds</option>
																<option value="Lemons, Limes">Lemons, Limes</option>
																<option value="Strawberries">Strawberries</option>
																<option value="Walnuts">Walnuts</option>
												</select>
											</div>
										</div>
                    </form></div></div></div>
                    <div class="control-group">
											<div class="controls">
												<center><button type="button" id="analyse" class="btn" style="background-color: #28B6BD;color: white;">Analyse Statistics </button></center>
											</div>
										</div>
                    </div>
                    <div class="span9">
                        <div class="content">
                            <div class="module">
                                <div class="module-head">
                                    <h3>
                                        Users Previously Searched</h3>
                                </div>
                                <div class="module-body table">
                                <table id="previoussearch" class="datatable-1 table table-bordered table-striped display" cellspacing="0" width="100%" style="width: 100% !important;">
	                    <thead>
	                        <tr id="transcripts_list_header" >
	                            		<th>Email</th>
	                            		<th>Cropname</th>
		                              <th>Date</th>
	                        </tr>
	                    </thead>
	                	<tbody id="dataIns1">  </tbody>		
					</table><br><br>
                                </div>
                            </div>
                            <!--/.module-->
                        </div>
                        <!--/.content-->
                    </div>
                    <!--/.span3-->
                    <div class="span9" style="margin-left:27%">
                        <div class="content">
                            <div class="module">
                                <div class="module-head">
                                    <h3>
                                        Profit and loss</h3>
                                </div>
                                <div class="module-body table">
                                <table id="profilnloss" class="datatable-1 table table-bordered table-striped display" cellspacing="0" width="100%" style="width: 100% !important;">
	                    <thead>
	                        <tr id="transcripts_list_header" >
	                            <th>Email</th>
		                              <th>Crop</th>
		                              <th>Location</th>
		                              <th>State</th>
		                              <th>Zip Code</th>
		                              <th>Soil Type</th>
		                              <th>Acres</th>
	                        </tr>
	                    </thead>
	                	<tbody id="dataIns1">  </tbody>		
					</table><br><br>
                                </div>
                            </div>
                            <!--/.module-->
                        </div>
                        <!--/.content-->
                    </div>
                    <div class="span9" style="margin-left:27%">
                        <div class="content">
                            <div class="module">
                                <div class="module-head">
                                    <h3>
                                        Profit and loss</h3>
                                </div>
                                <div class="module-body table">
                                <table id="profilnloss2" class="datatable-1 table table-bordered table-striped display" cellspacing="0" width="100%" style="width: 100% !important;">
	                    <thead>
	                        <tr id="transcripts_list_header" >
	                            <th>Email</th>
		                              <th>Disease</th>
		                              <th>Duration</th>
		                              <th>Currency</th>
		                              <th>Loss</th>
		                              <th>Pesticide</th>
		                              <th>Reason</th>
	                        </tr>
	                    </thead>
	                	<tbody id="dataIns1">  </tbody>		
					</table><br><br>
                                </div>
                            </div>
                            <!--/.module-->
                        </div>
                        <!--/.content-->
                    </div>
                    <!--/.span9-->
                </div>
            </div>
            <!--/.container-->
        </div>
        <!--/.wrapper-->
        <div class="footer">
		<div class="container">
			 

			<b class="copyright">&copy; 2016 Razeeya.com </b> All rights reserved.
		</div>
	</div>
         <script src="js/action.js"></script>
         <script src="js/validations.js"></script>
    </body>
