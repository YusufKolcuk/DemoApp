package com.xperta.pdf;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.view.document.AbstractPdfView;

import com.lowagie.text.Chunk;
import com.lowagie.text.Document;
import com.lowagie.text.FontFactory;
import com.lowagie.text.Paragraph;
import com.lowagie.text.pdf.PdfWriter;
import com.xperta.entity.City;
 
public class PDFView extends AbstractPdfView {
	 protected void buildPdfDocument(Map model,Document document, PdfWriter writer, HttpServletRequest req, HttpServletResponse resp) throws Exception {
	  
	  List<City> cities = (List<City>) model.get("pdf_obj");
	  
	  Paragraph header = new Paragraph(new Chunk("WEATHER FORECAST",FontFactory.getFont(FontFactory.HELVETICA, 30)));
	  document.add(header);
	  for (City cityname : cities) {
		  Paragraph by = new Paragraph(new Chunk(cityname.toString()+"\n",FontFactory.getFont(FontFactory.HELVETICA, 20)));  
		  document.add(by);

	}
	 }
}