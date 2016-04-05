<!DOCTYPE html>
<html lang="en">


<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Cloud based Farm Management</title>
	<link type="text/css" href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link type="text/css" href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">
	<link type="text/css" href="css/theme.css" rel="stylesheet">
	<link type="text/css" href="images/icons/css/font-awesome.css" rel="stylesheet">
	<link type="text/css" href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600' rel='stylesheet'>
	<script src="scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
	<script src="scripts/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>
	<script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="scripts/flot/jquery.flot.js" type="text/javascript"></script>
	<script src="js/action.js"></script>
	<script src="js/validations.js"></script>
        <script src="scripts/datatables/jquery.dataTables.js" type="text/javascript"></script>
        <script>
		$(document).ready(function() {
			$('.datatable-1').dataTable();
			$('.dataTables_paginate').addClass("btn-group datatable-pagination");
			$('.dataTables_paginate > a').wrapInner('<span />');
			$('.dataTables_paginate > a:first-child').append('<i class="icon-chevron-left shaded"></i>');
			$('.dataTables_paginate > a:last-child').append('<i class="icon-chevron-right shaded"></i>');
		} );
	</script>
        
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
	$.ajax({
		type		:	'GET',
		url			:	'/pulldisease',
		data		:	'',
		success		: 	function(data)
		{
			 var jsonvars				=	JSON.parse(data);
	       	 console.log("ui");
	       	 console.log(jsonvars);
	      	  	dtable = $('#datastables').dataTable({
					"bDestroy" : true,
					"aoColumns" : [{
						"sTitle" : "Email",
						"sWidth" : "10%",
						"sClass" : "center"
					},{
						"sTitle" : "Crop",
						"sWidth" : "10%",
						"sClass" : "center"
					},{
						"sTitle" : "Location",
						"sWidth" : "10%",
						"sClass" : "center"
					},{
						"sTitle" : "State",
						"sWidth" : "10%",
						"sClass" : "center"
					},{
						"sTitle" : "Zip Code",
						"sWidth" : "10%",
						"sClass" : "center"
					},{
						"sTitle" : "Soil Type",
						"sWidth" : "10%",
						"sClass" : "center"
					},{
						"sTitle" : "Acres",
						"sWidth" : "10%",
						"sClass" : "center"
					}]
				});
	      		dtable.fnClearTable();
	      		var newRow = [];
	      		for(index in jsonvars)
				{
					 newRow[0] = jsonvars[index].useremail;
					newRow[1] = jsonvars[index].cropcultivated;
					newRow[2] = jsonvars[index].location;
					newRow[3] = jsonvars[index].state;
					newRow[4] = jsonvars[index].zipcode;
					newRow[5] = jsonvars[index].soiltype;
					newRow[6] = jsonvars[index].acrescount;
					newRow[7] = jsonvars[index].disease;
					newRow[8] = jsonvars[index].duration;
					newRow[9] = jsonvars[index].currency;
					newRow[10] = jsonvars[index].loss;
					newRow[11] = jsonvars[index].loss;
					newRow[12] = jsonvars[index].pesticide;
					newRow[13] = jsonvars[index].date;
					dtable.fnAddData(newRow); 
				}
	      		dtable.fnDraw();
		}
	});
	$.ajax({
		type		:	'GET',
		url			:	'/pulldisease',
		data		:	'',
		success		: 	function(data)
		{
			 var jsonvars				=	JSON.parse(data);
	       	 console.log("ui");
	       	 console.log(jsonvars);
	      	  	dtable = $('#datastables2').dataTable({
					"bDestroy" : true,
					"aoColumns" : [{
						"sTitle" : "Email",
						"sWidth" : "10%",
						"sClass" : "center"
					},{
						"sTitle" : "Disease",
						"sWidth" : "10%",
						"sClass" : "center"
					},{
						"sTitle" : "Duration",
						"sWidth" : "10%",
						"sClass" : "center"
					},{
						"sTitle" : "Currency",
						"sWidth" : "10%",
						"sClass" : "center"
					},{
						"sTitle" : "Loss",
						"sWidth" : "10%",
						"sClass" : "center"
					},{
						"sTitle" : "Pesticide",
						"sWidth" : "10%",
						"sClass" : "center"
					},{
						"sTitle" : "Reason",
						"sWidth" : "10%",
						"sClass" : "center"
					}]
				});
	      		dtable.fnClearTable();
	      		var newRow = [];
	      		for(index in jsonvars)
				{
					 newRow[0] = jsonvars[index].useremail;
					newRow[1] = jsonvars[index].disease;
					newRow[2] = jsonvars[index].duration;
					newRow[3] = jsonvars[index].currency;
					newRow[4] = jsonvars[index].loss;
					newRow[5] = jsonvars[index].loss;
					newRow[6] = jsonvars[index].pesticide;
					newRow[7] = jsonvars[index].date;
					dtable.fnAddData(newRow); 
				}
	      		dtable.fnDraw();
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
							
							<li class="active" style="color: white;">
								<a href="disease.jsp" style="color: white;">
									<i class="menu-icon icon-tasks"></i>
									Disease Forecasting
<!-- 									<b class="label orange pull-right">19</b> -->
								</a>
							</li>
						</ul><!--/.widget-nav-->

						<ul class="widget widget-menu unstyled">
                                <li><a href="cooperative.jsp"><i class="menu-icon icon-bold"></i> Cooperative Harvesting </a></li>
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

					</div><!--/.sidebar-->
				</div><!--/.span3-->

<div class="span9" >
                        <div class="content">
                            <div class="module">
                                <div class="module-head">
                                    <h3>
                                        Disease Forecasting 1</h3>
                                </div>
                                <div class="module-body table">
                                 <table id="datastables" cellpadding="0" cellspacing="0" border="0" class="datatable-1 table table-bordered table-striped	 display"
                                        width="100%">
                                        <thead>
                                           <tr>
		                              <th>Email</th>
		                              <th>Crop</th>
		                              <th>Location</th>
		                              <th>State</th>
		                              <th>Zip Code</th>
		                              <th>Soil Type</th>
		                              <th>Acres</th>
		                        </tr>
                                        </thead>
                                        <tbody id="dataIns">
                                           
                                        </tbody>
                                    </table></div></div></div></div>
                                    <div class="span9" >
                        <div class="content">
                            <div class="module">
                                <div class="module-head">
                                    <h3>
                                        Disease Forecasting 2</h3>
                                </div>
                                <div class="module-body table">
                                 <table id="datastables2" cellpadding="0" cellspacing="0" border="0" class="datatable-1 table table-bordered table-striped	 display"
                                        width="100%">
                                        <thead>
                                           <tr>
		                              <th>Email</th>
		                              <th>Disease</th>
		                              <th>Duration</th>
		                              <th>Currency</th>
		                              <th>Loss</th>
		                              <th>Pesticide</th>
		                              <th>Reason</th>
		                        </tr>
                                        </thead>
                                        <tbody id="dataIns">
                                           
                                        </tbody>
                                    </table></div></div></div></div>
				<div class="span9" style="margin-left:27%">
					<div class="content">

						<div class="module">
							<div class="module-head">
								<h3>List your major agro disease which you have faced</h3>
							</div>
							<div class="module-body">

									<!-- <div class="alert">
										<button type="button" class="close" data-dismiss="alert">×</button>
										<strong>Warning!</strong> Something fishy here!
									</div>
									<div class="alert alert-error">
										<button type="button" class="close" data-dismiss="alert">×</button>
										<strong>Oh snap!</strong> Whats wrong with you? 
									</div> -->
									<div class="alert alert-success" id="alertsuccess" style="display:none">
										<button type="button" class="close" data-dismiss="alert">×</button>
										<strong>Well done!</strong> Now you are listening me :) 
									</div>

									<br />

									<form class="form-horizontal row-fluid">
										<div class="control-group">
											<label class="control-label" for="basicinput">User Email</label>
											<div class="controls">
												<input type="text" id="useremail" placeholder="Email" class="span8" readonly>
<!-- 												<span class="help-inline">Minimum 5 Characters</span> -->
											</div>
										</div>
											<div class="control-group">
											<label class="control-label" for="basicinput">Crop Cultivated</label>
											<div class="controls">
											<select tabindex="1" id="cropcultivated" data-placeholder="Which crop you have cultivated ?" class="span8">
																<option value="">Which crop you have cultivated ?</option>
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
										<!-- <div class="control-group">
											<label class="control-label" for="basicinput">Crop Cultivated</label>
											<div class="controls">
												<input type="text" id="cropcultivated" placeholder="Which crop you have cultivated ?" class="span8">
											</div>
										</div> -->

										<div class="control-group">
											<label class="control-label" for="basicinput">Location</label>
											<div class="controls">
												<input data-title="Location" id="location" type="text" placeholder="Location" data-original-title="" class="span8 tip">
											</div>
										</div>
										<div class="control-group">
											<label class="control-label" for="basicinput">State, Country</label>
											<div class="controls">
												<input data-title="Location" id="state" type="text" placeholder="Enter your state, Country" data-original-title="" class="span8 tip">
											</div>
										</div>
										<div class="control-group">
											<label class="control-label" for="basicinput">Zip</label>
											<div class="controls">
												<input data-title="Location" id="zipcode" type="text" placeholder="Zip Code" data-original-title="" class="span8 tip">
											</div>
										</div>
										
										<div class="control-group">
											<label class="control-label" for="basicinput">Soil Type</label>
											<div class="controls">
											<select tabindex="1" id="soiltype" data-placeholder="Select your soil type" class="span8">
													<option value="">Select Your Soil Type..</option>
													<option value="Clay Soil">Clay Soil</option>
													<option value="Silty Soil">Silty Soil</option>
													<option value="Loamy Soil">Loamy Soil</option>
													<option value="Sandy Soil">Sandy Soil</option>
													<option value="Saline Soil">Saline Soil</option>
												</select>
											</div>
										</div>
										
										<div class="control-group">
											<label class="control-label" for="basicinput">How many acres ?</label>
											<div class="controls">
												<input data-title="Ownership" type="text" id="acrescount" placeholder="How many acres you cultivated ?" data-original-title="" class="span8 tip">
											</div>
										</div>
										
										<div class="control-group">
											<label class="control-label" for="basicinput">Type of disease affected</label>
											<div class="controls">
												<input data-title="Ownership" type="text" id="disease" placeholder="Type of disease affected" data-original-title="" class="span8 tip">
											</div>
										</div>
										
										<div class="control-group">
											<label class="control-label" for="basicinput">How long it persisted?</label>
											<div class="controls">
												<input data-title="Ownership" type="text" id="duration" placeholder="duration" data-original-title="" class="span8 tip">
											</div>
										</div>
										<div class="control-group">
											<label class="control-label" for="basicinput">Currency</label>
											<div class="controls">
												<input data-title="Ownership" type="text" id="currency" placeholder="currency" data-original-title="" class="span8 tip">
											</div>
										</div>
										<div class="control-group">
											<label class="control-label" for="basicinput">How much loss you incurred?</label>
											<div class="controls">
												<input data-title="Ownership" type="text" id="loss" placeholder="Total Loss" data-original-title="" class="span8 tip">
											</div>
										</div>
										<div class="control-group">
											<label class="control-label" for="basicinput">Pesticide used</label>
											<div class="controls">
												<input data-title="Ownership" type="text" id="pesticide" placeholder="Pesticide Used" data-original-title="" class="span8 tip">
											</div>
										</div>
										<div class="control-group">
											<label class="control-label" for="basicinput">Reason for disease</label>
											<div class="controls">
												<textarea class="span8" placeholder="Just write some lines about the reasons you know" id="reason" rows="5"></textarea>
											</div>
										</div>

										<div class="control-group">
											<div class="controls">
												<button type="button" id="submitdisease" class="btn" style="background-color: #8FF58F;color: white;">Submit </button>
											</div>
										</div>
									</form>
							</div>
						</div>

						
						
					</div><!--/.content-->
				</div><!--/.span9-->
			</div>
		</div><!--/.container-->
	</div><!--/.wrapper-->

	<div class="footer">
		<div class="container">
			 

			<b class="copyright">&copy; 2016 Razeeya.com </b> All rights reserved.
		</div>
	</div>
</body>