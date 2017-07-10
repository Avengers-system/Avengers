package com.avengers.admin.convert;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.web.servlet.view.document.AbstractExcelView;


public class ExcelView extends AbstractExcelView {

	@Override
	protected void buildExcelDocument(Map<String, Object> model,
			HSSFWorkbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		response.setHeader("Content-Disposition",
				"attachment;filename=\"productList.xls\";");

	}

	private HSSFSheet createFirstSheet(HSSFWorkbook workbook) {
		HSSFSheet sheet = workbook.createSheet();// sheet생성
		workbook.setSheetName(0, "상품 리스트"); // (sheet순번, sheet제목)
		sheet.setColumnWidth(4, 256 * 20); // (컬럼번호, 크기) 1자/256
		return sheet;
	}

	private void createColumnLabel(HSSFSheet sheet) {
		HSSFRow firstRow = sheet.createRow(0); // 시작행 설정
		HSSFCell cell = null;
		String[] colName={"번호","상품명","원가","판매가","등록일","사용유무"};
		for(int i=0;i<colName.length;i++){			
			cell = firstRow.createCell(i); // 컬럼순번
			cell.setCellValue(colName[i]);// 컬럼명
		}
		
	}

	private void createProductListkRow(HSSFSheet sheet, int rowNum) {
		HSSFRow row = sheet.createRow(rowNum); // 행추가 (행번호)
	}
}










