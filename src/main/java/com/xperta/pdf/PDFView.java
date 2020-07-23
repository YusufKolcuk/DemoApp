package com.xperta.pdf;

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
	  
	  City city = (City) model.get("City");
	  
	  Paragraph header = new Paragraph(new Chunk("Generate Pdf USing Spring Mvc",FontFactory.getFont(FontFactory.HELVETICA, 30)));
	  Paragraph by = new Paragraph(new Chunk("Author ",FontFactory.getFont(FontFactory.HELVETICA, 20)));
	  
	  document.add(header);
	  document.add(by);
	  
	 }
}