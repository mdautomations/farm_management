<!DOCTYPE html>
<%@page import="com.spring.SpringServlet"%>
<%@page import="com.spring.Helper"%> 
<html>
  <head>
    <meta charset="utf-8">
    <title>MD Automations Portal</title>
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
    <%--   <%
      		System.out.println("userstatus from Frontend 3:: "+session.getAttribute("userstatus"));
		  if(session.getAttribute("userstatus")!=null)
		  {
			   response.sendRedirect("/user");
		  }
	  %>  --%>
  </head>
  <body style="background:white!important">

<div id="myModal" style="display:block" class="modal fade in" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
     <div class="modal-header">
               <h2 class="text-center"><img src="/images/login.png" class="img-circle" style="height: 200px;"><br>Login</h2>
                
            </div>
            <div class="modal-body row">
                <form class="col-md-10 col-md-offset-1 col-xs-12 col-xs-offset-0">
                    <a id="login" class="btn btn-block btn-social btn-google" style="background-color: rgb(59, 137, 198);">
						    <i class="fa fa-google"></i> Sign in with Google
					  </a><br>
                </form>
            </div>
            <div class="modal-footer">
                <h6 class="text-center"><a href="">Privacy is important to us. 100% secured portal .</a></h6>
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