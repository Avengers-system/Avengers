package com.avengers.admin.professorManage.serviceImpl;

import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;

import com.avengers.admin.professorManage.service.AdminProfessorManageService;
import com.avengers.db.dto.PrfsVO;

public class AdminProfessorManageServiceImpl implements AdminProfessorManageService {
	protected SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) throws SQLException {
		this.sqlSession = sqlSession;
	}
	@Override
	public ArrayList<PrfsVO> selectPrfsList(int firstRow, int lastRow)
			throws SQLException {
		return null;
	}

	@Override
	public PrfsVO selectPrfs(String prfs_num) throws SQLException {
		return null;
	}

	@Override
	public int insertPrfs(PrfsVO prfsVO) throws SQLException {
		return 0;
	}

	@Override
	public int updatePrfs(PrfsVO prfsVO, String prfs_num) throws SQLException {
		return 0;
	}

	@Override
	public int deletePrfs(String prfs_num) throws SQLException {
		return 0;
	}

}
