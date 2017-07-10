package com.avengers.admin.HelpDesk.daoImpl;

import java.util.ArrayList;

import com.avengers.admin.HelpDesk.dao.AdminHelpDeskDao;
import com.avengers.db.dto.BoardVO;

public class AdminHelpDeskDaoImpl implements AdminHelpDeskDao {
	
	
	
	@Override
	public ArrayList<BoardVO> selectBoardList(String bc_num, int firstRow,
			int lastRow) {
		return null;
	}
	
	@Override
	public BoardVO selectBoard(String bc_num) {
		return null;
	}

	@Override
	public int insertBoard(BoardVO boardVO, String bc_num) {
		return 0;
	}

	@Override
	public int updateBoard(BoardVO boardVO, int board_num, String bc_num) {
		return 0;
	}

	@Override
	public int deleteBoard(int board_num, String bc_num) {
		return 0;
	}

	

}
