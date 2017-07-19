package com.avengers.student.registryScholarshipManage.daoImpl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.avengers.db.dto.RegVO;
import com.avengers.db.dto.ScrapplVO;
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
	public HashMap<String, String> selectresSchStudent(String stud_num)
			throws SQLException {
		HashMap<String, String> resSchStudent = new HashMap<String, String>();
		resSchStudent = (HashMap<String, String>) sqlSession.selectOne("resSchManage.resSchStudent", stud_num);
		return resSchStudent;
	}
	

}
