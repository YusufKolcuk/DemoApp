package com.xperta.service;

import java.util.ArrayList;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xperta.dao.UserDAO;
import com.xperta.entity.User;
import com.xperta.entity.UserRole;


/**
 * this class is used to get some commen user methods.. 
 * created on 01.09.2020
 * 
 * @author ykolcuk
 *
 */

@Service
@Transactional
public class UserService {
	
	@Autowired
	private MailService mailService;
	
	@Autowired
	private UserDAO userDAO;
	
	public Long insert(User user){
		// add user to users table!
		String uuid = UUID.randomUUID().toString();
		user.setKeyreg(uuid);
		
		Long success = userDAO.insert(user);
		if (success>0) {
			user.getId(); // TODO:check user id if its correct!
			
			UserRole userRole =  new UserRole();
			userRole.setUsr_id( user.getId());
			userRole.setRole_id(1l);
			userDAO.save(userRole);
		} else {
//			Logger (" suer can not be created!");
//			return false;
		}
		
		// user saved succesfully, actrivation mail sent ..
		if( success>0 ) {
			mailService.registerMail(user.getEmail(), user.getKeyreg());
		}
		return 1l;
	}
	
	public void update(User user) {
		userDAO.update(user);
	}
	
	public Boolean isAdmin(User user) {
		return userDAO.checkAdmin(user);
	}
	
	public User getFindByUsernameAndPass(User user) {
		return userDAO.getFindByUsernameAndPass(user.getUsername(),user.getPass());
	}
	
	public User getFindByUsername(String username) {
		return userDAO.getFindByUsername(username);
	}
	
	public boolean getFindByKey(String key){
		User user = userDAO.getFindByKey(key);
		if(user != null) {
			user.setActive(true);
			update(user);
			return true;
		} 
		return false;
	}
	
	public ArrayList<User> getAll(){
		return userDAO.getAll();
	}
}
