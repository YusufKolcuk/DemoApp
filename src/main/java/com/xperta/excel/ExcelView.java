package com.xperta.excel;

import java.util.List;
import java.util.Map;
 
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.web.servlet.view.document.AbstractExcelView;

import com.xperta.entity.City;;


public class ExcelView extends AbstractExcelView {
	 @Override
	 protected void buildExcelDocument(Map model, HSSFWorkbook workbook,
	   HttpServletRequest request, HttpServletResponse response)
	   throws Exception {
 
  List<City> citys =   (List) model.get("cities");

  HSSFSheet sheet = workbook.createSheet("WF Report");
  HSSFRow header = sheet.createRow(0);
  header.createCell(0).setCellValue("City Name");
  int counter = 1;
  for (Object city_exc : citys) {
	  HSSFRow row = sheet.createRow(counter++);
	  row.createCell(0).setCellValue(((City) city_exc).getName());

  }
	  
 }
}