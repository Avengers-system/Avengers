package com.avengers.student.admissionApplication.view;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.view.document.AbstractPdfView;

import com.lowagie.text.Cell;
import com.lowagie.text.Document;
import com.lowagie.text.Font;
import com.lowagie.text.Paragraph;
import com.lowagie.text.Table;
import com.lowagie.text.pdf.BaseFont;
import com.lowagie.text.pdf.PdfWriter;

public class PagePDFView extends AbstractPdfView{

	String fontPath="c:\\windows\\Fonts\\malgun.ttf";
	@Override
	protected void buildPdfDocument(Map<String, Object> model, Document document,
			PdfWriter wirter, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		List<HashMap<String,String>> tlList=(List<HashMap<String,String>>)model.get("TlList");
		Table table=new Table(6,tlList.size()+1);
		table.setPadding(5);
		
		BaseFont bfKorean = BaseFont.createFont(fontPath,BaseFont.IDENTITY_H,BaseFont.EMBEDDED);
		
		Font font = new Font(bfKorean);
		Cell cell = new Cell(new Paragraph("순위",font));
		cell.setHeader(true);
		
		table.addCell(cell);
		cell = new Cell(new Paragraph("페이지",font));
		table.addCell(cell);
		table.endHeaders();
		for(HashMap<String, String>  tl:tlList){
			table.addCell(tl.get(""));
			table.addCell(tl.get(""));
		}
		document.add(table);
		
	}
	public void setFontPath(String fontPath){
		this.fontPath = fontPath;
	}
	
}
