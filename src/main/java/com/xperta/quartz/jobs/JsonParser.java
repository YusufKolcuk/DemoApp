package com.xperta.quartz.jobs;

import org.json.JSONArray;
import org.json.JSONObject;

public class JsonParser {
	public static String  name,description;
	public static int id;
	public static Double temp_min,temp_max,temp,humidity,pressure,lat,lon;

	public static void WFJson(){
		Object response2=WeatharDataJob.response;
		JSONObject myrespose=new JSONObject(response2.toString());
	    System.out.println(myrespose);
	    System.out.println("cnt : "+myrespose.getInt("cnt"));

	    JSONArray json_array = new JSONArray(myrespose.getJSONArray("list").toString());
	    System.out.println("liste : " +json_array);
	    for(int i=0;i<json_array.length();i++){
	    	JSONObject object = json_array.getJSONObject(i);
	    	int visibility = object.getInt("visibility");
	    	id= object.getInt("id");
	    	name=object.getString("name");
	    	JSONObject coord_obj=object.getJSONObject("coord");
	    	 lon = coord_obj.getDouble("lon");
	    	 lat = coord_obj.getDouble("lat");
	    	JSONArray weather_ary=object.getJSONArray("weather");
	    	System.out.println("weather_ary : "+weather_ary);
	    	for (int j=0;j<1;j++) {
		    	JSONObject weather_obj = weather_ary.getJSONObject(j);
		    	description=weather_obj.getString("main");
		    	System.out.println("description : "+description);
		    	
			}
	    	JSONObject main_obj=object.getJSONObject("main");
	    	 temp_min = main_obj.getDouble("temp_min");
	    	 temp_max = main_obj.getDouble("temp_max");
	    	 temp = main_obj.getDouble("temp");
	    	 humidity = main_obj.getDouble("humidity");
	    	 pressure = main_obj.getDouble("pressure");


	    	System.out.println("name : "+name);
	    	System.out.println("lon : "+lon);
	    	System.out.println("lat : "+lat);
	    	//System.out.println("description : "+ description);
	    	System.out.println("id : " + visibility);
	    	System.out.println("dt : " + id);
	    	System.out.println("temp_min : "+temp_min);
	    	System.out.println("temp_maxs : "+temp_max);

	

	    	
	    }
	}
}
