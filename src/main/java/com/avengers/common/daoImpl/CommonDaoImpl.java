package com.avengers.common.daoImpl;

import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.avengers.common.dao.CommonDao;
import com.avengers.db.dto.BoardVO;

@Repository
public class CommonDaoImpl implements CommonDao{

	@Autowired
	protected SqlSession sqlSession;
	
	
	public void setSqlSession(SqlSession sqlSession)throws SQLException {
		this.sqlSession = sqlSession;
	}

	@Override
	public int loginConfirm(String id, String pw)throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<BoardVO> selectBoard(String bc_num, int firstRow,
			int endRow) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}
	

	@Override
	public String selectId(String name, String bir, String email, int kinds)throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String selectPw(String id, String email)throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}


}
