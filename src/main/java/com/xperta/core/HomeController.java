 package com.xperta.core;

import java.io.FileNotFoundException;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

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

	//testtt
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
	public ModelAndView  table(ModelAndView  model,HttpServletRequest req) {
		List<City> cities = citiesService.getAllCities();
		model.addObject("cities", cities);
		model.setViewName("table");
		Log.info("trial 1 ");
		
		return model;
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
	 public String generatePdfJasper(@PathVariable String format) throws FileNotFoundException,JRException {
		 pdfService.jasperReport(format);
	  return "redirect:/table";
	 }
	

	
}
