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
	 <script type="text/javascript">
		  function cache()
		  {
		    <%   
		     response.setHeader("Cache-Control","no-cache");   
		     response.setHeader("Cache-Control","no-store");   
		     response.setDateHeader("Expires", 0);   
		     response.setHeader("Pragma","no-cache");
		     %> 
		  }
    </script>
      <%
			    String 		userKey  			= 		(String)session.getAttribute("userkey");
				String 		emailId 			= 		(String) session.getAttribute("email");
				String 		name 				= 		(String) session.getAttribute("name");
				String 		gender 				= 		(String) session.getAttribute("gender");
				String 		profession 			= 		(String) session.getAttribute("profession");
				String 		phone 				= 		(String) session.getAttribute("phone");
				String		organization 	= 		(String) session.getAttribute("organization");
				String 		profileImage 	= 		(String) session.getAttribute("profilepic");
				String       isNewUser		=		(String) session.getAttribute("isNewUser");
				if(gender==""||gender==null||"".equalsIgnoreCase(gender))
			  	{
			  		gender = "";
			  	}
			  	if(profileImage==""||profileImage==null||"".equalsIgnoreCase(profileImage))
			  	{
			  		profileImage = "";
			  	}
	  %>
	  <script>
		  	var 	email					=		'<%=emailId%>';
		  	var 	name					=   	'<%=name%>';
		  	var 	gender					=		'<%=gender%>';
		  	var 	profileImage		=		'<%=profileImage%>';
		  	var isNewUser			=		'<%=isNewUser%>';
		  	if(gender==''||gender==null||gender.length==0)
		  	{
		  		gender = "";
		  	}
		  	if(profileImage==''||profileImage==null||profileImage.length==0)
		  	{
		  		profileImage = "";
		  	}
		  	if (typeof (Storage) !== "undefined") {
		        localStorage.setItem("email",email);
		      } else {
		        window.alert('Please use a modern browser');
		      }
			if(isNewUser!=null &&  isNewUser!="null")
		  	{
		  		 window.location.href="/success";
		  	}	
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
				
					<ul class="nav pull-right">

						<li><a href="#">
							Sign Up
						</a></li>

						

						<li><a href="#">
							Forgot your password?
						</a></li>
					</ul>
				</div><!-- /.nav-collapse -->
			</div>
		</div><!-- /navbar-inner -->
	</div><!-- /navbar -->



	<div class="wrapper">
		<div class="container" style="background-image: url(agriculture.jpg); background-repeat: no-repeat;  background-attachment: fixed; background-position: center;">
			<div class="row">
				<div class="module module-login span4 offset4">
					<form class="form-vertical">
						<div class="module-head">
							<h3>Sign In</h3>
						</div>
						<div class="module-body">
							<div class="control-group">
								<div class="controls row-fluid">
									<input class="span12" type="text" id="inputEmail" placeholder="Username (Option Currently Disabled)" readonly>
								</div>
							</div>
							<div class="control-group">
								<div class="controls row-fluid">
									<input class="span12" type="password" id="inputPassword" placeholder="Password (Option Currently Disabled)" readonly>
								</div>
							</div>
							<div class="control-group">
								<div class="controls row-fluid">
								<button type="button" class="btn btn-primary" id="login" style="width: 100%;background-color: red;border-color: white;font-size: 15px;">Login with Google</button>
								</div>
							</div>
							
						</div>
						<div class="module-foot">
							<div class="control-group">
								<div class="controls clearfix">
									<button type="button" class="btn btn-primary pull-right">Login</button>
									<label class="checkbox">
<!-- 										<input type="checkbox"> Remember me -->
									</label>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div><!--/.wrapper-->

	<div class="footer">
		<div class="container">
			 

			<b class="copyright">&copy; 2016 Razeeya.com </b> All rights reserved.
		</div>
	</div>
	<script src="scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
	<script src="scripts/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>
	<script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	 <script src="js/action.js"></script>
</body>