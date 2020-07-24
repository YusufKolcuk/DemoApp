package com.xperta.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Query;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.xperta.entity.City;

@Repository
public class CitiesDAO {
	@Autowired
	private SessionFactory sessionFactory;

	public Long insert(City city){
		return (Long) sessionFactory.getCurrentSession().save(city);
	}
 	
	public void update(City city){
		sessionFactory.getCurrentSession().update(city);
	}
	public void persist(City city){
		sessionFactory.getCurrentSession().persist(city);
	}
	
	
	public ArrayList<City> getAllCities(){
		Query query = sessionFactory.getCurrentSession().createQuery("FROM City");
		
			return (ArrayList<City>) query.getResultList();	
	}
	
	
	
	
	public List getAllCitiess(){
		Query query = sessionFactory.getCurrentSession().createQuery("FROM cities");
			try {
				return query.getResultList();
			} catch (Exception e) {
				System.err.println(e.getMessage());
			}
			return null;	
	}
}
