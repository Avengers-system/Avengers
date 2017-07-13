package com.avengers.student.mypage.daoImpl;

import java.sql.SQLException;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.avengers.db.dto.DeptVO;
import com.avengers.db.dto.PerschdVO;
import com.avengers.db.dto.StudVO;
import com.avengers.student.mypage.dao.StudentMyPageDao;

/**
 * 학생 mypage
 * @author 조영훈
 * 최초작성 2017.07.10
 */
@Repository
public class StudentMyPageDaoImpl implements StudentMyPageDao{
	
	@Autowired
	protected SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public int updateMyInfo(StudVO stud, DeptVO dept) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public StudVO selectMyInfo(String stud_num) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertPerschd(PerschdVO perschd) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updatePerschd(PerschdVO perschd) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deletePersched(PerschdVO persched) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

}
