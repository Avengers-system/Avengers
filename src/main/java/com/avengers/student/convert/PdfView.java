package com.avengers.student.convert;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.view.document.AbstractPdfView;

import com.lowagie.text.Document;
import com.lowagie.text.pdf.PdfWriter;

public class PdfView extends AbstractPdfView{
	

	@Override
	protected void buildPdfDocument(Map<String, Object> model, 
			Document document, PdfWriter writer, 
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		
	}
	
	@Autowired(required=false)
	public void setFontPath(String fontPath) {
	}
}









