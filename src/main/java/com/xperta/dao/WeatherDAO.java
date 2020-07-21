package com.xperta.dao;

import javax.persistence.Query;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.xperta.entity.User;
import com.xperta.entity.WeatherForecast;

@Repository
public class WeatherDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	public Long insert(WeatherForecast weatherForecast){
		return  (Long) sessionFactory.getCurrentSession().save(weatherForecast);
	}
	
	public void update(WeatherForecast weatherForecast){
		sessionFactory.getCurrentSession().update(weatherForecast);
	}
	
	public WeatherForecast getFindWF(String City,int MinimumWF,int MaximumWF){
		Query query = sessionFactory.getCurrentSession().createQuery("FROM WeatherForecast WHERE City=:City AND MinimumWF=:MinimumWF AND MaximumWF=:MaximumWF")
				.setString("City", City)
				.setInteger("MinimumWF", MinimumWF)
				.setInteger("MaximumWF", MaximumWF);
		 WeatherForecast wf=null;
		return wf;
	}
	
	
	
}
