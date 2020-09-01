 package com.xperta.core;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.xperta.entity.City;
import com.xperta.pdf.PDFJService;
import com.xperta.service.CitiesService;

import net.sf.jasperreports.engine.JRException;

@Controller
public class HomeController {

	 @Autowired
	 PDFJService pdfService;

	//Yusuf Kolcuk 6
	private static final Logger Log=LoggerFactory.getLogger(HomeController.class);
	public static String url = "http://localhost:8080/core/";
	@Autowired
	private CitiesService citiesService;
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(Model model,HttpServletRequest req) {
		model.addAttribute("user",req.getSession().getAttribute("user"));
		return "home";
	}
	@RequestMapping(value = "/table")
	public ModelAndView  table(Model mdl,ModelAndView  model,HttpServletRequest req) {
		mdl.addAttribute("user",req.getSession().getAttribute("user"));
		List<City> cities = citiesService.getAllCities();
		model.addObject("cities", cities);
		model.setViewName("table");
		Log.info("trial 1 ");
		
		return model;
	}	

	//delete datatable row 
	@RequestMapping(value="table/delete/{id}")
	public String RowDelete(@PathVariable("id") Long city_id){
		City  city=citiesService.getCityById(city_id);
		if(city != null) {
			citiesService.delete(city);	
		}
 		 return "redirect:/table";
	}

	//delete datatable row 
	@RequestMapping(value="table/add/{id}")
	public String RowAdd(@PathVariable("id") Long city_id){
		City addCity=new City();
		addCity.setId(city_id);
		addCity.setName("Waiting");
		addCity.setDesc("Waiting");
		addCity.setLat(0.0);
		addCity.setLon(0.0);
		addCity.setTemp(0.0);
		addCity.setTempMax(0.0);
		addCity.setTempMin(0.0);
		addCity.setHumidity(0.0);
		addCity.setPressure(0.0);
		/*
		ArrayList<City>	keyVal=citiesService.getAllId();
		for (City getKeyUniq : keyVal) {
			if(getKeyUniq.equals(addCity.getId())) {
				return "error_404";
			}
		}
		*/
		
		citiesService.create(addCity);
	
 		return "redirect:/table";
	}
	
	
	@RequestMapping(value = "/error_404", method = RequestMethod.GET)
	public String error_404(Model model) {
		
		return "error_404";
	}
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String homePage (Model model) {
		
		return "welcome_page";
	}
	
	 
	 
	 
	 @RequestMapping(value = "/table/{format}")
	 public String generatePdfJasper(@PathVariable String format, HttpServletRequest request,
				HttpServletResponse response) throws JRException, IOException {
		 pdfService.jasperReport(format,response);
		 
	  return "redirect:/table";
	 }
	
	 
	
}
