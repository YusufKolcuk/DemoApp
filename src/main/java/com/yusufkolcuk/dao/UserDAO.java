package com.yusufkolcuk.dao;

import javax.persistence.Query;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yusufkolcuk.entity.User;
import com.yusufkolcuk.security.Encryption;

@Repository
public class UserDAO {
	@Autowired
	private SessionFactory sessionFactory;
	public Long insert(User user){
		user.setPass(Encryption.sha256(user.getPass()));
		return (Long) sessionFactory.getCurrentSession().save(user);
	}
	
	public void update(User user){
		sessionFactory.getCurrentSession().update(user);
	}
	
	//read
	public User getFindByUsernameAndPass(String username, String pass){
		String password= Encryption.sha256(pass);
		Query query = sessionFactory.getCurrentSession().createQuery("FROM User WHERE username=:username AND pass=:pass AND active=:active")
				.setString("username", username)
				.setString("pass", password)
				.setBoolean("active", true);
		User user=null;
		try {
			user= (User) query.getSingleResult();

		} catch (Exception e) {
			user=null;
		}
		return user;
	}
	
	//user solo
	public User getFindByUsername(String username){
		Query query = sessionFactory.getCurrentSession().createQuery("FROM User WHERE username=:username")
				.setString("username", username);
		return (User) query.getSingleResult();
	}
	
	public User getFindByKey(String key){
		Query query = sessionFactory.getCurrentSession().createQuery("FROM User WHERE keyreg=:key")
				.setString("key", key);
		
		User user=null;
		try {
			user= (User) query.getSingleResult();

		} catch (Exception e) {
			user=null;
		}
		return user;
	}
}
