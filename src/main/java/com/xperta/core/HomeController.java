 package com.xperta.core;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.xperta.service.CitiesService;



@Controller
public class HomeController {
	
	public static String url = "http://localhost:8080/core/";
	@Autowired
	CitiesService citiesService;
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main(Model model) {
		
		return "redirect:/login";
	}
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(Model model,HttpServletRequest req) {
		model.addAttribute("user",req.getSession().getAttribute("user"));
		return "home";
	}
	
	
	@RequestMapping(value = "/error_404", method = RequestMethod.GET)
	public String error_404(Model model) {
		
		return "error_404";
	}
	
	@RequestMapping(value = "/table", method = RequestMethod.GET)
	public String table(Model model) throws InvalidFormatException, IOException {
		
		return "table";
		
	}
	
	

	
}
