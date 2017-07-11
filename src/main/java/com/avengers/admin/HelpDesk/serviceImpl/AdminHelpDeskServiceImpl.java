package com.avengers.admin.HelpDesk.serviceImpl;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.avengers.admin.HelpDesk.dao.AdminHelpDeskDao;
import com.avengers.admin.HelpDesk.service.AdminHelpDeskService;
import com.avengers.db.dto.BoardVO;
@Service
public class AdminHelpDeskServiceImpl implements AdminHelpDeskService {
	@Autowired
	private AdminHelpDeskDao hepDeskDAO;
	
	public void setHepDeskDAO(AdminHelpDeskDao hepDeskDAO) {
		this.hepDeskDAO = hepDeskDAO;
	}

	@Override
	public ArrayList<BoardVO> selectBoardList(String key,String bc_num, int firstRow,
			int lastRow)throws SQLException {
		return null;
	}

	@Override
	public BoardVO selectBoard(String bc_num)throws SQLException {
		return null;
	}
	
	@Override
	public int insertBoard(BoardVO boardVO, String bc_num)throws SQLException {
		return 0;
	}

	@Override
	public int updateBoard(BoardVO boardVO, int board_num, String bc_num)throws SQLException {
		return 0;
	}

	@Override
	public int deleteBoard(int board_num, String bc_num)throws SQLException {
		return 0;
	}

	

}
