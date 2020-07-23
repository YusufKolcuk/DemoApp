package com.xperta.pdf;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.xperta.entity.City;;

 
@Controller
public class PDFController {
 
// @RequestMapping(value = "/generate/pdf.htm", method = RequestMethod.GET)
// ModelAndView generateExcel(HttpServletRequest request,
//   HttpServletResponse response) throws Exception {
//  System.out.println("Calling generatePDF()...");
//  
//
//  
//// get one city by using dao
//  
//  
//
////  ModelAndView modelAndView = new ModelAndView("pdfView", "PweatherForecasts",c1);
//  
////  return modelAndView;
// }
}