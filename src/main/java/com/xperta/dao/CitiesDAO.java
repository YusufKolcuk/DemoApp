package com.xperta.dao;

import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import org.hibernate.SessionFactory;
import com.xperta.entity.Cities;

@Repository
public class CitiesDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	public Cities getAllCities(String name,int value){
		Query query = sessionFactory.getCurrentSession().createQuery("FROM User ");
			Cities cities=null;
			try {
				cities= (Cities) query.getSingleResult();

			} catch (Exception e) {
				cities=null;
			}
			return cities;	
	}
}
