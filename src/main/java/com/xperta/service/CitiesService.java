package com.xperta.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xperta.dao.CitiesDAO;
import com.xperta.entity.Cities;

@Service
@Transactional
public class CitiesService {
	 @Autowired
	 private CitiesDAO citiesDAO;
	 
	 public Cities getAllCities(Cities cities){
		 return citiesDAO.getAllCities(cities.getName(), cities.getValue());
	 }
}
