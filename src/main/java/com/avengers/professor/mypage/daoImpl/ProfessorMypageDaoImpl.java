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
	public ArrayList<PerschdVO> selectPerschdList(String perschd_writer)
			throws SQLException {
		ArrayList<PerschdVO> perschdList = new ArrayList<PerschdVO>();
		perschdList =  (ArrayList<PerschdVO>) sqlSession.selectList("perschd.selectPerschdList", perschd_writer);
		return perschdList;
	}


	@Override // 일정보기
	public PerschdVO selectPerschd(int perschd_num) throws SQLException {
		PerschdVO perschdVO = null;
		perschdVO = (PerschdVO) sqlSession.selectOne("perschd.getPerschd", perschd_num);
		return perschdVO;
	}

	@Override // 일정등록하기
	public int insertPerschd(PerschdVO perschdVO) throws SQLException {
		int result = sqlSession.insert("perschd.insertSchd",perschdVO);
		return result;
	}

	@Override // 일정 수정하기
	public int updatePerschd(PerschdVO perschdVO) throws SQLException {
		int success = -1;
		success = sqlSession.update("perschd.updateSchd", perschdVO);
		return success;
	}

	@Override //일정삭제하기
	public int deletePerschd(int perschd_num) throws SQLException {
		int success = -1;
		success = sqlSession.delete("perschd.deleteSchd", perschd_num);
		return success;
	}

	@Override
	public PerschdVO selectPerschd_title(String perschd_title) {
		PerschdVO perschdVO = (PerschdVO) sqlSession.selectOne("perschd.selectSchdTitle",perschd_title);
		return perschdVO;
	}
}
