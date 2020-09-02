package com.xperta.dao;

import java.util.ArrayList;

import javax.persistence.Query;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.xperta.entity.User;
import com.xperta.entity.UserRole;
import com.xperta.security.Encryption;

@Repository
public class UserDAO {
	
	@Autowired
	private SessionFactory sessionFactory;

	public Long insert(User user) {
		user.setPass(Encryption.sha256(user.getPass()));
		return (Long) sessionFactory.getCurrentSession().save(user);
	}
	
	public Long save(UserRole userRole) {
		return (Long) sessionFactory.getCurrentSession().save(userRole);
	}

	public void update(User user) {
		sessionFactory.getCurrentSession().update(user);
	}

	public ArrayList<User> getAll() {
		Query query = sessionFactory.getCurrentSession().createQuery("select email FROM User");
		return (ArrayList<User>) query.getResultList();

	}

	// read
	public User getFindByUsernameAndPass(String username, String pass) {
		String password = Encryption.sha256(pass);
		Query query = sessionFactory.getCurrentSession()
				.createQuery("FROM User WHERE username=:username AND pass=:pass AND active=:active")
				.setString("username", username).setString("pass", password).setBoolean("active", true);
		User user = null;
		try {
			user = (User) query.getSingleResult();

		} catch (Exception e) {
			user = null;
		}
		return user;
	}

	// user solo
	public User getFindByUsername(String username) {
		Query query = sessionFactory.getCurrentSession().createQuery("FROM User WHERE username=:username")
				.setString("username", username);
		return (User) query.getSingleResult();
	}

	public User getFindByKey(String key) {
		Query query = sessionFactory.getCurrentSession().createQuery("FROM User WHERE keyreg=:key").setString("key",key);

		User user = null;
		try {
			user = (User) query.getSingleResult();

		} catch (Exception e) {
			user = null;
		}
		return user;
	}
	
	// setLong () function in hibernate is DEPRECATED!!
	public Boolean checkAdmin(User user) {
		Query query = sessionFactory.getCurrentSession().createQuery("FROM UserRole WHERE usr_id=:usr_id").setLong("usr_id", user.getId());
		UserRole userRole = null;
		try {
			userRole = (UserRole) query.getSingleResult();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return (0==userRole.getRole_id());
	}
}
