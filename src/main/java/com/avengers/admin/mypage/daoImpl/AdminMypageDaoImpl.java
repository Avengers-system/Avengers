package com.avengers.admin.mypage.daoImpl;

import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.avengers.admin.mypage.dao.AdminMypageDao;
import com.avengers.db.dto.AdminVO;
import com.avengers.db.dto.PerschdVO;
@Repository
public class AdminMypageDaoImpl implements AdminMypageDao {
	@Autowired
	protected SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) throws SQLException {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public AdminVO selectAdmin(String admin_id)throws SQLException {
		AdminVO admin = new AdminVO();
		admin = (AdminVO) sqlSession.selectOne("admin.selectAdmin",admin_id);
		return admin;
	}

	@Override
	public int updateAdmin(AdminVO adminVO)throws SQLException {
		int success= -1;
		success = sqlSession.update("admin.updateAdmin",adminVO);
		return success;
	}

	@Override
	public ArrayList<PerschdVO> selectPerschdList(String perschd_writer)throws SQLException {
		ArrayList<PerschdVO> perschdList = new ArrayList<PerschdVO>();
		perschdList =  (ArrayList<PerschdVO>) sqlSession.selectList("perschd.selectPerschdList", perschd_writer);
		return perschdList;
	}

	@Override
	public PerschdVO selectPerschd(int perschd_num)throws SQLException {
		PerschdVO perschdVO = null;
		perschdVO = (PerschdVO) sqlSession.selectOne("perschd.getPerschd", perschd_num);
		return perschdVO;
	}

	@Override
	public int insertPerschd(PerschdVO perschdVO)throws SQLException {
		return 0;
	}

	@Override
	public int updatePerschd(PerschdVO perschdVO)throws SQLException {
		int success = -1;
		success = sqlSession.update("perschd.updateSchd", perschdVO);
		return success;
	}

	@Override
	public int deletePerschd(int perschd_num)throws SQLException {
		int success = -1;
		success = sqlSession.delete("perschd.deleteSchd", perschd_num);
		return success;
	}

	

}
