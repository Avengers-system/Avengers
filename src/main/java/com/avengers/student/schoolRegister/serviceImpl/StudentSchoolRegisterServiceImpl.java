package com.avengers.student.schoolRegister.serviceImpl;

import java.sql.SQLException;

import org.springframework.stereotype.Service;

import com.avengers.db.dto.LoaVO;
import com.avengers.db.dto.LsVO;
import com.avengers.db.dto.RtsVO;
import com.avengers.student.schoolRegister.service.StudentSchoolRegisterService;
import com.lowagie.text.Document;
import com.lowagie.text.pdf.PdfWriter;
/**
 * 학생 학적관리 
 * StudentResManageServiceImpl 
 * @author 조영훈
 * 최조작성 2017.07.10
 */
@Service
public class StudentSchoolRegisterServiceImpl implements StudentSchoolRegisterService {
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
