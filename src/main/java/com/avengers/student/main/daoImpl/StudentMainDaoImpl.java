package com.avengers.student.main.daoImpl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.avengers.db.dto.BoardVO;
import com.avengers.db.dto.CnsVO;
import com.avengers.db.dto.PerschdVO;
import com.avengers.db.dto.StudVO;
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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<PerschdVO> selectPerschd(String PSC_WRITER)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<TlVO> selectStuTLList(String stud_num) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<CnsVO> selectCnsList(String CNS_STUD) throws SQLException {
		// TODO Auto-generated method stub
		return null;
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

}
