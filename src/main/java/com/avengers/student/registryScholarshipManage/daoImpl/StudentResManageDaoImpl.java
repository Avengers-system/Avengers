package com.avengers.student.registryScholarshipManage.daoImpl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.avengers.db.dto.LoaRtsVO;
import com.avengers.db.dto.RegVO;
import com.avengers.db.dto.ScrapplVO;
import com.avengers.db.dto.resSchStudentVO;
import com.avengers.student.registryScholarshipManage.dao.StudentResManageDao;

@Repository
public class StudentResManageDaoImpl implements StudentResManageDao{
	@Autowired
	protected SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public ArrayList<ScrapplVO> selectScrapplList(String scrappl_stud,
			HashMap<String, String> map) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertScrappl(ScrapplVO scrapplVO) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<RegVO> selectRegList(String reg_stud) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public RegVO selectReg(String reg_stud) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateReg(RegVO regVO) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<resSchStudentVO> selectresSchStudent(String stud_num,String lct_yr)
			throws SQLException {
		ArrayList<resSchStudentVO> resSchList = new ArrayList<resSchStudentVO>();
		resSchList =  (ArrayList<resSchStudentVO>) sqlSession.selectList("resSchManage.resSchSelect",stud_num);
		return resSchList;
	}

	@Override
	public ArrayList<LoaRtsVO> selectLoaRts(String loa_stud)
			throws SQLException {
		ArrayList<LoaRtsVO> LoaRtsList = new ArrayList<LoaRtsVO>();
		LoaRtsList = (ArrayList<LoaRtsVO>) sqlSession.selectList("resSchManage.LoaRtsSelect",loa_stud);
		return LoaRtsList;
	}
	
	

}
