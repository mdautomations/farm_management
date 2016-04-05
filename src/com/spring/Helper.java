
package com.spring;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.logging.Logger;

import javax.jdo.PersistenceManager;
import javax.jdo.Query;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;

@Controller
public class Helper 
{
    private static final Logger log = Logger.getLogger(Helper.class.getName());
    public String constructOauthData(String code, String client_id, String remoteHost, String client_secret, String grant_type) 
    {
	        String 	data 	= 		null;
	        try 
	        {
	            	data = "code=" + code + "&client_id=" + client_id + "&redirect_uri=" + remoteHost + "/oauth2callback" + "&client_secret=" + client_secret + "&grant_type=" + grant_type;
	        }
	        catch (Exception e) 
	        {
	            	log.info("Exception constructOauthData ::" + e);
	        }
	        log.info("the data retunred is ::" + data);
	        return data;
    }

    public String getAccessToken(String data, String URL2) 
    {
    		String 		tokenResponse 		= 		null;
    		String 		accessToken 			= 		null;
    		Map	 		result 						= 		null;
    		ObjectMapper objectMapper = 		null;
        try 
        {
            	log.info("data :: " + data);
            	log.info("URL :: " + URL2);
            	result 					= 		new HashMap();
            	objectMapper 		= 		new ObjectMapper();
            	tokenResponse 	= 		new UrlFetch().httpPost(data, URL2, "POST");
            	result 					= 		(Map)objectMapper.readValue(tokenResponse, (Class)HashMap.class);
            	log.info("Result ::" + result);
            	accessToken 		= 		result.get("access_token").toString();
        }
        catch (Exception e) 
        {
        		log.info("Exception getAccessToken :: " + e.getMessage());
        }
        return accessToken;
    }

    public JSONObject callGoogleAPI(String callGoogleAPIURL, String accessToken, String APIkey) 
    {
        JSONObject getresponse = null;
        try 
        {
           		getresponse = new UrlFetch().httpGET(String.valueOf(callGoogleAPIURL) + accessToken + "&key=" + APIkey, 0);
           		log.info("dsfdsf ::"+getresponse.toString());
        }
        catch (Exception e) 
        {
        		log.info("Exception callGoogleAPI :: " + e.getMessage());
        }
        return getresponse;
    }

    public String constructRedirectURL(String state, String authenticateURL, String remoteHost, String response_type, String client_id, String approval_prompt) 
    {
        String oAuthURL = null;
        try 
        {
            oAuthURL = String.valueOf(authenticateURL) + state + "&redirect_uri=" + remoteHost + "/oauth2callback" + "&response_type=" + response_type + "&client_id=" + client_id + "&approval_prompt=" + approval_prompt;
        }
        catch (Exception e) 
        {
            log.info("Exception constructRedirectURL :: " + e.getMessage());
        }
        return oAuthURL;
    }

    public HashMap<String, Object> validateUser(JSONObject GoogleAPIResponse, HttpSession session) 
    {
        	HashMap<String, Object> responseMap 	= 		null;
        	List<Entry> 						  listEntry 			= 		null;
            Query 								  QueryLists 		= 		null;
            PersistenceManager 		  pmf 					= 		null;
            HashMap<String, Entry>   userMap 			= 		null;
                try 
                {
                    	pmf 						= 		PMF.get().getPersistenceManager();
                    	userMap 				= 		new HashMap<String, Entry>();
                    	responseMap 		= 		new HashMap<String, Object>();
                    	QueryLists 			= 		pmf.newQuery(Entry.class, "email == '" + GoogleAPIResponse.get("email").toString() + "'");
                    	listEntry 				=  	(List<Entry>) QueryLists.execute();
                    	log.info("persist here ::" + listEntry);
                    	
                    	if (listEntry.size() == 0) 
                    	{
                    		for (Entry value : listEntry) 
                    		{
		                            session.setAttribute("userkey", value.getKey().toString());
		                            session.setAttribute("profession", value.getProfession());
		                            session.setAttribute("phone", value.getPhonenumber());
		                            session.setAttribute("organization", value.getOrganization());
                    		}
                    			 session.setAttribute("isNewUser", "false");
                    	}
                    	else
                    	{
                    		  session.setAttribute("isNewUser", "true");
                    	}
			                    log.info("new :: " + GoogleAPIResponse);
			                    session.setAttribute("email", GoogleAPIResponse.getString("email"));
			                    session.setAttribute("name", GoogleAPIResponse.getString("name"));
			                    session.setAttribute("profilepic", GoogleAPIResponse.getString("picture"));
			                    session.setAttribute("gender", GoogleAPIResponse.getString("gender"));
                }
                catch (Exception e)
                {
	                    log.info("Exception validateUser :: " + e.getMessage());
                }
                finally 
                {
                	if (pmf != null) 
                	{
                		pmf.close();
                	}
                	System.out.println("session session ::"+session);
                }
                return responseMap;
    }

    public String persistNewUser(HttpServletRequest request, String name, String organization, String email, String phone, String gender, String profession) 
    {
        	String 	password 		= 		null;
        	String 	profilepic 		= 		null;
        	UUID 	uniqueKey 		= 		null;
        	Entry 	enter 				= 		null;
        	Date 	date 				= 		null;
        	PersistenceManager pmf = null;
            try 
            {
	                log.info("persist validateUser :: ");
	                enter 			= 		new Entry();
	                HttpSession session = request.getSession();
	                pmf 				= 			PMF.get().getPersistenceManager();
	                profilepic 	= 			(String)session.getAttribute("profilepic");
	                date 			= 			new Date();
	                uniqueKey 	= 			UUID.randomUUID();
	                password 	= 			"";
	                enter.setEmail(email);
	                enter.setGender(gender);
	                enter.setKey(uniqueKey.toString());
	                enter.setName(name);
	                enter.setDate(date);
	                enter.setPassword(password);
	                enter.setPhonenumber(phone);
	                enter.setProfilepic(profilepic);
	                enter.setProfession(profession);
	                enter.setOrganization(organization);
	                pmf.currentTransaction().begin();
	                pmf.makePersistent(enter);
	                pmf.currentTransaction().commit();
            }
            catch (Exception e) 
            {
                log.info("Exception validateUser :: " + e.getMessage());
                if (pmf != null)
                {
                    pmf.close();
                }
            }
        finally 
        {
            if (pmf != null) 
            {
                pmf.close();
            }
        }
        return "success";
    }
    public String persistfarm(String useremail, String fieldname, String location, String soiltype, String ownership, String totalarea, String climatetype, String weather, String pesticides, String fav_culti,String usernotes )
    {
    	UUID 		uniqueKey 			= 		null;
    	farmdata 	farmdatas 			= 		null;
    	Date 		date 				= 		null;
    	PersistenceManager pmf 			= 		null;
        try 
        {
        	farmdatas 				= 		new farmdata();
             pmf 					= 		PMF.get().getPersistenceManager();
             date 					= 			new Date();
             uniqueKey 				= 			UUID.randomUUID();
             farmdatas.setUseremail(useremail);
             farmdatas.setFieldname(fieldname);
             farmdatas.setKey(uniqueKey.toString());
             farmdatas.setLocation(location);
             farmdatas.setDatetime(date.toGMTString());
             farmdatas.setSoiltype(soiltype);
             farmdatas.setOwnership(ownership);
             farmdatas.setTotalarea(totalarea);
             farmdatas.setClimatetype(climatetype);
             farmdatas.setWeather(weather);
             farmdatas.setPesticides(pesticides);
             farmdatas.setFav_culti(fav_culti);
             farmdatas.setUsernotes(usernotes);
             pmf.currentTransaction().begin();
             pmf.makePersistent(farmdatas);
             pmf.currentTransaction().commit();
        }
        catch(Exception e)
        {
        	log.info("Exception persistfarm :: " + e.getMessage());
            if (pmf != null)
            {
                pmf.close();
            }
        }
        finally
        {
        	 if (pmf != null)
             {
                 pmf.close();
             }
        }
    	return "success";
    }
}