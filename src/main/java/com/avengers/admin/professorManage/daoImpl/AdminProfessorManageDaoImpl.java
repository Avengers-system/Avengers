package com.avengers.admin.professorManage.daoImpl;

import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.avengers.admin.professorManage.dao.AdminProfessorManageDao;
import com.avengers.db.dto.PrfsVO;
@Repository
public class AdminProfessorManageDaoImpl implements AdminProfessorManageDao {
	@Autowired
	protected SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) throws SQLException {
		this.sqlSession = sqlSession;
	}
	@Override
	public ArrayList<PrfsVO> selectPrfsList(String key,int firstRow, int lastRow)
			throws SQLException {
		sqlSession.selectList("");//쿼리쓰기~~~
		return null;
	}

	@Override
	public PrfsVO selectPrfs(String prfs_num) throws SQLException {
		 
		return null;  
	}

	@Override
	public int insertPrfs(PrfsVO prfsVO) throws SQLException {
		int result = sqlSession.insert("admin.insertProfessor",prfsVO);
		return result;
	}

	@Override
	public int updatePrfs(PrfsVO prfsVO, String prfs_num) throws SQLException {
		return 0;
	}

	@Override
	public int deletePrfs(String prfs_num) throws SQLException {
		return 0;
	}
	@Override
	public int insertSecurity(PrfsVO prfsVO) {
		int result = sqlSession.insert("admin.insertSecurity",prfsVO);
		return result;
	}

}
