$(document).ready(function () 
{
	operations.attachHandlers();
});
		var operations = 
		{
			register			:			function(){
											var 		phone 				= 		"";
											var 		profession 			= 		"";
											var 		organization		=		"";
											var 		email				=		"";
											var 		gender				=		"";
											var 		name				=		"";
											try 
											{
											      phone 			= 		$.trim($('#phone').val());
											      profession 		= 		$.trim($('#profession').val());
											      organization		=		$.trim($('#organization').val());
											      name				=		$.trim($('#name').val());
											      email				=		$.trim($('#email').val());
											      gender			=		$.trim($('#gender').val());
											      if(!validate.validateField(profession) || !validate.validateField(organization) || !validate.validatePhone(phone))
											      {
												    	  if(!validate.validateField(profession)){$('#profession').addClass('error');}
												    	  if(!validate.validatePhone(phone)){$('#phone').addClass('error');}
												    	  if(!validate.validateField(organization)){$('#organization').addClass('error');}
											      }
											      else
											      {
											    	  		if(!$('.input-lg').hasClass('error')){
											    	  			$('#spinner').show();
											    	  			$.ajax({
											    	  					type		:	'GET',
											    	  					url			:	'/register',
											    	  					data		:	{name : name,organization:organization,email:email,phone:phone,profession:profession,gender:gender},
											    	  					success		: 	function(data)
											    	  					{
											    	  						console.log(data);
											    	  						window.location.href = "/success";
											    	  						
											    	  					}
											    	  			});
											    	  		}
											     }
											}
											catch(err){console.error(err);} 
										},
				collaborate				:	function()
				{
					var 		useremail 			= 		"";
					var 		partner 			= 		"";
					try
					{
						if (typeof (Storage) !== "undefined") {
							useremail= localStorage.getItem("email");
					      } else {
					        window.alert('Please use a modern browser');
					      }
						partner = $.trim($('#cooperate').val());
						if(partner.length>0 && validate.validateEmail(partner))
						{
							$.ajax({
	    	  					type		:	'GET',
	    	  					url			:	'/collborate',
	    	  					data		:	{useremail : useremail,partner:partner},
	    	  					success		: 	function(data)
	    	  					{
	    	  						alert("Request sent for approval to "+partner);
	    	  					}
							});
						}
						else
						{
							alert("Please enter valid partner email");
						}
						
					}
					catch(err)
					{
						console.error(err);
					}
				},
				updatecomments 		:	function()
				{
					var comments = "";
					try
					{
						comments = $('#usercomment').val();
						$.ajax({
    	  					type		:	'GET',
    	  					url			:	'/storecomments',
    	  					data		:	{useremail : useremail,comments:comments},
    	  					success		: 	function(data)
    	  					{
    	  						alert("Thanks for posting your comments");
    	  					}
						});
					}
					catch(err)
					{
						console.error(err);
					}
				},
				disease				:	function()
				{
					var 		useremail 			= 		"";
					var 		cropcultivated 		= 		"";
					var 		location 			= 		"";
					var 		state 				= 		"";
					var 		zipcode 			= 		"";
					var 		soiltype 			= 		"";
					var 		acrescount 			= 		"";
					var 		disease 			= 		"";
					var 		duration 			= 		"";
					var 		currency 			= 		"";
					var 		loss 				= 		"";
					var 		pesticide 			= 		"";
					var 		reason 				= 		"";
					
					try
					{
						 		useremail 			= 		$('#useremail').val();
						 		cropcultivated 		= 		$('#cropcultivated').val();
						 		location 			= 		$('#location').val();
						 		state 				= 		$('#state').val();
						 		zipcode 			= 		$('#zipcode').val();
						 		soiltype 			= 		$('#soiltype').val();
						 		acrescount 			= 		$('#acrescount').val();
						 		disease 			= 		$('#disease').val();
						 		duration 			= 		$('#duration').val();
						 		currency 			= 		$('#currency').val();
						 		loss 				= 		$('#loss').val();
						 		pesticide 			= 		$('#pesticide').val();
						 		reason 				= 		$('#reason').val();
						if (typeof (Storage) !== "undefined") {
							useremail= localStorage.getItem("email");
					      } else {
					        window.alert('Please use a modern browser');
					      }
							$.ajax({
	    	  					type		:	'GET',
	    	  					url			:	'/disease',
	    	  					data		:	{reason:reason,pesticide:pesticide,loss:loss,currency:currency,duration:duration,useremail : useremail,cropcultivated:cropcultivated,location:location,state:state,zipcode:zipcode,soiltype:soiltype,acrescount:acrescount,disease:disease},
	    	  					success		: 	function(data)
	    	  					{
	    	  						alert("Thanks for your input");
	    	  					}
							});
					}
					catch(err)
					{
						console.error(err);
					}
				},
				analyse					:	function(){
											var cropname = "";
											var 		useremail 				= 		"";
											try
											{
												if (typeof (Storage) !== "undefined") {
												    useremail = localStorage.getItem("email");
												  } else {
												    window.alert('Please use a modern browser');
												  }
												debugger;
												cropname = $.trim($('#fav_culti').val());
												$.ajax({
						    	  					type		:	'GET',
						    	  					url			:	'/submitdecision',
						    	  					data		:	{useremail : useremail,cropname:cropname},
						    	  					success		: 	function(data)
						    	  					{
						    	  						console.log(data);
						    	  						
						    	  					}
												});
												$.ajax({
						    	  					type		:	'GET',
						    	  					url			:	'/pullprevioussearch',
						    	  					data		:	{cropname:cropname},
						    	  					success		: 	function(data)
						    	  					{
						    	  						var jsonvars				=	JSON.parse(data);
						    	  						 console.log("previousearch");
												       	 console.log(jsonvars);
												      	  	dtable = $('#previoussearch').dataTable({
																"bDestroy" : true,
																"aoColumns" : [{
																	"sTitle" : "Email",
																	"sWidth" : "25%",
																	"sClass" : "center"
																},{
																	"sTitle" : "Crop",
																	"sWidth" : "25%",
																	"sClass" : "center"
																},{
																	"sTitle" : "Date",
																	"sWidth" : "25%",
																	"sClass" : "center"
																}]
															});
												      	  dtable.fnClearTable();
												      		var newRow = [];
												      		for(index in jsonvars)
															{
																newRow[0] = jsonvars[index].requestedby;
																newRow[1] = jsonvars[index].cropname;
																newRow[2] = jsonvars[index].date;
																dtable.fnAddData(newRow); 
															}
												      		dtable.fnDraw();
						    	  					}
												});
												$.ajax({
													type		:	'GET',
													url			:	'/pulldiseasewithdecision',
													data		:	{useremail : useremail,cropname:cropname},
													success		: 	function(data)
													{
														 var jsonvars				=	JSON.parse(data);
												       	 console.log("ui");
												       	 console.log(jsonvars);
												      	  	dtable = $('#profilnloss').dataTable({
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
													url			:	'/pulldiseasewithdecision',
													data		:	{useremail : useremail,cropname:cropname},
													success		: 	function(data)
													{
														 var jsonvars				=	JSON.parse(data);
												       	 console.log("ui");
												       	 console.log(jsonvars);
												      	  	dtable = $('#profilnloss2').dataTable({
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
											}
											catch(err)
											{
												console.error(err);
											}
					
					
				},
				submitfarm				:	function(){
														var 		useremail 				= 		"";
														var 		fieldname 			= 		"";
														var 		location		=		"";
														var 		soiltype				=		"";
														var 		ownership				=		"";
														var 		totalarea				=		"";
														var 		climatetype				=		"";
														var 		weather				=		"";
														var 		pesticides				=		"";
														var 		fav_culti			=		"";
														var 		usernotes			=		"";
														try
														{
															useremail 		= 		$.trim($('#useremail').val());
															fieldname 		= 		$.trim($('#fieldname').val());
															location		=		$.trim($('#location').val());
															soiltype		=		$.trim($('#soiltype').val());
															ownership		=		$.trim($('#ownership').val());
															totalarea		=		$.trim($('#totalarea').val());
															climatetype 	= 		$.trim($('#climatetype').val());
															weather			=		$.trim($('#weather').val());
															pesticides		=		$.trim($('#pesticides').val());
															fav_culti		=		$.trim($('#fav_culti').val());
															usernotes		=		$.trim($('#usernotes').val());
															if(!validate.validateEmail(useremail) || !validate.validateField(fieldname) || !validate.validateField(location) || !validate.validateField(ownership) || !validate.validateField(totalarea) || !validate.validateField(weather) || !validate.validateField(pesticides) || !validate.validateField(ownership) || !validate.validateField(totalarea) || !validate.validateField(weather) || !validate.validateField(fav_culti))
														    {
															    	  if(!validate.validateField(useremail)){$('#useremail').addClass('error');}
															    	  if(!validate.validateEmail(useremail)){$('#useremail').addClass('error');}
															    	  if(!validate.validateField(fieldname)){$('#fieldname').addClass('error');}
															    	  if(!validate.validateField(location)){$('#location').addClass('error');}
															    	  if(!validate.validateField(ownership)){$('#ownership').addClass('error');}
															    	  if(!validate.validateField(totalarea)){$('#totalarea').addClass('error');}
															    	  if(!validate.validateField(weather)){$('#weather').addClass('error');}
															    	  if(!validate.validateField(pesticides)){$('#pesticides').addClass('error');}
															    	  if(!validate.validateField(fav_culti)){$('#fav_culti').addClass('error');}
														    }
															else
															{
																	$.ajax({
												    	  					type		:	'GET',
												    	  					url			:	'/submitfarm',
												    	  					data		:	{useremail : useremail,fieldname:fieldname,location:location,soiltype:soiltype,ownership:ownership,totalarea:totalarea,climatetype:climatetype,weather:weather,pesticides:pesticides,fav_culti:fav_culti,usernotes:usernotes},
												    	  					success		: 	function(data)
												    	  					{
												    	  						console.log(data);
												    	  						alert("Your data has been successfully saved");
												    	  						
												    	  					}
																	});
															}
														}
														catch(err)
														{
															console.error(err);
														}
				}, 
				attachHandlers			:  function(){
												$(document).on("click", "#signup", function(e){
													operations.register();
												});
												$(document).on("click", "#login", function(e){
													operations.login();
												});
												$(document).on("click", "#collaborate", function(e){
													operations.collaborate();
												});
												$(document).on("click", "#submitdisease", function(e){
													operations.disease();
												});
												$(document).on("click", "#updatecomments", function(e){
													operations.updatecomments();
												});
												$(document).on("click", "#analyse", function(e){
													operations.analyse();
												});
												$(document).on("keyup", "#profession", function(e){$('#profession').removeClass('error');});
												$(document).on("keyup", "#phone", function(e){$('#phone').removeClass('error');});
												$(document).on("keyup", "#organization", function(e){$('#organization').removeClass('error');});
												
												$(document).on("blur", "#profession", function(e){
														var profession 			= 		$.trim($('#profession').val());
														if(validate.validateField(profession)){
															$('#profession').removeClass('error');
														}
														else{
															$('#profession').addClass('error');
														}
												});
												$(document).on("blur", "#organization", function(e){
													var organization 					= 		$.trim($('#organization').val());
													if(validate.validateField(name)){
														$('#organization').removeClass('error');
													}
													else{
														$('#organization').addClass('error');
													}
												});
												$(document).on("keydown", "#phone", function(e)
												{
													if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190]) !== -1 ||  (e.keyCode == 65 && e.ctrlKey === true) ||  (e.keyCode >= 35 && e.keyCode <= 40)){ 
														if(e.keyCode == 13){
															$('#signup').click();
														}
													}
													else if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)){ 
														e.preventDefault();
													}
												});
												$(document).on("click", "#submitfarm", function(e)
												{
													operations.submitfarm();
												});
												$(document).on("blur", "#phone", function(e)
												{
													var phone 			= 		$.trim($('#phone').val());
													if(validate.validatePhone(phone))
													{
														$('#phone').removeClass('error');						
													}
													else
													{
														$('#phone').addClass('error');
													}
												});
										   },
					login 					:  function(){
											   window.location.href = "/authenticateUser";	
					}
		};
				