package com.avengers.professor.studentManage.daoImpl;

import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.avengers.db.dto.CnsVO;
import com.avengers.db.dto.StudVO;
import com.avengers.professor.studentManage.dao.ProfessorStudentManageDao;

@Repository
public class ProfessorStudentManageDaoImpl implements ProfessorStudentManageDao {
	@Autowired
	protected SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) throws SQLException {
		this.sqlSession = sqlSession;
	}

	@Override
	public ArrayList<CnsVO> selectCnsList(String cns_prfs, String key)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public CnsVO selectCns(String cns_prfs, String cns_stud)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public CnsVO updateCns(CnsVO cnsVO) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<StudVO> selectStudList(String prfs_num, String key)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public StudVO selectStud(String prfs_num, String stud_num)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	
}
