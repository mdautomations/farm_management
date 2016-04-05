$(document).ready(function()
{
	console.log("hjgfhgv");
	$.get('reportgen',function(data)
	{
       	 var jsonvars				=	JSON.parse(data);
       	 console.log("ui");
       	 console.log(jsonvars);
      	  	dtable = $('#datastables').dataTable({
				"bDestroy" : true,
				"aoColumns" : [{
					"sTitle" : "useremail",
					"sWidth" : "10%",
					"sClass" : "center"
				},{
					"sTitle" : "fieldname",
					"sWidth" : "10%",
					"sClass" : "center"
				},{
					"sTitle" : "location",
					"sWidth" : "10%",
					"sClass" : "center"
				},{
					"sTitle" : "soiltype",
					"sWidth" : "10%",
					"sClass" : "center"
				},{
					"sTitle" : "ownership",
					"sWidth" : "10%",
					"sClass" : "center"
				},{
					"sTitle" : "totalarea",
					"sWidth" : "10%",
					"sClass" : "center"
				}]
			});
      	  	
      		dtable.fnClearTable();
      	  dtable_initial = $('#initial').dataTable({
				"bDestroy" : true,
				"aoColumns" : [{
					"sTitle" : "useremail",
					"sWidth" : "20%",
					"sClass" : "center"
				},{
					"sTitle" : "climatetype",
					"sWidth" : "20%",
					"sClass" : "center"
				},{
					"sTitle" : "weather",
					"sWidth" : "20%",
					"sClass" : "center"
				},{
					"sTitle" : "pesticides",
					"sWidth" : "20%",
					"sClass" : "center"
				},{
					"sTitle" : "cultivation",
					"sWidth" : "20%",
					"sClass" : "center"
				}]
			});
      	  	dtable_initial.fnClearTable();	
			
						
			var newRow = [];
			var initial = [];
			for(index in jsonvars)
			{
				newRow[0] = jsonvars[index].useremail;
				newRow[1] = jsonvars[index].fieldname;
				newRow[2] = jsonvars[index].location;
				newRow[3] = jsonvars[index].soiltype;
				newRow[4] = jsonvars[index].ownership;
				newRow[5] = jsonvars[index].totalarea;
				initial[0] = jsonvars[index].useremail;
				initial[1] = jsonvars[index].climatetype;
				initial[2] = jsonvars[index].weather;
				initial[3] = jsonvars[index].pesticides;
				initial[4] = jsonvars[index].fav_culti;
				dtable.fnAddData(newRow);
				dtable_initial.fnAddData(initial);
			}
				dtable.fnDraw();
				dtable_initial.fnDraw();
	});
});
