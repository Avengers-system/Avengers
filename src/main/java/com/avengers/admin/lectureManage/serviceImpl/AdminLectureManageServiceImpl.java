package com.avengers.admin.lectureManage.serviceImpl;

import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;

import com.avengers.admin.lectureManage.service.AdminLectureManageService;
import com.avengers.db.dto.LctVO;

public class AdminLectureManageServiceImpl implements AdminLectureManageService {
	protected SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) throws SQLException {
		this.sqlSession = sqlSession;
	}
	@Override
	public ArrayList<LctVO> selectLctList(int firstRow, int lastRow)throws SQLException {
		return null;
	}

	@Override
	public LctVO selectLct(String lct_num)throws SQLException {
		return null;
	}

	@Override
	public int insertLct(LctVO lctVO)throws SQLException {
		return 0;
	}

	@Override
	public int updateLct(LctVO lctVO, String lct_num)throws SQLException {
		return 0;
	}

	@Override
	public int deleteLct(String lct_num)throws SQLException {
		return 0;
	}

}
