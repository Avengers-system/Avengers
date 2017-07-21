package com.avengers.common.serviceImpl;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.avengers.common.dao.CommonDao;
import com.avengers.common.service.CommonService;
import com.avengers.db.dto.AdminVO;
import com.avengers.db.dto.BoardVO;

@Service
public class CommonServiceImpl implements CommonService{

	@Autowired
	private CommonDao commonDAO;
	

	@Override
	public int loginConfirm(String id, String pw) throws SQLException{
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<BoardVO> selectBoard(String bc_num,int firstRow,int endRow) throws SQLException{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String selectId(String subject, String text, String from, String to,
			String name) throws SQLException {
		return commonDAO.selectId(subject, text, from, to, name);
	}

	@Override
	public String selectPw(String subject, String text, String from, String to,
			String id,String pwd,String role) throws SQLException {
		return commonDAO.selectPw(subject, text, from, to, id,pwd,role);
	}

	@Override
	public AdminVO findInfo(AdminVO adminVO) {
		return commonDAO.findInfo(adminVO);
	}

	@Override
	public String findRole(AdminVO adminVO) {
		return commonDAO.findRole(adminVO);
	}



}
