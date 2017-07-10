package com.avengers.student.registryScholarshipManage.serviceImpl;

import java.sql.SQLException;

import com.avengers.db.dto.LoaVO;
import com.avengers.db.dto.LsVO;
import com.avengers.db.dto.RtsVO;
import com.avengers.student.registryScholarshipManage.service.StudentResManageService;
import com.lowagie.text.Document;
import com.lowagie.text.pdf.PdfWriter;



/**
 * 학생 학적관리 
 * StudentResManageServiceImpl 
 * @author 조영훈
 * 최조작성 2017.07.10
 */
public class StudentResManageServiceImpl implements StudentResManageService {

	@Override
	public void buildPdfDocument(Document document, PdfWriter pdfWriter)
			throws SQLException {
		// TODO Auto-generated method stub

	}

	@Override
	public int insertLoa(LoaVO loa) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertRts(RtsVO rts) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertLs(LsVO ls) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

}
