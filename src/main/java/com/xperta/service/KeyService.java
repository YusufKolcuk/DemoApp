package com.xperta.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xperta.dao.KeyDAO;
import com.xperta.entity.Key;

@Service
@Transactional
public class KeyService {
	@Autowired
	KeyDAO keyDAO;
	
	public ArrayList<Key> getAllCities(){
		 return keyDAO.getAllCities();
	}
}
