package com.xperta.dao;

import java.util.ArrayList;

import javax.persistence.Query;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.xperta.entity.ExcelTab;

@Repository
public class ExcelTabDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	public Long insert(ExcelTab excelTab){
		return (Long) sessionFactory.getCurrentSession().save(excelTab);
	}
 	
	public void update(ExcelTab excelTab){
		sessionFactory.getCurrentSession().update(excelTab);
	}
	public void persist(ExcelTab excelTab){
		sessionFactory.getCurrentSession().persist(excelTab);
	}
	
	
	public ArrayList<ExcelTab> getAllCities(){
		Query query = sessionFactory.getCurrentSession().createQuery("FROM ExcelTab");
		
			return (ArrayList<ExcelTab>) query.getResultList();	
	}
}
