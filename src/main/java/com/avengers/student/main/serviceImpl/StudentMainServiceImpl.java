package com.avengers.student.main.serviceImpl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.avengers.db.dto.BoardVO;
import com.avengers.db.dto.CnsVO;
import com.avengers.db.dto.DeptVO;
import com.avengers.db.dto.PerschdVO;
import com.avengers.db.dto.StudVO;
import com.avengers.db.dto.StudentMainVO;
import com.avengers.db.dto.TlVO;
import com.avengers.student.main.dao.StudentMainDao;
import com.avengers.student.main.service.StudentMainService;

/**
 * 학생 메인 화면
 * StudentMainServiceImpl 
 * @author 조영훈
 * 최초작성 2017.07.10
 */
@Service
public class StudentMainServiceImpl implements StudentMainService{

	@Autowired
	private StudentMainDao stuMainDao;
	
	public void setStuMainDao(StudentMainDao stuMainDao) {
		this.stuMainDao = stuMainDao;
	}

	@Override
	public StudVO selectStudInfo(String stud_num) throws SQLException {
		StudVO studVO = stuMainDao.selectStudInfo(stud_num);
		return studVO;
	}

	@Override
	public ArrayList<PerschdVO> selectPerschd(String PSC_WRITER)
			throws SQLException {
		ArrayList<PerschdVO> perschdList = stuMainDao.selectPerschd(PSC_WRITER);
		return perschdList;
	}

	@Override
	public ArrayList<TlVO> selectStuTLList(String stud_num) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<CnsVO> selectCnsList(String cns_stud) throws SQLException {
		ArrayList<CnsVO> cnsList = stuMainDao.selectCnsList(cns_stud);
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
		DeptVO deptVO = stuMainDao.selectDept(dept_num);
		return deptVO;
	}

	@Override
	public ArrayList<StudentMainVO> selectLectureList(String stud_num ,String lct_yr, String lct_qtr)
			throws SQLException {
		ArrayList<StudentMainVO> LectureList = stuMainDao.selectLectureList(stud_num,lct_yr,lct_qtr);
		return LectureList;
	}

	@Override
	public String allGrades(String stud_num) throws SQLException {
		String allGrades = stuMainDao.allGrades(stud_num);
		
		return allGrades;
	}

	@Override
	public ArrayList<BoardVO> selectPortalNoticeList() throws SQLException {
		ArrayList<BoardVO> selectPortalNoticeList = stuMainDao.selectPortalNoticeList();
		return selectPortalNoticeList;
	}

	@Override
	public ArrayList<BoardVO> selectSchoolNoticeList() throws SQLException {
		ArrayList<BoardVO> selectSchoolNoticeList = stuMainDao.selectSchoolNoticeList();
		return selectSchoolNoticeList;
	}

	@Override
	public ArrayList<BoardVO> selectDepartmentNoticeList(String bc_dept) throws SQLException {
		ArrayList<BoardVO> selectDepartmentNoticeList = stuMainDao.selectDepartmentNoticeList(bc_dept);
		return selectDepartmentNoticeList;
	}

	@Override
	public ArrayList<PerschdVO> selectSchoolScheduleList() throws SQLException {
		ArrayList<PerschdVO> selectSchoolScheduleList = stuMainDao.selectSchoolScheduleList();
		return selectSchoolScheduleList;
	}

	//배현상
	//강의목록
	@Override
	public ArrayList<Map<String, String>> selectClassList(String stud_num)
			throws SQLException {
		ArrayList<Map<String, String>> classList = stuMainDao.selectClassList(stud_num);
		return classList;
	}







}
