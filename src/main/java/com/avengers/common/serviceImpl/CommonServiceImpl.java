package com.avengers.common.serviceImpl;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.avengers.common.service.CommonService;
import com.avengers.db.dto.BoardVO;


@Service
public class CommonServiceImpl implements CommonService{



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
	public String selectId(String name, String bir, String email, int kinds) throws SQLException{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String selectPw(String id, String email)throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

}
