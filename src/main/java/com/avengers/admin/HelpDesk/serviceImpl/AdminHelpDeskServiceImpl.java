package com.avengers.admin.HelpDesk.serviceImpl;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.avengers.admin.HelpDesk.dao.AdminHelpDeskDao;
import com.avengers.admin.HelpDesk.daoImpl.AdminHelpDeskDaoImpl;
import com.avengers.admin.HelpDesk.service.AdminHelpDeskService;
import com.avengers.db.dto.BoardVO;
@Service
public class AdminHelpDeskServiceImpl implements AdminHelpDeskService {
	@Autowired
	private AdminHelpDeskDaoImpl hepDeskDAO;
	
	public void setHepDeskDAO(AdminHelpDeskDaoImpl hepDeskDAO) {
		this.hepDeskDAO = hepDeskDAO;
	}

	@Override
	public ArrayList<BoardVO> selectBoardList(BoardVO boardVO, int firstRow,
			int lastRow)throws SQLException {
		ArrayList<BoardVO> boardList = hepDeskDAO.selectBoardList(boardVO, firstRow, lastRow);
		return boardList;
	}

	@Override
	public BoardVO selectBoard(String bc_num)throws SQLException {
		
		return hepDeskDAO.selectBoard(bc_num);
	}
	
	
	@Override
	public int updateBoard(BoardVO boardVO, int board_num, String bc_num)throws SQLException {
		return 0;
	}

	@Override
	public int deleteBoard(int board_num, String bc_num)throws SQLException {
		return 0;
	}

	@Override
	public int insertBoard(BoardVO boardVO) throws SQLException {
		int result = hepDeskDAO.insertBoard(boardVO);
		return result;
	}

	

}
