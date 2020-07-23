package com.xperta.quartz.jobs;

import java.util.List;

import com.xperta.dao.CitiesDAO;
import com.xperta.entity.City;

/**
 * 
 * this quartz job updates weather data of all cities from cities table ..
 * 
 * @author xperta
 *
 */
public class WeatharDataJob {

	
	CitiesDAO citiesDao;
	
	
	// get data from webservice for cities defined in table
	private List<City> getAllCitiesFromDB() {
		return citiesDao.getAllCities();
	}
}
