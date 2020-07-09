package com.yusufkolcuk.core;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yusufkolcuk.service.MailService;


@Controller
public class HomeController {
	
	public static String url = "http://localhost:8080/core/";
	
	@Autowired
	private MailService mailService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main(Model model) {
		
		return "redirect:/login";
	}
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(Model model) {
		
		return "home";
	}
	
	
	@RequestMapping(value = "/error_404", method = RequestMethod.GET)
	public String error_404(Model model) {
		
		return "error_404";
	}
	
}
