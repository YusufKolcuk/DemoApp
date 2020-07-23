package com.xperta.dao;

import java.util.List;

import javax.persistence.Query;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CitiesDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	public List getAllCities(){
		Query query = sessionFactory.getCurrentSession().createQuery("FROM cities");
			try {
				return query.getResultList();
			} catch (Exception e) {
				System.err.println(e.getMessage());
			}
			return null;	
	}
}
