 <!DOCTYPE html>
<%@page import="com.spring.SpringServlet"%>
<%@page import="com.spring.Helper"%>  
<html>
  <head>
    <meta charset="utf-8">
    <title>Signup Portal</title>
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
		  	if (typeof (Storage) !== "undefined") {
		        localStorage.setItem("email",email);
		      } else {
		        window.alert('Please use a modern browser');
		      }
			if(isNewUser!=null &&  isNewUser!="false" && isNewUser!="null")
		  	{
		  		 window.location.href="/success";
		  	}	
	  </script>
  </head>
  <body style="background:white!important">
   <div id="myModal" style="display:block;height: 100%;overflow-y: auto;" class="modal fade in" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog">
         <div class="modal-header">
            <h2 class="text-center"><img src=<%=profileImage%> class="img-circle" style="height: 200px;"><br>Sign up</h2>
         </div>
         <div class="modal-body row">
            <form class="col-md-10 col-md-offset-1 col-xs-12 col-xs-offset-0">
               <div class="form-group">
                  <p style="font-size: 20px;">Email</p>
                  <br/><input type="text" readonly id="email" value=<%=emailId%> class="form-control input-lg" placeholder="Email">
               </div>
               <div class="form-group">
                  <p style="font-size: 20px;">Display Name</p>
                  <br/><input type="text" readonly id="name" value=<%=name%> class="form-control input-lg" placeholder="phone">
               </div>
               <div class="form-group">
                  <p style="font-size: 20px;">Gender</p>
                  <br/><input type="text" id="gender" readonly value=""<%=gender%> class="form-control input-lg" placeholder="gender">
               </div>
               <div class="form-group">
                  <p style="font-size: 20px;">Profession</p>
                  <br/><input type="text" id="profession" value="" class="form-control input-lg" placeholder="Profession">
               </div>
               <div class="form-group">
                  <p style="font-size: 20px;">Organization</p>
                  <br/><input type="text" id="organization" value="" class="form-control input-lg" placeholder="Organization">
               </div>
               <div class="form-group">
                  <p style="font-size: 20px;">Phone</p>
                  <br/><input type="tel" maxlength="10" id="phone" value="" class="form-control input-lg" placeholder="Phone">
               </div>
               <div id="spinner" style="display:none">
                  <center><img src="/images/load.gif" style="height: 50px;"></center>
               </div>
               <br/>
            </form>
            <div class="form-group">
               <button class="btn btn-danger btn-lg btn-block" id="signup">Sign up</button>
            </div>
         </div>
         <div class="modal-footer">
            <h6 class="text-center"><a href="">Privacy is important to us. 100% secured portal .</a></h6>
         </div>
         <!--         <div class="modal-content"> -->
         <!--         </div> -->
      </div>
   </div>
   <!--scripts loaded here-->
   
 <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/scripts.js"></script>
    <script src="js/action.js"></script>
    <script src="js/validations.js"></script>
</body>
</html> 