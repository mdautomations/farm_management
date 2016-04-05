<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Graph Database</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link rel="stylesheet" href="../../bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <link rel="stylesheet" href="../../dist/css/AdminLTE.min.css">
    <link rel="stylesheet" href="../../plugins/iCheck/square/blue.css">
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
				String 		gender 			= 		(String) session.getAttribute("gender");
				String 		profession 		= 		(String) session.getAttribute("profession");
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
// 		  	alert("new user :: "+isNewUser);
		  	debugger;
		  	if(isNewUser!=null &&  isNewUser!="false" && isNewUser!="null")
		  	{
		  		window.location.href="/success";
		  	}	
	  </script>
  </head>
  <body class="hold-transition login-page">
    <div class="login-box">
      <div class="login-logo">
        <a href="../../index2.html"><b>Simillarity</b>Matching</a>
      </div><!-- /.login-logo -->
      <div class="login-box-body">
        <p class="login-box-msg">Sign in to start your session</p>
        <form action="../../index2.html" method="post">
          <div class="form-group has-feedback">
            <input type="email" class="form-control" readonly placeholder="Email (option currently disabled)">
            <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
          </div>
          <div class="form-group has-feedback">
            <input type="password" class="form-control" readonly placeholder="Password (option currently disabled)">
            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
          </div>
          
        </form>

        <div class="social-auth-links text-center">
          <p>- OR -</p>
          <a id="login"  class="btn btn-block btn-social btn-google btn-flat"><i class="fa fa-google-plus"></i> Sign in using Google</a>
        </div>

        <a href="register.html" class="text-center"><center>Register a new membership</center></a>

      </div>
    </div>

    <script src="../../plugins/jQuery/jQuery-2.1.4.min.js"></script>
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <script src="../../plugins/iCheck/icheck.min.js"></script>
    <script>
      $(function () {
        $('input').iCheck({
          checkboxClass: 'icheckbox_square-blue',
          radioClass: 'iradio_square-blue',
          increaseArea: '20%' // optional
        });
      });
    </script>
     <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/scripts.js"></script>
    <script src="js/action.js"></script>
  </body>
</html>
