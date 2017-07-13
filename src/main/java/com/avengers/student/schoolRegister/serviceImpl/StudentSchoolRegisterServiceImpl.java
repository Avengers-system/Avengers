package com.avengers.student.schoolRegister.serviceImpl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.avengers.db.dto.LoaVO;
import com.avengers.db.dto.LsVO;
import com.avengers.db.dto.RtsVO;
import com.avengers.student.schoolRegister.dao.StudentSchoolRegisterDao;
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
	@Autowired
	private StudentSchoolRegisterDao stuSchResDAO;
	

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

	@Override
	public HashMap<String, String> selectGradeInfo(String stud_num)
			throws SQLException {
		HashMap<String, String> gradeInfo = stuSchResDAO.selectGradeInfo(stud_num);
		return gradeInfo;
	}

	@Override
	public List<HashMap<String, String>> selectGradeList(String stud_num)
			throws SQLException {
		List<HashMap<String, String>> gradeList = stuSchResDAO.selectGradeList(stud_num);
		return gradeList;
	}

	@Override
	public int selectAllGrade(String stud_num) throws SQLException {
		int allGrade = stuSchResDAO.selectAllGrade(stud_num);
		return allGrade;
	}

	@Override
	public int selectAllGradeCount(String stud_num) throws SQLException {
		int allGradeCount = stuSchResDAO.selectAllGradeCount(stud_num);
		return allGradeCount;
	}
}
