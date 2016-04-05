
package com.spring;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.logging.Level;
import java.util.logging.Logger;


import org.json.JSONException;
//import org.json.simple.JSONObject;
import org.json.JSONObject;

public class UrlFetch {
    private static final Logger log = Logger.getLogger(UrlFetch.class.getName());

    public JSONObject httpGET(String urlAndParam, int count) throws JSONException
    {
        URL url = null;
        JSONObject responseObject = new JSONObject();
        try 
        {
            String inputLine;
            url = new URL(urlAndParam);
            String inputToJson = "";
            HttpURLConnection conn = (HttpURLConnection)url.openConnection();
            conn.setRequestMethod("GET");
            conn.connect();
            BufferedReader readers = new BufferedReader(new InputStreamReader(url.openStream()));
            while ((inputLine = readers.readLine()) != null) 
            {
                inputToJson = String.valueOf(inputToJson) + inputLine;
            }
            System.out.println("inputToJson ::" + inputToJson);
                JSONObject googleUserDetails = new JSONObject(inputToJson);
                if(googleUserDetails.has("email"))
                {
                	String emailId = googleUserDetails.getString("email");
                	 responseObject.put("email", emailId);
                }
                else
                {
                	responseObject.put("email", "");
                }
                if(googleUserDetails.has("name"))
                {
                	String firstName = googleUserDetails.getString("name");
                	responseObject.put("name", firstName);
                }
                else
                {
                	responseObject.put("name", "");
                }
                if(googleUserDetails.has("picture"))
                {
                	String picture = googleUserDetails.getString("picture");
                	responseObject.put("picture", picture);
                }
                else
                {
                	responseObject.put("picture", "");
                }
                if(googleUserDetails.has("gender"))
                {
                	String gender = googleUserDetails.getString("gender");
                	responseObject.put("gender", gender);
                }
                else
                {
                	responseObject.put("gender", "");
                }
                System.out.println("responseObject ::"+responseObject);
            conn.disconnect();
        }
        catch (Exception ex) 
        {
        	System.out.println("exception :: "+ ex);
            ex.printStackTrace();
        }
        return responseObject;
    }

    public String httpPost(String content, String urlAndParam, String type) 
    {
        String 			line 		= 		null;
        StringBuffer line1 	= 		null;
        URL 				url 		= 		null;
        BufferedReader reader 	= 		null;
        String response 				= 		null;
        log.info("Inside  httpPost method :" + content);
        try 
        {
            line1 		= 		new StringBuffer();
            url 			= 		new URL(urlAndParam);
            log.info("Url to call :: " + url);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setDoOutput(true);
            con.setUseCaches(false);
            con.setRequestMethod("POST");
            con.setConnectTimeout(60000);
            con.setReadTimeout(60000);
            con.setRequestProperty("Host", "accounts.google.com");
            con.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
            log.info("Content is  : " + content);
            OutputStreamWriter out = new OutputStreamWriter(con.getOutputStream());
            out.write(content);
            out.close();
            log.info("Response Code : " + con.getResponseCode());
            if (con.getResponseCode() == 200) 
            {
                reader = new BufferedReader(new InputStreamReader(con.getInputStream()));
                log.info("The tostring of reader is  :  " + reader);
                while ((line = reader.readLine()) != null) 
                {
                    line1.append(line);
                }
                response = line1.toString();
            }
            log.info("The response from the service is  : " + response);
        }
        catch (IOException e) 
        {
            log.log(Level.SEVERE, e.getMessage(), e);
        }
        catch (Exception e) 
        {
            log.log(Level.SEVERE, e.getMessage(), e);
        }
        return response;
    }
}