package com.xperta.pdf;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.ResourceUtils;

import com.xperta.entity.City;
import com.xperta.service.CitiesService;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;


@Service
public class PDFService {
		@Autowired
		public CitiesService citiesService;
		
		
		public String exportReport(String reportFormat) throws FileNotFoundException, JRException {
			/*
		        List<City> citys = citiesService.getAllCities();
				File file=ResourceUtils.getFile("classpath:cities.jrxml");
		        JasperReport jasperReport = JasperCompileManager.compileReport(file.getAbsolutePath());
		        JRBeanCollectionDataSource dataSource = new JRBeanCollectionDataSource(citys);
		        Map<String, Object> parameters = new HashMap<>();
		        parameters.put("createdBy", "Weather Forecast");
		        JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parameters, dataSource);
		        if (reportFormat.equalsIgnoreCase("pdf")) {
		            JasperExportManager.exportReportToPdfFile(jasperPrint, "C:\\Users\\user\\Desktop\\Report\\cities.pdf");
		        }
		
		        return "report generated in path : " + "C:\\Users\\user\\Desktop\\Report";
		   */
			return reportFormat;
	}

}