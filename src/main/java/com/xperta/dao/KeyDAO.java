package com.xperta.dao;

import java.util.ArrayList;

import javax.persistence.Query;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.xperta.entity.Key;

@Repository

public class KeyDAO {

	@Autowired
	private SessionFactory sessionFactory;

	public ArrayList<Key> getAllCities() {
		Query query = sessionFactory.getCurrentSession().createQuery("select key FROM Key");

		return (ArrayList<Key>) query.getResultList();
	}

}
