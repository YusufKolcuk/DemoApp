package com.xperta.excel;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.xperta.entity.City;;

 
@Controller
public class ExcelController {
 
 @RequestMapping(value = "/generate/excel.htm", method = RequestMethod.GET)
 ModelAndView generateExcel(HttpServletRequest request,
   HttpServletResponse response) throws Exception {
  System.out.println("Calling generateExcel()...");
  
  List<City> cities = null; // transfer data from db by usýng dao / table see weatherforecast table

  
  City city = new City();
  city.setName("Istanbul");
  city.setTempMin(32.0);
  city.setTempMax(39.0);
  cities.add(city);

  
  ModelAndView modelAndView = new ModelAndView("excelView", "cities", cities);
  
  return modelAndView;
 }
}