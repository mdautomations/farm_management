
var validate=
{
		validateField			:	function(value)
		{
			if(value.length>0 && value!=null && value!="")
			{
				return true;
			}
			else
			{
				return false;
			}
		},
		validateEmail			: function(value)
		{
			 var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
			 return regex.test(value);
		},
		validatePhone			: function(value)
		{
			 var filter = /^[0-9-+]+$/;
			 if (filter.test(value)) 
			 {
			   	if(value.length>=10)
			   	{
		    		return true;
		    	}
			    else
		    	{
			    	return false;
		    	}
			 }
			 else 
			 {
			    return false;
			 }
		},
		
};
