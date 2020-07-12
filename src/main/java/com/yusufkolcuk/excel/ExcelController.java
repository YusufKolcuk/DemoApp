package com.yusufkolcuk.excel;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.yusufkolcuk.excel.WeatherForecast;;

 
@Controller
public class ExcelController {
 
 @RequestMapping(value = "/generate/excel.htm", method = RequestMethod.GET)
 ModelAndView generateExcel(HttpServletRequest request,
   HttpServletResponse response) throws Exception {
  System.out.println("Calling generateExcel()...");
  
  WeatherForecast c1 = new WeatherForecast();
  c1.setWeatherId(1);
  c1.setCity("Istanbul");
  c1.setMinimumWF(32);
  c1.setMaximumWF(39);
  
  WeatherForecast c2 = new WeatherForecast();
  c2.setWeatherId(2);
  c2.setCity("Ankara");
  c2.setMinimumWF(28);
  c2.setMaximumWF(33);
  
  WeatherForecast c3 = new WeatherForecast();
  c3.setWeatherId(3);
  c3.setCity("Malatya");
  c3.setMinimumWF(33);
  c3.setMinimumWF(37);
  
  List weatherForecasts = new ArrayList();
  weatherForecasts.add(c1);
  weatherForecasts.add(c2);
  weatherForecasts.add(c3);
  
  ModelAndView modelAndView = new ModelAndView("excelView", "weatherForecasts",weatherForecasts);
  
  return modelAndView;
 }
}