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
	public int updateAdmin(AdminVO adminVO, String admin_id)throws SQLException {
		return 0;
	}

	@Override
	public ArrayList<PerschdVO> selectPerschdList(String perschd_writer)throws SQLException {
		ArrayList<PerschdVO> perschdList= null;
		perschdList = myPageDAO.selectPerschdList(perschd_writer);
		return perschdList;
	}

	@Override
	public PerschdVO selectPerschd(String perschd_num)throws SQLException {
		return null;
	}

	@Override
	public int insertPerschd(PerschdVO perschdVO)throws SQLException {
		return 0;
	}

	@Override
	public int updatePerschd(PerschdVO perschdVO)throws SQLException {
		return 0;
	}

	@Override
	public int deletePerschd(String perschd_num)throws SQLException {
		return 0;
	}

}
