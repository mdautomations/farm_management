
package com.spring;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.ResourceBundle;
import java.util.UUID;
import java.util.logging.Logger;


import javax.jdo.PersistenceManager;
import javax.jdo.Query;
import javax.jdo.PersistenceManager;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.appengine.labs.repackaged.org.json.JSONException;

@Controller
public class SpringServlet 
{
    private static final 	Logger log 		= 		Logger.getLogger(Helper.class.getName());
    @RequestMapping(value={"/"}, method={RequestMethod.GET})
    public String userdefined(HttpServletRequest req, HttpServletResponse resp) throws IOException 
    {
        return "auth";
    }

    @RequestMapping(value={"/login"}, method={RequestMethod.GET})
    public String login(HttpServletRequest req, HttpServletResponse resp) throws IOException 
    {
        return "login";
    }

    @RequestMapping(value={"/user"}, method={RequestMethod.GET})
    public String user(HttpServletRequest req, HttpServletResponse resp) throws IOException 
    {
        return "user";
    }

    @RequestMapping(value={"/signup"}, method={RequestMethod.GET})
    public String signup(HttpServletRequest req, HttpServletResponse resp) throws IOException 
    {
        return "signup";
    }

    @RequestMapping(value={"/logout"}, method={RequestMethod.GET})
    public String logout(HttpServletRequest req, HttpServletResponse resp, HttpSession session) throws IOException
    {
        session.invalidate();
        return "login";
    }

    @RequestMapping(value={"/authenticateUser"}, method={RequestMethod.GET})
    public String checkentry(HttpServletResponse response, HttpServletRequest request, HttpSession session) throws IOException, JSONException 
    {
	        String 		authenticateURL 	= 		null;
	        String 		state 						= 		null;
	        String 		response_type 		= 		null;
	        String 		client_id 					=	 	null;
	        String 		approval_prompt 	= 		null;
	        String 		oAuthURL 				= 		null;
	        String 		remoteHost 			= 		null;
	        try 
	        {
	            authenticateURL 				= 		ResourceBundle.getBundle("ApplicationResources").getString("Oauth.authenticate.url");
	            state 									= 		ResourceBundle.getBundle("ApplicationResources").getString("oAuth.state");
	            client_id		 						= 		ResourceBundle.getBundle("ApplicationResources").getString("client_id");
	            response_type 					= 		ResourceBundle.getBundle("ApplicationResources").getString("response_type");
	            approval_prompt	 				=	 	ResourceBundle.getBundle("ApplicationResources").getString("approval_prompt");
	            remoteHost 						= 		request.getRemoteHost();
	            remoteHost 						= 		remoteHost.contains("127.0.0.1") ? "http://localhost:8888" : "http://" + request.getServerName();
	            oAuthURL 							= 		new Helper().constructRedirectURL(state, authenticateURL, remoteHost, response_type, client_id, approval_prompt);
	        }
	        catch (Exception e) 
	        {
	        		log.info("Exception authenticateUser :: " + e.getMessage());
	        }
	        return "redirect:" + oAuthURL;
    }
    @RequestMapping(value={"/success"}, method={RequestMethod.GET})
    public String success(HttpServletResponse response, HttpServletRequest request, HttpSession session) throws IOException, JSONException 
    {
    	 return "general1";
    }
    @RequestMapping(value={"/oauth2callback"}, method={RequestMethod.GET})
    public String oauth2callback(HttpServletResponse response, HttpServletRequest request, HttpSession session) throws IOException, JSONException 
    {
	        String 		code 				= 		null;
	        String 		client_id 			= 		null;
	        String 		client_secret 	= 		null;
	        String 		grant_type 		= 		null;
	        String 		accessToken 	= 		null;
	        String 		data 				= 		null;
	        String 		status 				= 		null;
	        String 		APIkey 				= 		null;
	        String 		remoteHost 	= 		null;
	        String 		getaccessTokenURL 	= 		 null;
	        String 		callGoogleProfileAPI 	=		 null;
	        JSONObject GoogleAPIResponse = 	 null;
	        HashMap<String, Object> 		validateUser 		=		 new HashMap<String, Object>();;
	        try 
	        {
	            	log.info("comes here");
	            	if (request.getParameter("code") != null)
	            	{
			                log.info("comes code :: " + code);
			                callGoogleProfileAPI 		= 		ResourceBundle.getBundle("ApplicationResources").getString("callGoogleProfileAPI");
			                getaccessTokenURL 		= 		ResourceBundle.getBundle("ApplicationResources").getString("getaccessTokenURL");
			                client_id 							= 		ResourceBundle.getBundle("ApplicationResources").getString("client_id");
			                client_secret 					= 		ResourceBundle.getBundle("ApplicationResources").getString("client_secret");
			                grant_type 						= 		ResourceBundle.getBundle("ApplicationResources").getString("grant_type");
			                APIkey					 			= 		ResourceBundle.getBundle("ApplicationResources").getString("APIkey");
			                code 								= 		request.getParameter("code");
			                GoogleAPIResponse 		= 		new JSONObject();
			                remoteHost 					= 		request.getRemoteHost();
			                remoteHost 					= 		remoteHost.contains("127.0.0.1") ? "http://localhost:8888" : "http://" + request.getServerName();
			                data 								= 		new Helper().constructOauthData(code, client_id, remoteHost, client_secret, grant_type);
			                accessToken		 			= 		new Helper().getAccessToken(data, getaccessTokenURL);
			                GoogleAPIResponse 		= 		new Helper().callGoogleAPI(callGoogleProfileAPI, accessToken, APIkey);
			                validateUser 					= 		new Helper().validateUser(GoogleAPIResponse, session);
			                System.out.println("validateUser validateUser :: " + validateUser);
//			                status 								= 		new ObjectMapper().writeValueAsString(validateUser);
	            }
	        }
	        catch (Exception e) 
	        {
	            		System.out.println("Error :: " + e);
	        }
	        return "redirect:signup" ;
    }

    @RequestMapping(value={"/register"}, method={RequestMethod.GET})
    @ResponseBody
    public String register(HttpServletResponse response, HttpServletRequest request, HttpSession session) throws IOException, JSONException 
    {
	        String 		name 				= 		null;
	        String 		email 				= 		null;
	        String 		gender 			= 		null;
	        String 		organization 	= 		null;
	        String 		profession 		= 		null;
	        String 		phone 				= 		null;
	        String 		persistUser 		= 		null;
	        try 
	        {
		            name 				= 			request.getParameter("name");
		            organization 	= 			request.getParameter("organization");
		            email 				= 			request.getParameter("email");
		            phone 				= 			request.getParameter("phone");
		            gender 			= 			request.getParameter("gender");
		            profession 		= 			request.getParameter("profession");
		            persistUser 		= 			new Helper().persistNewUser(request, name, organization, email, phone, gender, profession);
	        }
	        catch (Exception e) 
	        {
	            log.info("Exception authenticateUser :: " + e.getMessage());
	            return "failure";
	        }
	        return "success";
    }
    @RequestMapping(value={"/submitfarm"}, method={RequestMethod.GET})
    @ResponseBody
    public String submitfarm(HttpServletResponse response, HttpServletRequest request, HttpSession session) throws IOException, JSONException 
    {
	        String 		useremail 				= 		null;
	        String 		fieldname 				= 		null;
	        String 		location 			= 		null;
	        String 		soiltype 	= 		null;
	        String 		ownership 		= 		null;
	        String 		totalarea 				= 		null;
	        String 		climatetype 		= 		null;
	        String 		weather 		= 		null;
	        String 		pesticides 		= 		null;
	        String 		fav_culti 		= 		null;
	        String 		usernotes 		= 		null;
	        String    responses = null;
	        try 
	        {
	        		useremail 				= 			request.getParameter("useremail");
	        		fieldname 	= 			request.getParameter("fieldname");
	        		location 				= 			request.getParameter("location");
	        		soiltype 				= 			request.getParameter("soiltype");
	        		ownership 			= 			request.getParameter("ownership");
	        		totalarea 		= 			request.getParameter("totalarea");
	        		climatetype 		= 			request.getParameter("climatetype");
	        		weather 		= 			request.getParameter("weather");
	        		pesticides 		= 			request.getParameter("pesticides");
	        		fav_culti 		= 			request.getParameter("fav_culti");
	        		usernotes 		= 			request.getParameter("usernotes");
	        		responses 		= 			new Helper().persistfarm(useremail, fieldname, location, soiltype, ownership, totalarea, climatetype,weather,pesticides,fav_culti,usernotes );
	        }
	        catch (Exception e) 
	        {
	            log.info("Exception authenticateUser :: " + e.getMessage());
	            return "failure";
	        }
	        return "success";
    }
    @RequestMapping(value={"/reportgen"}, method={RequestMethod.GET})
    @ResponseBody
    public String reportgen(HttpServletResponse response, HttpServletRequest request, HttpSession session) throws IOException, JSONException 
    {
		   String 				status 				= 		null;
		   PersistenceManager 	pm 					= 		null;
		   Query 				queryUserDetails	=		null;
		   List<farmdata> 		usersInfo			=		null;
		   try
		   {
		        pm 					   					=      PMF.get().getPersistenceManager();
		        HashMap<String, farmdata> tableEntry 	=      new HashMap<String,  farmdata>();
		        queryUserDetails		   	   			=  	 pm.newQuery(farmdata.class);
		        usersInfo              					=      (List<farmdata>) queryUserDetails.execute();

		        for( farmdata value:usersInfo )
		        {
		        	tableEntry.put( value.getKey().toString(), value );
		        }  
		        status 				   					=   	  new ObjectMapper().writeValueAsString(tableEntry);
		        System.out.println("the statudfsdfsds is this :: "+status);
		   }
		   catch(Exception e)
		   {
			   System.out.println("the entry is this ::"+e);
		   }
			return status;		
	}
    @RequestMapping(value={"/pullalluserslist"}, method={RequestMethod.GET})
    @ResponseBody
    public String pullalluserslist(HttpServletResponse response, HttpServletRequest request, HttpSession session) throws IOException, JSONException 
    {
		   String 				status 				= 		null;
		   PersistenceManager 	pm 					= 		null;
		   Query 				queryUserDetails	=		null;
		   List<Entry> 		usersInfo			=		null;
		   try
		   {
		        pm 					   					=      PMF.get().getPersistenceManager();
		        HashMap<String, Entry> tableEntry 	=      new HashMap<String,  Entry>();
		        queryUserDetails		   	   			=  	 pm.newQuery(Entry.class);
		        usersInfo              					=      (List<Entry>) queryUserDetails.execute();

		        for( Entry value:usersInfo )
		        {
		        	tableEntry.put( value.getKey().toString(), value );
		        }  
		        status 				   					=   	  new ObjectMapper().writeValueAsString(tableEntry);
		        System.out.println("the statudfsdfsds is this :: "+status);
		   }
		   catch(Exception e)
		   {
			   System.out.println("the entry is this ::"+e);
		   }
			return status;		
	}
    @RequestMapping(value={"/collborate"}, method={RequestMethod.GET})
    @ResponseBody
    public String collborate(HttpServletResponse response, HttpServletRequest request, HttpSession session) throws IOException, JSONException 
    {
    	String 		useremail 			= 		null;
        String 		partneremail 		= 		null;
        Date 		date 				= 		null;
        UUID 		uniqueKey 			= 		null;
    	cooperate 	cooperate 			= 		null;
    	PersistenceManager pmf 			= 		null;
        try
        {
        	useremail 				= 			request.getParameter("useremail");
        	partneremail 			= 			request.getParameter("partner");
        	date 					= 			new Date();		
        	pmf 					= 			PMF.get().getPersistenceManager();
        	uniqueKey 				= 			UUID.randomUUID();
        	cooperate				=			new cooperate();
        	cooperate.setKey(uniqueKey.toString());
        	cooperate.setDate(date);
        	cooperate.setRequestsentto(partneremail);
        	cooperate.setStatus("Pending");
        	cooperate.setUseremail(useremail);
            pmf.currentTransaction().begin();
            pmf.makePersistent(cooperate);
            pmf.currentTransaction().commit();
        }
        catch(Exception e)
        {
        	System.out.println("the error log in colloborate is this ::"+e);
        }
        return "success";
    }
    @RequestMapping(value={"/storecomments"}, method={RequestMethod.GET})
    @ResponseBody
    public String storecomments(HttpServletResponse response, HttpServletRequest request, HttpSession session) throws IOException, JSONException 
    {
    	String 	useremail 			= 		null;
		String comment= null;
		 Date 		date 				= 		null;
	        UUID 		uniqueKey 			= 		null;
	    	comments 	comments		= 		new comments();
	    	PersistenceManager pmf 			= 		null;
		try
        {
			date 					= 			new Date();		
        	pmf 					= 			PMF.get().getPersistenceManager();
        	uniqueKey 				= 			UUID.randomUUID();
			useremail 				= 			request.getParameter("useremail");
        	comment 				= 			request.getParameter("comments");
        	comments.setKey(uniqueKey.toString());
        	comments.setUseremail(useremail);
        	comments.setComments(comment);
        	comments.setDate(date.toGMTString());
        	 pmf.currentTransaction().begin();
             pmf.makePersistent(comments);
             pmf.currentTransaction().commit();
        }
		catch(Exception e)
		{
			
		}
		return "success";
    }
    @RequestMapping(value={"/submitdecision"}, method={RequestMethod.GET})
    @ResponseBody
    public String submitdecision(HttpServletResponse response, HttpServletRequest request, HttpSession session) throws IOException, JSONException 
    {
    	String 	useremail 			= 		null;
		String cropname= null;
		 Date 		date 				= 		null;
	        UUID 		uniqueKey 			= 		null;
	    	decision 	decision		= 		new decision();
	    	PersistenceManager pmf 			= 		null;
		try
        {
			date 					= 			new Date();		
        	pmf 					= 			PMF.get().getPersistenceManager();
        	uniqueKey 				= 			UUID.randomUUID();
			useremail 				= 			request.getParameter("useremail");
			cropname 				= 			request.getParameter("cropname");
        	decision.setKey(uniqueKey.toString());
        	decision.setRequestedby(useremail);
        	decision.setCropname(cropname);
        	decision.setDate(date.toGMTString());
        	 pmf.currentTransaction().begin();
             pmf.makePersistent(decision);
             pmf.currentTransaction().commit();
        }
		catch(Exception e)
		{
			
		}
		return "success";
    }
    @RequestMapping(value={"/disease"}, method={RequestMethod.GET})
    @ResponseBody
    public String disease(HttpServletResponse response, HttpServletRequest request, HttpSession session) throws IOException, JSONException 
    {
    	String 		useremail 			= 		null;
		String cropcultivated= null;
		String location= null;
		String state= null;
		String zipcode= null;
		String soiltype= null;
		String acrescount= null;
		String disease= null;
		String duration= null;
		String currency= null;
		String loss = null;
		String pesticide = null;
		String reason = null;
        Date 		date 				= 		null;
        UUID 		uniqueKey 			= 		null;
    	disease 	diseases		= 		new disease();
    	PersistenceManager pmf 			= 		null;
        try
        {
        	useremail 				= 			request.getParameter("useremail");
        	cropcultivated 			= 			request.getParameter("cropcultivated");
        	location				=			request.getParameter("location");
        	state					=			request.getParameter("state");
        	zipcode					=			request.getParameter("zipcode");
        	soiltype				=			request.getParameter("soiltype");
        	acrescount				=			request.getParameter("acrescount");
        	disease					=			request.getParameter("disease");
        	duration				=			request.getParameter("duration");
        	currency				=			request.getParameter("currency");
        	loss					=			request.getParameter("loss");
        	pesticide				=			request.getParameter("pesticide");
        	reason					=			request.getParameter("reason");
        	date 					= 			new Date();		
        	pmf 					= 			PMF.get().getPersistenceManager();
        	uniqueKey 				= 			UUID.randomUUID();
        	diseases.setKey(uniqueKey.toString());
        	diseases.setUseremail(useremail);
        	diseases.setCropcultivated(cropcultivated);
        	diseases.setState(state);
        	diseases.setZipcode(zipcode);
        	diseases.setSoiltype(soiltype);
        	diseases.setAcrescount(acrescount);
        	diseases.setDisease(disease);
        	diseases.setDuration(duration);
        	diseases.setCurrency(currency);
        	diseases.setLocation(location);
        	diseases.setLoss(loss);
        	diseases.setPesticide(pesticide);
        	diseases.setReason(reason);
        	diseases.setDate(date.toGMTString());
            pmf.currentTransaction().begin();
            pmf.makePersistent(diseases);
            pmf.currentTransaction().commit();
        }
        catch(Exception e)
        {
        	System.out.println("the error log in colloborate is this ::"+e);
        }
        return "success";
    }
    @RequestMapping(value={"/checknotification"}, method={RequestMethod.GET})
    @ResponseBody
    public String checknotification(HttpServletResponse response, HttpServletRequest request, HttpSession session) throws IOException, JSONException 
    {
    	String useremail = null;
    	PersistenceManager  pm         = 	PMF.get().getPersistenceManager();
    	try
    	{
    		useremail 		=		request.getParameter("useremail");
    		System.out.println("The user email obtained is this ::"+useremail);
    		Query 		queryUserDetails1  =	pm.newQuery(cooperate.class," 	requestsentto == '"+useremail+"' && status == 'Pending'");
    		List<cooperate> usersInfo1 		   = 	(List<cooperate>)queryUserDetails1.execute();
    		System.out.println("usersInfo1.size() :: "+usersInfo1.size());
    		if(usersInfo1!=null)
    		{
    			return String.valueOf(usersInfo1.size());	
    		}
    		
/*    		 HashMap<String, cooperate> tableEntry 	=      new HashMap<String,  cooperate>();
    		 for( cooperate value:usersInfo1 )
		        {
		        	tableEntry.put( value.getKey().toString(), value );
		        }  
		        status 				   					=   	  new ObjectMapper().writeValueAsString(tableEntry);
		        System.out.println("the statudfsdfsds is this :: "+status);*/
    		
    	}
    	catch(Exception e)
    	{
    		System.out.println("Error in notification :: "+e);
    	}
    	return null;
    }
    @RequestMapping(value={"/pullnotification"}, method={RequestMethod.GET})
    @ResponseBody
    public String pullnotification(HttpServletResponse response, HttpServletRequest request, HttpSession session) throws IOException, JSONException 
    {
    	String useremail = null;
    	PersistenceManager  pm         = 	PMF.get().getPersistenceManager();
    	String status = null;
    	try
    	{
    		useremail 		=		request.getParameter("useremail");
    		System.out.println("The user email obtained is this ::"+useremail);
    		Query 		queryUserDetails1  =	pm.newQuery(cooperate.class," 	requestsentto == '"+useremail+"' && status == 'Pending'");
    		List<cooperate> usersInfo1 		   = 	(List<cooperate>)queryUserDetails1.execute();
    		System.out.println("usersInfo1.size() :: "+usersInfo1.size());
    		
    		
    		 HashMap<String, cooperate> tableEntry 	=      new HashMap<String,  cooperate>();
    		 for( cooperate value:usersInfo1 )
		        {
		        	tableEntry.put( value.getKey().toString(), value );
		        }  
		        status 				   					=   	  new ObjectMapper().writeValueAsString(tableEntry);
		        System.out.println("the statudfsdfsds is this :: "+status);
    		
    	}
    	catch(Exception e)
    	{
    		System.out.println("Error in notification :: "+e);
    	}
    	return status;
    }
    @RequestMapping(value={"/pullcomments"}, method={RequestMethod.GET})
    @ResponseBody
    public String pullcomments(HttpServletResponse response, HttpServletRequest request, HttpSession session) throws IOException, JSONException 
    {
    	String useremail = null;
    	PersistenceManager  pm         = 	PMF.get().getPersistenceManager();
    	String status = null;
    	try
    	{
    		useremail 		=		request.getParameter("useremail");
    		System.out.println("The user email obtained is this ::"+useremail);
    		Query queryUserDetails		   	   			=  	 pm.newQuery(comments.class);
    		List<comments> usersInfo1 		   = 	(List<comments>)queryUserDetails.execute();
    		System.out.println("usersInfo1.size() :: "+usersInfo1.size());
    		
    		
    		 HashMap<String, comments> tableEntry 	=      new HashMap<String,  comments>();
    		 for( comments value:usersInfo1 )
		        {
		        	tableEntry.put( value.getKey().toString(), value );
		        }  
		        status 				   					=   	  new ObjectMapper().writeValueAsString(tableEntry);
		        System.out.println("the statudfsdfsds is this :: "+status);
    		
    	}
    	catch(Exception e)
    	{
    		System.out.println("Error in notification :: "+e);
    	}
    	return status;
    }
    @RequestMapping(value={"/pullapproved"}, method={RequestMethod.GET})
    @ResponseBody
    public String pullapproved(HttpServletResponse response, HttpServletRequest request, HttpSession session) throws IOException, JSONException 
    {
    	String useremail = null;
    	PersistenceManager  pm         = 	PMF.get().getPersistenceManager();
    	String status = null;
    	try
    	{
    		useremail 		=		request.getParameter("useremail");
    		System.out.println("The user email obtained is this ::"+useremail);
    		Query 		queryUserDetails1  =	pm.newQuery(cooperate.class," 	requestedby == '"+useremail+"' && status == 'Approve'");
    		List<cooperate> usersInfo1 		   = 	(List<cooperate>)queryUserDetails1.execute();
    		System.out.println("usersInfo1.size() :: "+usersInfo1.size());
    		
    		
    		 HashMap<String, cooperate> tableEntry 	=      new HashMap<String,  cooperate>();
    		 for( cooperate value:usersInfo1 )
		        {
		        	tableEntry.put( value.getKey().toString(), value );
		        }  
		        status 				   					=   	  new ObjectMapper().writeValueAsString(tableEntry);
		        System.out.println("the statudfsdfsds is this :: "+status);
    		
    	}
    	catch(Exception e)
    	{
    		System.out.println("Error in notification :: "+e);
    	}
    	return status;
    }
    
    @RequestMapping(value={"/pullrejected"}, method={RequestMethod.GET})
    @ResponseBody
    public String pullrejected(HttpServletResponse response, HttpServletRequest request, HttpSession session) throws IOException, JSONException 
    {
    	String useremail = null;
    	PersistenceManager  pm         = 	PMF.get().getPersistenceManager();
    	String status = null;
    	try
    	{
    		useremail 		=		request.getParameter("useremail");
    		System.out.println("The user email obtained is this ::"+useremail);
    		Query 		queryUserDetails1  =	pm.newQuery(cooperate.class," 	requestedby == '"+useremail+"' && status == 'Reject'");
    		List<cooperate> usersInfo1 		   = 	(List<cooperate>)queryUserDetails1.execute();
    		System.out.println("usersInfo1.size() :: "+usersInfo1.size());
    		
    		
    		 HashMap<String, cooperate> tableEntry 	=      new HashMap<String,  cooperate>();
    		 for( cooperate value:usersInfo1 )
		        {
		        	tableEntry.put( value.getKey().toString(), value );
		        }  
		        status 				   					=   	  new ObjectMapper().writeValueAsString(tableEntry);
		        System.out.println("the statudfsdfsds is this :: "+status);
    		
    	}
    	catch(Exception e)
    	{
    		System.out.println("Error in notification :: "+e);
    	}
    	return status;
    }
    @RequestMapping(value={"/pulldisease"}, method={RequestMethod.GET})
    @ResponseBody
    public String pulldisease(HttpServletResponse response, HttpServletRequest request, HttpSession session) throws IOException, JSONException 
    {
    	String useremail = null;
    	PersistenceManager  pm         = 	PMF.get().getPersistenceManager();
    	String status = null;
    	try
    	{
    		useremail 		=		request.getParameter("useremail");
    		System.out.println("The user email obtained is this ::"+useremail);
    		Query queryUserDetails		   	   			=  	 pm.newQuery(disease.class);
    		List<disease> usersInfo1 		   = 	(List<disease>)queryUserDetails.execute();
    		System.out.println("usersInfo1.size() :: "+usersInfo1.size());
    		
    		
    		 HashMap<String, disease> tableEntry 	=      new HashMap<String,  disease>();
    		 for( disease value:usersInfo1 )
		        {
		        	tableEntry.put( value.getKey().toString(), value );
		        }  
		        status 				   					=   	  new ObjectMapper().writeValueAsString(tableEntry);
		        System.out.println("the statudfsdfsds is this :: "+status);
    		
    	}
    	catch(Exception e)
    	{
    		System.out.println("Error in notification :: "+e);
    	}
    	return status;
    }
    @RequestMapping(value={"/pullprevioussearch"}, method={RequestMethod.GET})
    @ResponseBody
    public String pullprevioussearch(HttpServletResponse response, HttpServletRequest request, HttpSession session) throws IOException, JSONException 
    {
    	String useremail = null;
    	String cropname = null;
    	PersistenceManager  pm         = 	PMF.get().getPersistenceManager();
    	String status = null;
    	try
    	{
    		cropname		=		request.getParameter("cropname");
    		System.out.println("The user email obtained is this ::"+useremail);
    		Query queryUserDetails 			= 		pm.newQuery(decision.class, "cropname == '"+cropname.trim()+"'");
    		List<decision> usersInfo1 		   = 	(List<decision>)queryUserDetails.execute();
    		System.out.println("usersInfo1.size() :: "+usersInfo1.size());
    		
    		
    		 HashMap<String, decision> tableEntry 	=      new HashMap<String,  decision>();
    		 for( decision value:usersInfo1 )
		        {
		        	tableEntry.put( value.getKey().toString(), value );
		        }  
		        status 				   					=   	  new ObjectMapper().writeValueAsString(tableEntry);
		        System.out.println("the statudfsdfsds is this :: "+status);
    		
    	}
    	catch(Exception e)
    	{
    		System.out.println("Error in notification :: "+e);
    	}
    	return status;
    }
    @RequestMapping(value={"/pulldiseasewithdecision"}, method={RequestMethod.GET})
    @ResponseBody
    public String pulldiseasewithdecision(HttpServletResponse response, HttpServletRequest request, HttpSession session) throws IOException, JSONException 
    {
    	String useremail = null;
    	String cropname = null;
    	PersistenceManager  pm         = 	PMF.get().getPersistenceManager();
    	String status = null;
    	try
    	{
    		useremail 		=		request.getParameter("useremail");
    		cropname		=		request.getParameter("cropname");
    		System.out.println("The user email obtained is this ::"+useremail);
    		Query queryUserDetails 			= 		pm.newQuery(disease.class, "cropcultivated == '"+cropname.trim()+"'");
    		List<disease> usersInfo1 		   = 	(List<disease>)queryUserDetails.execute();
    		System.out.println("usersInfo1.size() :: "+usersInfo1.size());
    		
    		
    		 HashMap<String, disease> tableEntry 	=      new HashMap<String,  disease>();
    		 for( disease value:usersInfo1 )
		        {
		        	tableEntry.put( value.getKey().toString(), value );
		        }  
		        status 				   					=   	  new ObjectMapper().writeValueAsString(tableEntry);
		        System.out.println("the statudfsdfsds is this :: "+status);
    		
    	}
    	catch(Exception e)
    	{
    		System.out.println("Error in notification :: "+e);
    	}
    	return status;
    }
    
    @RequestMapping(value={"/acceptnotif"}, method={RequestMethod.GET})
    @ResponseBody
    public String acceptnotif(HttpServletResponse response, HttpServletRequest request, HttpSession session) throws IOException, JSONException 
    {
    	String id = null;
    	String status 							= null;
    	List<cooperate> 		listEntry 		= 		null;
        Query 					QueryLists 		= 		null;
        PersistenceManager  pmf         = 	PMF.get().getPersistenceManager();
        String email							=		null;
    	
    		id= request.getParameter("id");
    		status = request.getParameter("status");
    		email	= request.getParameter("email");
    		System.out.println("the email received is this :;"+email);
    		QueryLists 			= 		pmf.newQuery(cooperate.class, "requestsentto == '"+email.toString().trim()+"'");
    		listEntry 				=  	(List<cooperate>) QueryLists.execute();
    		if (listEntry.size() != 0) 
        	{
        		for (cooperate value : listEntry) 
        		{
        			System.out.println("value :: "+value.getKey()+" :: status :: "+status);
        			if(value.getKey().equals(id.toString()))
        			{
        				value.setStatus(status);
	           			 pmf.currentTransaction().begin();
	           			 pmf.makePersistent(value);
	           			 pmf.currentTransaction().commit();
        			}
        		}
        	}
    	
    	
    	return "success";
    }
    
}