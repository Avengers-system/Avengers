package com.avengers.student.main.daoImpl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.avengers.db.dto.BoardVO;
import com.avengers.db.dto.CnsVO;
import com.avengers.db.dto.DeptVO;
import com.avengers.db.dto.LctVO;
import com.avengers.db.dto.PerschdVO;
import com.avengers.db.dto.StudVO;
import com.avengers.db.dto.StudentMainVO;
import com.avengers.db.dto.TlLctRequest;
import com.avengers.db.dto.TlVO;
import com.avengers.student.main.dao.StudentMainDao;

/**
 * 학생 메인 화면
 * StudentMainDaoImpl
 * @author 조영훈
 * 최초작성 2017.07.10
 */
@Repository
public class StudentMainDaoImpl implements StudentMainDao{

	@Autowired
	protected SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public StudVO selectStudInfo(String stud_num) throws SQLException {
		StudVO studVO = (StudVO) sqlSession.selectOne("student.getStudentInfo",stud_num);
		
		return studVO;
	}

	@Override
	public ArrayList<PerschdVO> selectPerschd(String PSC_WRITER)
			throws SQLException {
		 ArrayList<PerschdVO> perschdList =(ArrayList<PerschdVO>)sqlSession.selectList("perschd.selectPerschdList",PSC_WRITER);
		return perschdList;
	}

	@Override
	public ArrayList<TlVO> selectStuTLList(String stud_num) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<CnsVO> selectCnsList(String cns_stud) throws SQLException {
		ArrayList<CnsVO> cnsList = (ArrayList<CnsVO>)sqlSession.selectList("cns.getCns",cns_stud);
		return cnsList;
	}

	@Override
	public Map<String, Integer> selectBachelor(String stud_num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<BoardVO> selectBoradList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public DeptVO selectDept(String dept_num) throws SQLException {
		
		DeptVO deptVO =(DeptVO)sqlSession.selectOne("dept.getDept",dept_num);
		return deptVO;
	}

	@Override
	public ArrayList<StudentMainVO> selectLectureList(String tl_stud,String lct_yr, String lct_qtr) throws SQLException {
		StudentMainVO vo = new StudentMainVO();
		vo.setTl_stud(tl_stud);
		vo.setLct_yr(lct_yr);
		vo.setLct_qtr(lct_qtr);
		ArrayList<StudentMainVO> LectureList = (ArrayList<StudentMainVO>)sqlSession.selectList("studentMain.getLectureList",vo);
		return LectureList;
	}

	@Override
	public String allGrades(String stud_num) throws SQLException {
		String allGrades = (String) sqlSession.selectOne("",stud_num);
		
		return allGrades;
	}

	@Override
	public ArrayList<BoardVO> selectPortalNoticeList() throws SQLException {
		ArrayList<BoardVO> portalNoticeList = (ArrayList<BoardVO>)sqlSession.selectList("board.selectPortalNoticeList");
		return portalNoticeList;
	}

	@Override
	public ArrayList<BoardVO> selectSchoolNoticeList() throws SQLException {
		ArrayList<BoardVO> schoolNoticeList = (ArrayList<BoardVO>)sqlSession.selectList("board.selectSchoolNoticeList");
		return schoolNoticeList;
	}

	@Override
	public ArrayList<BoardVO> selectDepartmentNoticeList(String bc_dept) throws SQLException {
		 ArrayList<BoardVO> departmentNoticeList = (ArrayList<BoardVO>)sqlSession.selectList("board.selectDepartmentNoticeList", bc_dept);
		return departmentNoticeList;
	}

	@Override
	public ArrayList<PerschdVO> selectSchoolScheduleList() throws SQLException {
		ArrayList<PerschdVO> schoolScheduleList = (ArrayList<PerschdVO>)sqlSession.selectList("perschd.selectSchoolScheduleList");
		return schoolScheduleList;
	}





}
