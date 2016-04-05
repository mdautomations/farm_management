$(document).ready(function () 
{
	if(document.URL.indexOf("new-register")!=-1)
    {
    	 var target = "/new-registration";
    	$("#overlay").load(target, function() {
            $("#overlay").addClass("active");
            $("#overlay").addClass("transition");
            $('body').addClass('no-scroll');
        });
    }
		var isregistered = cookie.getValue('isregistered');
		var pathname = document.location.pathname;
		if(pathname.indexOf('/new-tour')!=-1){
			$('.tourpage').addClass('active');
		}
		else if(pathname.indexOf('/new-people')!=-1){
			$('.peoplepage').addClass('active');
		}
		else if(pathname.indexOf('/new-why')!=-1){
			$('.whypage').addClass('active');
		}
		if(isregistered!=null && isregistered.length>0 && isregistered=="true"){
			var signupLink      = 	cookie.getValue('signupLink');
			var clientEmail     = 	cookie.getValue('clientEmail');
			var clientCompany   = 	cookie.getValue('clientCompany');
			var demoNumber      = 	cookie.getValue('demoNumber');
			$('.triggerRegister').attr('href',signupLink);
			$('.triggerRegister').removeClass('triggerRegister');
			$('#clientCompany').html("Call to hear us live answer as<br/>"+clientCompany);
			$('#demoNumber').html(demoNumber);
			$('#demoNumber').attr('href',demoNumber);
			$('#clientEmail').html(clientEmail);
		}
		operations.attachHandlers();
});
var operations = 
{
	register			:			function(){
									var 		email 		=	 	"";
									var 		company 	= 		"";
									var 		phone 		= 		"";
									var 		name 		= 		"";
									try 
									{
									      email 			= 		$.trim($('#email').val());
									      company 			= 		$.trim($('#company').val());
									      phone 			= 		$.trim($('#phone').val());
									      name 				= 		$.trim($('#name').val());
									      if(!validate.validateEmail(email) || !validate.validateField(company) || !validate.validateField(name) || !validate.validatePhone(phone))
									      {
										    	  if(!validate.validateEmail(email)){$('#email').addClass('error');}
										    	  if(!validate.validateField(company)){$('#company').addClass('error');}
										    	  if(!validate.validatePhone(phone)){$('#phone').addClass('error');}
										    	  if(!validate.validateField(name)){$('#name').addClass('error');}
									      }
									      else
									      {
									    	  		if(!$('.field').hasClass('error')){
									    	  			$('#register_btn').addClass('spinner');
									    	  			$.ajax({
									    	  					type		:	'POST',
									    	  					url			:	'new-home/answerconnect_web',
									    	  					data		:	{fullName : name,company:company,email:email,phone:phone},
									    	  					success		: 	function(data)
									    	  					{
									    	  					   var jsonvar = JSON.parse(data);
									    	  					   console.log(jsonvar);
													        	   cookie.setWithExpDays("signupLink",jsonvar.signUpurl);
													        	   cookie.setWithExpDays("demoNumber",jsonvar.demoNumber);
													        	   cookie.setWithExpDays("isregistered","true");
													        	   cookie.setWithExpDays("clientEmail",email);
													        	   cookie.setWithExpDays("clientCompany",company);
													        	   cookie.setWithExpDays("uniquePin",jsonvar.uniquepin);
													        	   window.location.href="/new-thankyou";
									    	  					}
									    	  			});
									    	  		}
									     }
									}
									catch(err){console.error(err);} 
								},
		attachHandlers			:  function(){
										$(document).on("click", "#register_btn", function(e){
											operations.register();
										});
										$(document).on("click", "#livechat", function(e){
											$conversion.startChat();
										});
										
										$(document).on("keyup", "#company", function(e){$('#company').removeClass('error');});
										$(document).on("keyup", "#name", function(e){$('#name').removeClass('error');});
										$(document).on("keyup", "#email", function(e){$('#email').removeClass('error');});
										$(document).on("keyup", "#phone", function(e){$('#phone').removeClass('error');});
										
										$(document).on("blur", "#company", function(e){
												var companyname 			= 		$.trim($('#company').val());
												if(validate.validateField(companyname)){
													$('#company').removeClass('error');
													$('#company').addClass('success');
												}
												else{
													$('#company').addClass('error');
													$('#company').removeClass('success');
												}
										});
										$(document).on("blur", "#name", function(e){
											var name 					= 		$.trim($('#name').val());
											if(validate.validateField(name)){
												$('#name').removeClass('error');
												$('#name').addClass('success');
											}
											else{
												$('#name').addClass('error');
												$('#name').removeClass('success');
											}
										});
										$(document).on("blur", "#email", function(event){
											var email 			= 		$.trim($('#email').val());
											if(validate.validateEmail(email)){
												$('#email').addClass('success');
												$('#email').removeClass('error');
											}
											else{
												$('#email').addClass('error');
												$('#email').removeClass('success');					
											}
										});
										$(document).on("keydown", "#phone", function(e)
										{
											if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190]) !== -1 ||  (e.keyCode == 65 && e.ctrlKey === true) ||  (e.keyCode >= 35 && e.keyCode <= 40)){ 
												if(e.keyCode == 13){
													$('#register_btn').click();
												}
											}
											else if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)){ 
												e.preventDefault();
											}
										});
										$(document).on("blur", "#phone", function(e)
										{
											var phone 			= 		$.trim($('#phone').val());
											if(validate.validatePhone(phone)){
												$('#phone').addClass('success');
												$('#phone').removeClass('error');						
											}
											else{
												$('#phone').addClass('error');
												$('#phone').removeClass('success');
											}
										});
								   }
};
		
