package com.avengers.admin.main.serviceImpl;

import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;

import com.avengers.admin.main.service.AdminMainService;
import com.avengers.db.dto.DeptVO;
import com.avengers.db.dto.LctVO;
import com.avengers.db.dto.PrfsVO;
import com.avengers.db.dto.StudVO;

public class AdminMainServiceImpl implements AdminMainService {
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

}
