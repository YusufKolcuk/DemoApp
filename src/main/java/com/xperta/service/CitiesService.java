package com.xperta.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xperta.dao.CitiesDAO;
import com.xperta.entity.City;

/**
 * class to get weather data from an external page
 * 
 * @author xperta
 *
 */

@Service
@Transactional
public class CitiesService {
	@Autowired
	 private CitiesDAO citiesDAO;
   
	@Transactional
	public Long create(City city, HttpServletRequest request){
		return citiesDAO.insert(city);
	}
	
	
	
	 public ArrayList<City> getAllCities(){
		 return citiesDAO.getAllCities();
	 }
	 
	
	
}
