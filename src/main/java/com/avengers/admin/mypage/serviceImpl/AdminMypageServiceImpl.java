package com.avengers.admin.mypage.serviceImpl;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.avengers.admin.mypage.dao.AdminMypageDao;
import com.avengers.admin.mypage.service.AdminMypageService;
import com.avengers.db.dto.AdminVO;
import com.avengers.db.dto.PerschdVO;
@Service
public class AdminMypageServiceImpl implements AdminMypageService {
	@Autowired
	private AdminMypageDao myPageDAO;
	
	public void setMyPageDAO(AdminMypageDao myPageDAO) {
		this.myPageDAO = myPageDAO;
	}

	@Override
	public AdminVO selectAdmin(String admin_id)throws SQLException {
		AdminVO admin = null;
		admin = myPageDAO.selectAdmin(admin_id);
		return admin;
	}

	@Override
	public int updateAdmin(AdminVO adminVO)throws SQLException {
		int success =  myPageDAO.updateAdmin(adminVO);
		return success;
	}

	@Override
	public ArrayList<PerschdVO> selectPerschdList(String perschd_writer)throws SQLException {
		ArrayList<PerschdVO> perschdList= null;
		perschdList = myPageDAO.selectPerschdList(perschd_writer);
		return perschdList;
	}

	@Override
	public PerschdVO selectPerschd(int perschd_num)throws SQLException {
		PerschdVO pershcdVO = null;
		pershcdVO = myPageDAO.selectPerschd(perschd_num);
		return pershcdVO;
	}

	@Override
	public int insertPerschd(PerschdVO perschdVO)throws SQLException {
		return 0;
	}

	@Override
	public int updatePerschd(PerschdVO perschdVO)throws SQLException {
		int success = -1; 
		success = myPageDAO.updatePerschd(perschdVO);
		return success;
	}

	@Override
	public int deletePerschd(int perschd_num)throws SQLException {
		int success= -1;
		success = myPageDAO.deletePerschd(perschd_num);
		return success;
	}

}
