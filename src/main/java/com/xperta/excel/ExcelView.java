package com.xperta.excel;

import java.util.List;
import java.util.Map;
 
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.web.servlet.view.document.AbstractExcelView;

import com.xperta.entity.WeatherForecast;;


 
@SuppressWarnings("deprecation")
public class ExcelView extends AbstractExcelView {
 @Override
 protected void buildExcelDocument(Map model, HSSFWorkbook workbook,
   HttpServletRequest request, HttpServletResponse response)
   throws Exception {
 
  List<WeatherForecast> weatherForecasts = (List) model.get("weatherForecasts");
  HSSFSheet sheet = workbook.createSheet("WF Report");
  HSSFRow header = sheet.createRow(0);
  header.createCell(0).setCellValue("Weather Forecasts Id");
  header.createCell(1).setCellValue("City Name");
  header.createCell(2).setCellValue("Minimum");
  header.createCell(3).setCellValue("Maximum");
  int counter = 1;
  for (WeatherForecast e : weatherForecasts) {
	   HSSFRow row = sheet.createRow(counter++);
	   row.createCell(0).setCellValue(e.getWeatherId());
	   row.createCell(1).setCellValue(e.getCity());
	   row.createCell(2).setCellValue(e.getMinimumWF());
	   row.createCell(3).setCellValue(e.getMaximumWF());
	  }
 }
}