package com.avengers.professor.mypage.daoImpl;

import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.avengers.db.dto.PerschdVO;
import com.avengers.db.dto.PrfsVO;
import com.avengers.professor.mypage.dao.ProfessorMypageDao;

@Repository
public class ProfessorMypageDaoImpl implements ProfessorMypageDao {
	@Autowired
	protected SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) throws SQLException {
		this.sqlSession = sqlSession;
	}

	@Override
	public PrfsVO selectPrfs(String prfs_num) throws SQLException {
		PrfsVO profVO = new PrfsVO();
		profVO = (PrfsVO) sqlSession.selectOne("professor.getProfessor", prfs_num);
		return profVO;
	}

	@Override
	public int updatePrfs(PrfsVO prfsVO, String prfs_num) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<PerschdVO> selectPerschdList(String perschd_psc)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public PerschdVO selectPerschd(String perschd_num) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertPerschd(PerschdVO perschdVO, String perschd_psc)
			throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updatePerschd(PerschdVO perschdVO, String perschd_num)
			throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deletePerschd(String perschd_num) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}
}
