package com.avengers.admin.HelpDesk.serviceImpl;

import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.avengers.admin.HelpDesk.service.AdminHelpDeskService;
import com.avengers.db.dto.BoardVO;
@Service
public class AdminHelpDeskServiceImpl implements AdminHelpDeskService {
	
	
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
