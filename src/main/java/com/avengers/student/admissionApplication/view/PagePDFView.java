package com.avengers.student.admissionApplication.view;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.view.document.AbstractPdfView;

import com.lowagie.text.Cell;
import com.lowagie.text.Document;
import com.lowagie.text.Element;
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
		HashMap<String,String> tlList=(HashMap<String,String>)model.get("TlList");
		Table table=new Table(6,tlList.size()+1);
		table.setPadding(4);
		BaseFont bfKorean = BaseFont.createFont(fontPath,BaseFont.IDENTITY_H,BaseFont.EMBEDDED);
		
		Font font = new Font(bfKorean);
		Cell cell = new Cell(new Paragraph("시간/요일",font));
		table.addCell(cell);
		cell = new Cell(new Paragraph("월요일",font));
		table.addCell(cell);
		cell = new Cell(new Paragraph("화요일",font));
		table.addCell(cell);
		cell = new Cell(new Paragraph("수요일",font));		
		table.addCell(cell);
		cell = new Cell(new Paragraph("목요일",font));
		table.addCell(cell);
		cell = new Cell(new Paragraph("금요일",font));
		table.addCell(cell);
		table.endHeaders();
		String[] timeArray = {"1교시\n9:00~10:00",
				"2교시\n10:00~11:00","3교시\n11:00~12:00","4교시\n12:00~13:00",
				"5교시\n13:00~14:00","6교시\n14:00~15:00","7교시\n15:00~16:00",
				"8교시\n16:00~17:00","9교시\n17:00~18:00"};
		for (int i = 0; i < timeArray.length; i++) {
			cell = new Cell(new Paragraph(timeArray[i],font));
			table.addCell(cell);
			table.addCell(tlList.get("2"+(i+1)));
			table.addCell(tlList.get("3"+(i+1)));
			table.addCell(tlList.get("4"+(i+1)));
			table.addCell(tlList.get("5"+(i+1)));
			table.addCell(tlList.get("6"+(i+1)));
		}
			
	
		document.add(table);
		
	}
	public void setFontPath(String fontPath){
		this.fontPath = fontPath;
	}
	
}
