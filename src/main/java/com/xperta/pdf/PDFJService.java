package com.xperta.pdf;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

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
import net.sf.jasperreports.engine.data.JRAbstractBeanDataSource;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;

@Service
public class PDFJService {
	@Autowired
	public CitiesService citiesService;
	
	public String jasperReport(String jasperReport) throws FileNotFoundException, JRException {
		
		String path = "C:\\Users\\user\\Desktop\\Report";
		List<City> citys=citiesService.getAllCities();
		File file=ResourceUtils.getFile("classpath:cities.jrxml");
		JasperReport jasReport=JasperCompileManager.compileReport(file.getAbsolutePath());
		JRAbstractBeanDataSource dataSource = new JRBeanCollectionDataSource(citys);
		Map<String,Object> param=new HashMap<>();
		param.put("Weather Forecast", getRandomString());
		JasperPrint jasperPrint=JasperFillManager.fillReport(jasReport, param,dataSource);
		if(jasperReport.equalsIgnoreCase("pdf")) {
			JasperExportManager.exportReportToPdfFile(jasperPrint,path+"\\cities.pdf");
		}
	
		return "report generated in path : " + path;
		
	}

	private String getRandomString() {
		// TODO Auto-generated method stub
		return UUID.randomUUID().toString();
	}
	

}
