package com.avengers.professor.mypage.serviceImpl;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.avengers.db.dto.PerschdVO;
import com.avengers.db.dto.PrfsVO;
import com.avengers.professor.mypage.dao.ProfessorMypageDao;
import com.avengers.professor.mypage.service.ProfessorMypageService;

@Service
public class ProfessorMypageServiceImpl implements ProfessorMypageService {

	@Autowired
	private ProfessorMypageDao proMyPageDAO;
	
	public void setProMyPageDAO(ProfessorMypageDao proMyPageDAO) {
		this.proMyPageDAO = proMyPageDAO;
	}

	@Override
	public PrfsVO selectPrfs(String prfs_num) throws SQLException {
		// TODO Auto-generated method stub
		return null;
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
