package com.xperta.pdf;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.xperta.entity.City;
import com.xperta.service.CitiesService;;

 
@Controller
public class PDFController {
 @Autowired
 CitiesService citiesService;
 
 
 @RequestMapping(value = "/generate/pdf.htm", method = RequestMethod.GET)
 ModelAndView generatePdf(HttpServletRequest request, HttpServletResponse response) throws Exception {
  System.out.println("Calling generatePDF()...");
  List<City> pdf_obj = citiesService.getAllCities();

  ModelAndView modelAndView = new ModelAndView("pdfView", "pdf_obj", pdf_obj);
  return modelAndView;
 }
}