<%-- <!DOCTYPE HTML>
<%@page import="com.spring.SpringServlet"%>
<%@page import="com.spring.Helper"%>  
<html>
<head>
<title>MD Automations</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="assets/css/main.css" />
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
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
    	System.out.println("userstatus from Frontend 2 :: "+session.getAttribute("userstatus"));
		  if(session.getAttribute("userstatus")==null)
		  {
			   response.sendRedirect("/login");
		  }
			    String userKey  = (String)session.getAttribute("userkey");
				String emailId = (String) session.getAttribute("email");
				String name = (String) session.getAttribute("name");
				String gender = (String) session.getAttribute("gender");
				String profession = (String) session.getAttribute("profession");
				String phone = (String) session.getAttribute("phone");
				String organization = (String) session.getAttribute("organization");
				String profileImage = (String) session.getAttribute("profilepic");
		  
	  %>
</head>
<body>

	<!-- Header -->
	<div id="header">

		<div class="top">

			<!-- Logo -->
			<div id="logo">
				<span class="image avatar48"><img src=<%=profileImage%> alt="" /></span>
				<h1 id="title"><%=name%></h1>
				<p><%=profession%>-<%=organization%>.</p>
			</div>

			<!-- Nav -->
			<nav id="nav">
				<ul>
					<li><a href="#top" id="top-link" class="skel-layers-ignoreHref"><span class="icon fa-home">Intro</span></a></li>
					<li><a href="#project-setup" id="portfolio-link" class="skel-layers-ignoreHref"><span class="icon fa-th">Project Setup</span></a></li>
					<li><a href="#request" id="portfolio-link" class="skel-layers-ignoreHref"><span class="icon fa-th">Request Project Manager</span></a></li>
					<li><a href="#storage" id="about-link" class="skel-layers-ignoreHref"><span class="icon fa-user">File Storage </span></a></li>
					<li><a href="#contact" id="contact-link" class="skel-layers-ignoreHref"><span class="icon fa-envelope">Contact</span></a></li>
					<li><a href="/logout" id="contact-link" class="skel-layers-ignoreHref"><span class="icon fa-envelope">Logout</span></a></li>
				</ul>
			</nav>

		</div>

		<div class="bottom">

			<!-- Social Icons -->
			<ul class="icons">
				<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
				<li><a href="#" class="icon fa-facebook"><span
						class="label">Facebook</span></a></li>
				<li><a href="#" class="icon fa-github"><span class="label">Github</span></a></li>
				<li><a href="#" class="icon fa-dribbble"><span
						class="label">Dribbble</span></a></li>
				<li><a href="#" class="icon fa-envelope"><span
						class="label">Email</span></a></li>
			</ul>

		</div>

	</div>

	<!-- Main -->
	<div id="main">

		<!-- Intro -->
		<section id="top" class="one dark cover">
			<div class="container">

				<header>
					<h2 class="alt">
						Welcome to <strong><%=name%>'s</strong> page of project portal ! 
					</h2>
					<p>
						This is purely personal and highly secured. Your data's are retrived from cloud.
					</p>
				</header>

				<footer>
					<a href="#project-setup" class="button scrolly"  style="font-size: 15px;">Project Setup</a>
					<a href="#payment" class="button scrolly"  style="font-size: 15px;">Make Payment</a>
				</footer>

			</div>
		</section>

		<!-- Portfolio -->
		<section id="project-setup" class="two">
			<div class="container">

				<header>
					<h2>Android based vehicle theft system</h2>
					
				</header>

				<form method="post" action="#">
					<div class="row">
						<div class="6u 12u$(mobile)">
							<input type="text" name="project ID" placeholder="Project ID"  style="font-size: 15px;"/>
						</div>
						<div class="6u$ 12u$(mobile)">
							<input type="text" name="title" placeholder="Domain"  style="font-size: 15px;" />
						</div>
						<div class="6u 12u$(mobile)">
							<input type="text" name="totalcost" placeholder="Total Cost"  style="font-size: 15px;"/>
						</div>
						<div class="6u$ 12u$(mobile)">
							<input type="text" name="undertaken" placeholder="Undertaken Date"  style="font-size: 15px;"/>
						</div>
						<div class="6u 12u$(mobile)">
							<input type="text" name="duedate" placeholder="Due Date"  style="font-size: 15px;"/>
						</div>
						<div class="6u$ 12u$(mobile)">
							<input type="text" name="paymentdue" placeholder="Payment Due"  style="font-size: 15px;" />
						</div>
						<div class="12u$">
							<textarea name="message" placeholder="Notes about the project"  style="font-size: 15px;"></textarea>
						</div>
						<div class="12u$">
							<input type="submit" value="Commit Project"  style="font-size: 15px;"/>
						</div>
					</div>
				</form>

			</div>
		</section>

		<!-- About Me -->
		<section id="request" class="three">
			<div class="container">

				<header>
					<h2>Send your request to project manager</h2>
				</header>
				<div id="messages" style="max-height: 500px;overflow-y: auto;">
				<ul class="copyright" style="margin-left: 7.5em;">
						<li>
						   <div class="pull-left">
						   <img src="https://lh4.googleusercontent.com/-5LCThSHq5n8/AAAAAAAAAAI/AAAAAAAAAKg/5-xSPFjehjw/photo.jpg" alt="" style="height: 64px;">
						   </div>
						   <div class="rep_msg_content">
						      <h5 style="margin-left: 8%;font-size: 17px;color: rgb(0, 197, 232);float: left;"><a>Sathyanarayanan Anbu</a>
						       <span class="pull-right time-stamp" style="margin-left: 2em;color: black;">18 Oct 2014 03:01 PM</span>
						       </h5>
						       <br>
						     <p style="font-size: 18px;">HI ! Testing Message</p>
						   </div>
						</li>
				</ul>
				<div class="horizontalRule"></div>
				<ul class="copyright" style="margin-left: 7.5em;">
						<li>
						   <div class="pull-left">
						   <img src="https://lh4.googleusercontent.com/-5LCThSHq5n8/AAAAAAAAAAI/AAAAAAAAAKg/5-xSPFjehjw/photo.jpg" alt="" style="height: 64px;">
						   </div>
						   <div class="rep_msg_content">
						      <h5 style="margin-left: 8%;font-size: 17px;color: rgb(0, 197, 232);float: left;"><a>Sathyanarayanan Anbu</a>
						       <span class="pull-right time-stamp" style="margin-left: 2em;color: black;">18 Oct 2014 03:01 PM</span>
						       </h5>
						       <br>
						     <p style="font-size: 18px;">HI ! Testing Message</p>
						   </div>
						</li>
				</ul>
				<div class="horizontalRule"></div>
				
					<ul class="copyright" style="margin-left: 7.5em;">
							<li>
							   <div class="pull-left">
							   <img src="https://lh4.googleusercontent.com/-5LCThSHq5n8/AAAAAAAAAAI/AAAAAAAAAKg/5-xSPFjehjw/photo.jpg" alt="" style="height: 64px;">
							   </div>
							   <div class="rep_msg_content">
							      <h5 style="margin-left: 8%;font-size: 17px;color: rgb(0, 197, 232);float: left;"><a>Sathyanarayanan Anbu</a>
							       <span class="pull-right time-stamp" style="margin-left: 2em;color: black;">18 Oct 2014 03:01 PM</span>
							       </h5>
							       <br>
							     <p style="font-size: 18px;">HI ! Testing Message</p>
							   </div>
							</li>
					</ul>
					<div class="horizontalRule"></div>
				
					<ul class="copyright" style="margin-left: 7.5em;">
							<li>
							   <div class="pull-left">
							   <img src="https://lh4.googleusercontent.com/-5LCThSHq5n8/AAAAAAAAAAI/AAAAAAAAAKg/5-xSPFjehjw/photo.jpg" alt="" style="height: 64px;">
							   </div>
							   <div class="rep_msg_content">
							      <h5 style="margin-left: 8%;font-size: 17px;color: rgb(0, 197, 232);float: left;"><a>Sathyanarayanan Anbu</a>
							       <span class="pull-right time-stamp" style="margin-left: 2em;color: black;">18 Oct 2014 03:01 PM</span>
							       </h5>
							       <br>
							     <p style="font-size: 18px;">HI ! Testing Message</p>
							   </div>
							</li>
					</ul>
					<div class="horizontalRule"></div>
				
					<ul class="copyright" style="margin-left: 7.5em;">
							<li>
							   <div class="pull-left">
							   <img src="https://lh4.googleusercontent.com/-5LCThSHq5n8/AAAAAAAAAAI/AAAAAAAAAKg/5-xSPFjehjw/photo.jpg" alt="" style="height: 64px;">
							   </div>
							   <div class="rep_msg_content">
							      <h5 style="margin-left: 8%;font-size: 17px;color: rgb(0, 197, 232);float: left;"><a>Sathyanarayanan Anbu</a>
							       <span class="pull-right time-stamp" style="margin-left: 2em;color: black;">18 Oct 2014 03:01 PM</span>
							       </h5>
							       <br>
							     <p style="font-size: 18px;">HI ! Testing Message</p>
							   </div>
							</li>
					</ul>
					<div class="horizontalRule"></div>
				
					<ul class="copyright" style="margin-left: 7.5em;">
							<li>
							   <div class="pull-left">
							   <img src="https://lh4.googleusercontent.com/-5LCThSHq5n8/AAAAAAAAAAI/AAAAAAAAAKg/5-xSPFjehjw/photo.jpg" alt="" style="height: 64px;">
							   </div>
							   <div class="rep_msg_content">
							      <h5 style="margin-left: 8%;font-size: 17px;color: rgb(0, 197, 232);float: left;"><a>Sathyanarayanan Anbu</a>
							       <span class="pull-right time-stamp" style="margin-left: 2em;color: black;">18 Oct 2014 03:01 PM</span>
							       </h5>
							       <br>
							     <p style="font-size: 18px;">HI ! Testing Message</p>
							   </div>
							</li>
					</ul>
					<div class="horizontalRule"></div>
				
					<ul class="copyright" style="margin-left: 7.5em;">
							<li>
							   <div class="pull-left">
							   <img src="https://lh4.googleusercontent.com/-5LCThSHq5n8/AAAAAAAAAAI/AAAAAAAAAKg/5-xSPFjehjw/photo.jpg" alt="" style="height: 64px;">
							   </div>
							   <div class="rep_msg_content">
							      <h5 style="margin-left: 8%;font-size: 17px;color: rgb(0, 197, 232);float: left;"><a>Sathyanarayanan Anbu</a>
							       <span class="pull-right time-stamp" style="margin-left: 2em;color: black;">18 Oct 2014 03:01 PM</span>
							       </h5>
							       <br>
							     <p style="font-size: 18px;">HI ! Testing Message</p>
							   </div>
							</li>
					</ul>
					<div class="horizontalRule"></div>
				
					<ul class="copyright" style="margin-left: 7.5em;">
							<li>
							   <div class="pull-left">
							   <img src="https://lh4.googleusercontent.com/-5LCThSHq5n8/AAAAAAAAAAI/AAAAAAAAAKg/5-xSPFjehjw/photo.jpg" alt="" style="height: 64px;">
							   </div>
							   <div class="rep_msg_content">
							      <h5 style="margin-left: 8%;font-size: 17px;color: rgb(0, 197, 232);float: left;"><a>Sathyanarayanan Anbu</a>
							       <span class="pull-right time-stamp" style="margin-left: 2em;color: black;">18 Oct 2014 03:01 PM</span>
							       </h5>
							       <br>
							     <p style="font-size: 18px;">HI ! Testing Message</p>
							   </div>
							</li>
					</ul>
					<div class="horizontalRule"></div>
				
					<ul class="copyright" style="margin-left: 7.5em;">
							<li>
							   <div class="pull-left">
							   <img src="https://lh4.googleusercontent.com/-5LCThSHq5n8/AAAAAAAAAAI/AAAAAAAAAKg/5-xSPFjehjw/photo.jpg" alt="" style="height: 64px;">
							   </div>
							   <div class="rep_msg_content">
							      <h5 style="margin-left: 8%;font-size: 17px;color: rgb(0, 197, 232);float: left;"><a>Sathyanarayanan Anbu</a>
							       <span class="pull-right time-stamp" style="margin-left: 2em;color: black;">18 Oct 2014 03:01 PM</span>
							       </h5>
							       <br>
							     <p style="font-size: 18px;">HI ! Testing Message</p>
							   </div>
							</li>
					</ul>
					<div class="horizontalRule"></div>
				
					<ul class="copyright" style="margin-left: 7.5em;">
							<li>
							   <div class="pull-left">
							   <img src="https://lh4.googleusercontent.com/-5LCThSHq5n8/AAAAAAAAAAI/AAAAAAAAAKg/5-xSPFjehjw/photo.jpg" alt="" style="height: 64px;">
							   </div>
							   <div class="rep_msg_content">
							      <h5 style="margin-left: 8%;font-size: 17px;color: rgb(0, 197, 232);float: left;"><a>Sathyanarayanan Anbu</a>
							       <span class="pull-right time-stamp" style="margin-left: 2em;color: black;">18 Oct 2014 03:01 PM</span>
							       </h5>
							       <br>
							     <p style="font-size: 18px;">HI ! Testing Message</p>
							   </div>
							</li>
					</ul>
					
					<div class="horizontalRule"></div>
				
					<ul class="copyright" style="margin-left: 7.5em;">
							<li>
							   <div class="pull-left">
							   <img src="https://lh4.googleusercontent.com/-5LCThSHq5n8/AAAAAAAAAAI/AAAAAAAAAKg/5-xSPFjehjw/photo.jpg" alt="" style="height: 64px;">
							   </div>
							   <div class="rep_msg_content">
							      <h5 style="margin-left: 8%;font-size: 17px;color: rgb(0, 197, 232);float: left;"><a>Sathyanarayanan Anbu</a>
							       <span class="pull-right time-stamp" style="margin-left: 2em;color: black;">18 Oct 2014 03:01 PM</span>
							       </h5>
							       <br>
							     <p style="font-size: 18px;">HI ! Testing Message</p>
							   </div>
							</li>
					</ul>
					<div class="horizontalRule"></div>
				
					<ul class="copyright" style="margin-left: 7.5em;">
							<li>
							   <div class="pull-left">
							   <img src="https://lh4.googleusercontent.com/-5LCThSHq5n8/AAAAAAAAAAI/AAAAAAAAAKg/5-xSPFjehjw/photo.jpg" alt="" style="height: 64px;">
							   </div>
							   <div class="rep_msg_content">
							      <h5 style="margin-left: 8%;font-size: 17px;color: rgb(0, 197, 232);float: left;"><a>Sathyanarayanan Anbu</a>
							       <span class="pull-right time-stamp" style="margin-left: 2em;color: black;">18 Oct 2014 03:01 PM</span>
							       </h5>
							       <br>
							     <p style="font-size: 18px;">HI ! Testing Message</p>
							   </div>
							</li>
					</ul>
				</div>
				<div class="horizontalRule"></div>
				<div id="text_Area" class="textarea_holder row-fluid">
				<textarea id="text-Content" placeholder="Leave your message to ..." class="unfocus" style="
    width: 22em;
    margin-left: -8.1em;
    font-size: 20px;
"></textarea><br>
<input type="button" value="Commit Project" style="font-size: 10px;margin-left: 17em;">
				</div>
			</div>
		</section>
		

		<!-- Contact -->
		<section id="storage" class="four">
			<div class="container">

				<header>
					<h2>Make Payment</h2>
				</header>


			</div>
		</section>

	</div>

	<!-- Footer -->
	<div id="footer">

		<!-- Copyright -->
		<ul class="copyright">
			<li>&copy; Untitled. All rights reserved.</li>
			<li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
		</ul>

	</div>

	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<script src="assets/js/jquery.scrollzer.min.js"></script>
	<script src="assets/js/skel.min.js"></script>
	<script src="assets/js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="assets/js/main.js"></script>
	<script type="text/javascript" src="js/jquery.dataTables.min.js" ></script>

</body>
</html> --%>