package com.xperta.quartz.jobs;


import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.stereotype.Component;

@Component("reportCurrentTime")
public class ReportCurrentTime
{

    private static final SimpleDateFormat dateFormat = new SimpleDateFormat(
            "HH:mm:ss");

    public void printCurrentTime()
    {
    	String urlParameters=null;
		try {
			urlParameters = "fName=" + URLEncoder.encode("???", "UTF-8") +
			"&lName=" + URLEncoder.encode("???", "UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String key[]={
				"2633352","2643741","2644688","2654675","2911298","2925535","2950159","2988507","2990969","3120501","3128760","4099974","4140963","4440906"
		};
		for (String push : key) {
			WeatharDataJob.executePost("http://api.openweathermap.org/data/2.5/group?id="+push+"&appid=294fcf03ced531801723f6d093726c4c&units=metric", urlParameters);

		}
        System.out.println("Current time = " + dateFormat.format(new Date()));
    }

}