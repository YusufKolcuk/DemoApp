package com.xperta.quartz.jobs;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.json.JSONArray;
import org.json.JSONObject;

import com.xperta.dao.CitiesDAO;

/**
 * 
 * this quartz job updates weather data of all cities from cities table in 5 minutes intervall ..
 * 
 * @author xperta
 *
 */
public class WeatharDataJob {
	public static StringBuilder response;
	
	CitiesDAO citiesDao;
	
	
//	// get data from webservice for cities defined in table
//	private List<City> getAllCitiesFromDB() {
//		return citiesDao.getAllCities();
//	}
//	
//	// update weather data in cities table
//	private void updateWeatherData() {
//		String keys = "";
//		List<City> cities = new ArrayList<City>();
//		for (City city : cities) {
//			keys += city.getKey() + ", ";
//		}
//		
//		//HttpURLConnection url = new 
//		//String url = "http://api.openweathermap.org/data/2.5/group?id=" +  keys + "&appid=294fcf03ced531801723f6d093726c4c&units=metric";
//		
//		//http://api.openweathermap.org/data/2.5/group?id=4099974&appid=294fcf03ced531801723f6d093726c4c&units=metric
//	
//	
//	}
	
	
	
	public static String executePost(String targetURL, String urlParameters) {
		  HttpURLConnection connection = null;
		  try {
		    //Create connection
		    URL url = new URL(targetURL);
		    connection = (HttpURLConnection) url.openConnection();
		    connection.setRequestMethod("POST");
		    connection.setRequestProperty("Content-Type","application/x-www-form-urlencoded");
		    connection.setRequestProperty("Content-Length", Integer.toString(urlParameters.getBytes().length));
		    connection.setRequestProperty("Content-Language", "en-US");  
		    connection.setUseCaches(false);
		    connection.setDoOutput(true);

		    //Send request
		    DataOutputStream wr = new DataOutputStream (connection.getOutputStream());
		    wr.writeBytes(urlParameters);
		    wr.close();

		    //Get Response  
		    InputStream is = connection.getInputStream();
		    BufferedReader rd = new BufferedReader(new InputStreamReader(is));
		    response = new StringBuilder(); // or StringBuffer if Java version 5+
		    String line;
		    while ((line = rd.readLine()) != null) {
		      response.append(line);
		      response.append('\r');
		    }
		    rd.close();
		    System.out.println(response);
		    

		    JsonParser.WFJson();
		    
		    
		    
		    return response.toString();
		  } catch (Exception e) {
		    e.printStackTrace();
		    return null;
		  } finally {
		    if (connection != null) {
		      connection.disconnect();
		    }
		  }
		}
	
	
}
