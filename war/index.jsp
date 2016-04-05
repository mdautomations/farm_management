<!DOCTYPE html>
<%@page import="com.spring.SpringServlet"%>
<%@page import="com.spring.Helper"%> 
<html>
  <head>
    <meta charset="utf-8">
    <title>Login Portal</title>
    <meta name="description" content="This one page example has a fixed navbar and full page height sections. Each section is vertically centered on larger screens, and then stack responsively on smaller screens. Scrollspy is used to activate the current menu item. This layout also has a contact form example. Uses animate.css, FontAwesome, Google Fonts (Lato and Bitter) and Bootstrap." />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="generator" content="Codeply">

    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <link rel="stylesheet" href="css/bootstrap.social.css" />
    <link href="css/font-awesome.min.css" rel="stylesheet" />
    <link href="css/animate.min.css" rel="stylesheet" />

    <link rel="stylesheet" href="css/styles.css" />
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
         	/* System.out.println("userstatus from Frontend :: "+(String)session.getAttribute("userstatus"));
      		System.out.println("isNewUser from Frontend :: "+(String)session.getAttribute("isNewUser"));
		  if((String)session.getAttribute("userstatus")==null || (String)session.getAttribute("userstatus")=="" || session.getAttribute("userstatus").toString().length()==0)
		  {
			  System.out.println("comes inside loop ass :: "+(String)session.getAttribute("userstatus"));
			  if(session.getAttribute("isNewUser")=="true")
			  {
				  response.sendRedirect("/signup");
			  }
			  else
			  {
				  response.sendRedirect("/login");
			  }
		  }
		  else
		  {
			  response.sendRedirect("http://bhavani-web.appspot.com/");
		  } */
	  %> 
  </head>
  <body>
<section class="container-fluid" id="section1">
    <div class="v-center">
      <h1 class="text-center" style="margin-top: -11%;margin-left: -61%;"><img src="images/logo.png" style="height: 172px;width: auto;"></h1>
<!--         <h2 class="text-center lato animate slideInDown">Highly Encrypted Zone. Please do not try to intrude.</h2> -->
        <p class="text-center" style="margin-top: 20%; margin-left: 1%;">
            <br>
            <a href="#" class="btn btn-danger btn-lg btn-huge lato" data-toggle="modal" data-target="#myModal">Access Portal</a>
        </p>
    </div>
    <a href="#section2">
		<div class="scroll-down bounceInDown animated">
            <span>
                <i class="fa fa-angle-down fa-2x"></i>
            </span>
		</div>
        </a>
</section>

<section class="container-fluid" id="section2">
    <div class="container v-center">
        <div class="row">
            <div class="col-sm-4">
                <div class="row">
                    <div class="col-sm-12 text-center">
                        <div class="panel panel-default slideInLeft animate">
                            <div class="panel-heading">
                            <h3>Project Profile</h3></div>
                            <div class="panel-body">
                                <p>Have a start with new project. Just spend few minutes to fill the details.</p>
                               <a href="#" class="btn btn-danger btn-lg btn-huge lato" data-toggle="modal" data-target="#myModal" style="font-size: small;  width: 100%;">Configure</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-4 text-center">
                <div class="row">
                    <div class="col-sm-12 text-center">
                        <div class="panel panel-default slideInUp animate">
                            <div class="panel-heading">
                            <h3>Accounts Maintainance</h3></div>
                            <div class="panel-body">
                                <p>Do not miss any transactions ! Keep track of all the transactions.</p>
                               <a href="#" class="btn btn-danger btn-lg btn-huge lato" data-toggle="modal" data-target="#myModal" style=" font-size: small;  width: 100%;">Configure</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-4 text-center">
                <div class="row">
                    <div class="col-sm-12 text-center">
                        <div class="panel panel-default slideInRight animate">
                            <div class="panel-heading">
                            <h3>Manage Timeline</h3></div>
                            <div class="panel-body">
                                <p>Keep track of nearer due dates of project delivery with this secured portal</p>
                               <a href="#" class="btn btn-danger btn-lg btn-huge lato" data-toggle="modal" data-target="#myModal" style="
    font-size: small;
    width: 100%;
">Configure</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--/row-->
        <div class="row">
            <br>
        </div>
    </div>
    <!--/container-->
</section>
<footer id="footer">
    <div class="container">
        <!--/row-->
        <img src="images/logo.png" style="height: 50px;width: auto;">
    </div>
</footer>

<div class="scroll-up">
	<a href="#"><i class="fa fa-angle-up"></i></a>
</div>

<div id="myModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
               <h2 class="text-center"><img src="/images/login.png" class="img-circle" style="height: 200px;"><br>Login</h2>
                
            </div>
            <div class="modal-body row">
                <form class="col-md-10 col-md-offset-1 col-xs-12 col-xs-offset-0">
                    <a id="login" class="btn btn-block btn-social btn-google" style="background-color: rgb(59, 137, 198);">
						    <i class="fa fa-google"></i> Sign in with Google
					  </a><br>
					    <a class="btn btn-block btn-social btn-google">
						    <i class="fa fa-google"></i> Not an Existing user ? Sign up here
					  </a><br>
                </form>
                <form class="col-md-10 col-md-offset-1 col-xs-12 col-xs-offset-0">
                    <div class="form-group">
                        <input type="text" class="form-control input-lg" placeholder="Email">
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control input-lg" placeholder="Password">
                    </div>
                    <div class="form-group">
                        <button class="btn btn-danger btn-lg btn-block">Sign In</button>
                        <span class="pull-right"><a href="#">Register</a></span><span><a href="#">Need help?</a></span>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <h6 class="text-center"><a href="">Privacy is important to us. 100% secured portal .</a></h6>
            </div>
        </div>
    </div>
</div>
<div id="myModal1" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
               <h2 class="text-center"><img src="/images/login.png" class="img-circle" style="height: 200px;"><br>Login</h2>
            </div>
            <div class="modal-body row">
                <form class="col-md-10 col-md-offset-1 col-xs-12 col-xs-offset-0">
                    <a id="login" class="btn btn-block btn-social btn-google" style="background-color: rgb(59, 137, 198);">
						    <i class="fa fa-google"></i> Sign in with Google
					  </a><br>
					    <a class="btn btn-block btn-social btn-google">
						    <i class="fa fa-google"></i> Not an Existing user ? Sign up here
					  </a><br>
                </form>
                <form class="col-md-10 col-md-offset-1 col-xs-12 col-xs-offset-0">
                    <div class="form-group">
                        <input type="text" class="form-control input-lg" placeholder="Email">
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control input-lg" placeholder="Password">
                    </div>
                    <div class="form-group">
                        <button class="btn btn-danger btn-lg btn-block">Sign In</button>
                        <span class="pull-right"><a href="#">Register</a></span><span><a href="#">Need help?</a></span>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <h6 class="text-center"><a href="">Privacy is important to us. 100% secured portal .</a></h6>
            </div>
        </div>
    </div>
</div>
    <!--scripts loaded here-->
    
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    
    <script src="js/scripts.js"></script>
    <script src="js/action.js"></script>
  </body>
</html>