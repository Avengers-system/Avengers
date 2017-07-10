package com.avengers.admin.studentManage.serviceImpl;

import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;

import com.avengers.admin.studentManage.service.AdminStudentManageService;
import com.avengers.db.dto.StudVO;

public class AdminStudentManageServiceImpl implements AdminStudentManageService {
	protected SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) throws SQLException {
		this.sqlSession = sqlSession;
	}
	@Override
	public ArrayList<StudVO> selectStudList(int firstRow, int lastRow)
			throws SQLException {
		return null;
	}

	@Override
	public StudVO selectStud(String stud_num) throws SQLException {
		return null;
	}

	@Override
	public int insertStud(StudVO studVO) throws SQLException {
		return 0;
	}

	@Override
	public int updateStud(StudVO studVO, String stud_num) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteStud(String stud_num) throws SQLException {
		return 0;
	}
}
