package com.avengers.student.schoolRegister.daoImpl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.w3c.dom.views.DocumentView;

import com.avengers.db.dto.LoaVO;
import com.avengers.db.dto.LsVO;
import com.avengers.db.dto.RtsVO;
import com.avengers.student.schoolRegister.dao.StudentSchoolRegisterDao;
import com.lowagie.text.Document;
import com.lowagie.text.pdf.PdfWriter;
/**
 * 학생 학적관리 
 * StudentResManageDao interfaceImpl
 * @author 조영훈
 * 최조작성 2017.07.10
 */
@Repository
public class StudentSchoolRegisterDaoImpl implements StudentSchoolRegisterDao {
	@Autowired
	protected SqlSession sqlSession;
	

	@Override
	public DocumentView getDocument() {
		// TODO Auto-generated method stub
		return null;
	}

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
		HashMap<String,String> gradeInfo = (HashMap<String,String>)sqlSession.selectOne("certificate.selectGradeInfo",stud_num);
		return gradeInfo;
	}

	@Override
	public List<HashMap<String, String>> selectGradeList(String stud_num)
			throws SQLException {
		List<HashMap<String,String>> gradeList = (List<HashMap<String,String>>)sqlSession.selectList("certificate.selectGradeList",stud_num);
		return gradeList;
	}

	@Override
	public int selectAllGrade(String stud_num) throws SQLException {
		int allGrade = (Integer)sqlSession.selectOne("certificate.selectAllGrade",stud_num);
		return allGrade;
	}

	@Override
	public int selectAllGradeCount(String stud_num) throws SQLException {
		int allGradeCount = (Integer)sqlSession.selectOne("certificate.selectAllGradeCount",stud_num);
		return allGradeCount;
	}

	@Override
	public ArrayList<LoaVO> selectLeaveList(String stud_num)
			throws SQLException {
		ArrayList<LoaVO> leaveList = (ArrayList<LoaVO>)sqlSession.selectList("loa.selectLeaveList",stud_num);
		return leaveList;
	}

	@Override
	public ArrayList<RtsVO> selectBackList(String stud_num) throws SQLException {
		ArrayList<RtsVO> backList = (ArrayList<RtsVO>)sqlSession.selectList("rts.selectBackList",stud_num);
		return backList;
	}

	@Override
	public void applyLeave(LoaVO vo) throws SQLException {
		sqlSession.insert("loa.insertLeave",vo);
	}

	@Override
	public void applyBack(RtsVO vo) throws SQLException {
		sqlSession.insert("rts.insertBack",vo);
	}

	@Override
	public ArrayList<LsVO> selectDropOffList(String stud_num)
			throws SQLException {
		ArrayList<LsVO> dropList =(ArrayList<LsVO>)sqlSession.selectList("ls.selectLsList",stud_num);
		return dropList;
	}

	@Override
	public void applyDropOff(LsVO vo) throws SQLException {

		sqlSession.insert("ls.insertLs",vo);
	}
	
}
