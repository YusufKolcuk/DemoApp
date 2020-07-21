package com.xperta.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xperta.dao.ExcelTabDAO;
import com.xperta.entity.ExcelTab;

@Service
@Transactional
public class ExcelTabService {
	@Autowired
	 private ExcelTabDAO excelTabDAO;
    
	@Transactional
	public Long create(ExcelTab excelTab, HttpServletRequest request){
		return excelTabDAO.insert(excelTab);
	}
	
	
	
	 public ArrayList<ExcelTab> getAllCities(){
		 return excelTabDAO.getAllCities();
	 }
}
