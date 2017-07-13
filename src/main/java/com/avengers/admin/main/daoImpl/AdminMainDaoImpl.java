package com.avengers.admin.main.daoImpl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.avengers.admin.main.dao.AdminMainDao;
import com.avengers.db.dto.AdminVO;
import com.avengers.db.dto.DeptVO;
import com.avengers.db.dto.LctVO;
import com.avengers.db.dto.LoaVO;
import com.avengers.db.dto.PerschdVO;
import com.avengers.db.dto.PrfsVO;
import com.avengers.db.dto.RtsVO;
import com.avengers.db.dto.ScrapplVO;
import com.avengers.db.dto.StudVO;
@Repository
public class AdminMainDaoImpl implements AdminMainDao {
	@Autowired
	protected SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) throws SQLException {
		this.sqlSession = sqlSession;
	}
	@Override
	public ArrayList<LctVO> selectLctList()throws SQLException {
		return null;
	}

	@Override
	public ArrayList<PrfsVO> selectPrfsList()throws SQLException {
		return null;
	}

	@Override
	public ArrayList<StudVO> selectStudList()throws SQLException {
		return null;
	}

	@Override
	public ArrayList<DeptVO> selectDeptList()throws SQLException {
		return null;
	}
	@Override
	public AdminVO selectAdminInfo(String adminId) throws SQLException {
		AdminVO adminVO = (AdminVO) sqlSession.selectOne("admin.getAdminInfo",adminId); 
		return adminVO;
	}
	@Override
	public int getInSchoolCount() throws SQLException {
		int inSchoolStud = (Integer) sqlSession.selectOne("student.getInSchoolCount");
		return inSchoolStud;
	}
	@Override
	public int getRestSchoolCount() throws SQLException {
		int restSchoolStud = (Integer) sqlSession.selectOne("student.getRestSchoolCount");
		return restSchoolStud;
	}
	@Override
	public int getLeaveSchoolCount() throws SQLException {
		int leaveSchoolStud = (Integer) sqlSession.selectOne("student.getLeaveSchoolCount");
		return leaveSchoolStud;
	}
	@Override
	public int getGetOutSchoolCount() throws SQLException {
		int getOutSchoolStud = (Integer) sqlSession.selectOne("student.getGetOutSchoolCount");
		return getOutSchoolStud;
	}
	@Override
	public ArrayList<LoaVO> selectUntreatedLoaList() throws SQLException {
		ArrayList<LoaVO> untreatedLoaList = (ArrayList<LoaVO>) sqlSession.selectList("student.getUntreatedLoa");
		return untreatedLoaList;
	}
	@Override
	public ArrayList<RtsVO> selectUntreatedRtsList() throws SQLException {
		ArrayList<RtsVO> untreatedRtsList = (ArrayList<RtsVO>) sqlSession.selectList("student.getUntreatedRts");
		return untreatedRtsList;
	}
	@Override
	public ArrayList<PerschdVO> selectPerschdList(String adminId) throws SQLException {
		ArrayList<PerschdVO> personScheduleList = (ArrayList<PerschdVO>) sqlSession.selectList("admin.getPersonScheduleInfo", adminId);
		return personScheduleList;
	}
	@Override
	public ArrayList<Map<String, String>> selectScrapplList()
			throws SQLException {
		ArrayList<Map<String, String>> scrapplList = (ArrayList<Map<String, String>>) sqlSession.selectList("scrappl.getUntreatedScrappl");
		System.out.println(scrapplList);
		return scrapplList;
	}
	@Override
	public ArrayList<Map<String, Object>> selectPrfsOfDeptList()
			throws SQLException {
		ArrayList<Map<String, Object>> prfsOfDeptList = (ArrayList<Map<String, Object>>) sqlSession.selectList("department.getPfrsOfDeptList");
		System.out.println(prfsOfDeptList);
		return prfsOfDeptList;
	}

}
