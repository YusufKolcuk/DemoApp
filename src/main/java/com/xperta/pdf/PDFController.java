package com.xperta.pdf;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.xperta.entity.WeatherForecast;;

 
@Controller
public class PDFController {
 
 @RequestMapping(value = "/generate/pdf.htm", method = RequestMethod.GET)
 ModelAndView generateExcel(HttpServletRequest request,
   HttpServletResponse response) throws Exception {
  System.out.println("Calling generatePDF()...");
  

  
  WeatherForecast c1 = new WeatherForecast();
  c1.setWeatherId(1);
  c1.setCity("Istanbul");
  c1.setMinimumWF(32);
  c1.setMaximumWF(39);
  
  
  

  ModelAndView modelAndView = new ModelAndView("pdfView", "PweatherForecasts",c1);
  
  return modelAndView;
 }
}