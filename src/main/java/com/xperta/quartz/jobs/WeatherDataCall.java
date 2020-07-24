package com.xperta.quartz.jobs;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

public class WeatherDataCall implements Job{

	@Override
	public void execute(JobExecutionContext context) throws JobExecutionException {
		// TODO Auto-generated method stub
		String urlParameters=null;
		try {
			urlParameters = "fName=" + URLEncoder.encode("???", "UTF-8") +
			"&lName=" + URLEncoder.encode("???", "UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		WeatharDataJob.executePost("http://api.openweathermap.org/data/2.5/group?id=4099974&appid=294fcf03ced531801723f6d093726c4c&units=metric", urlParameters);
	}
	

}
