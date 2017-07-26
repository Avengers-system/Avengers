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
	private ProfessorMypageDao myPageDAO;
	
	public void setProMyPageDAO(ProfessorMypageDao proMyPageDAO) {
		this.myPageDAO = proMyPageDAO;
	}

	@Override
	public PrfsVO selectPrfs(String prfs_num) throws SQLException {
		return null;
	}

	@Override
	public int updatePrfs(PrfsVO prfsVO, String prfs_num) throws SQLException {
		return 0;
	}

	@Override // 일정불러오기
	public ArrayList<PerschdVO> selectPerschdList(String perschd_writer)
			throws SQLException {
		ArrayList<PerschdVO> perschdList= myPageDAO.selectPerschdList(perschd_writer);
		return perschdList;
	}

	@Override // 세부일정보기
	public PerschdVO selectPerschd(int perschd_num) throws SQLException {
		PerschdVO pershcdVO = null;
		pershcdVO = myPageDAO.selectPerschd(perschd_num);
		return pershcdVO;
	}

	@Override // 일정등록하기
	public int insertPerschd(PerschdVO perschdVO) throws SQLException {
		int result = myPageDAO.insertPerschd(perschdVO);
		return result;
	}

	@Override // 일정수정하기
	public int updatePerschd(PerschdVO perschdVO) throws SQLException {
		int success = -1; 
		success = myPageDAO.updatePerschd(perschdVO);
		return success;
	}

	@Override // 일정삭제하기
	public int deletePerschd(int perschd_num) throws SQLException {
		int success= -1;
		success = myPageDAO.deletePerschd(perschd_num);
		return success;
	}

	@Override
	public PerschdVO selectPerschd_title(String title) {
		return myPageDAO.selectPerschd_title(title);
	}


}
