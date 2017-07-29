package com.avengers.admin.HelpDesk.serviceImpl;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.avengers.admin.HelpDesk.daoImpl.AdminHelpDeskDaoImpl;
import com.avengers.admin.HelpDesk.service.AdminHelpDeskService;
import com.avengers.db.dto.BoardVO;
@Service
public class AdminHelpDeskServiceImpl implements AdminHelpDeskService {
	@Autowired
	private AdminHelpDeskDaoImpl helpDeskDAO;
	
	public void setHelpDeskDAO(AdminHelpDeskDaoImpl helpDeskDAO) {
		this.helpDeskDAO = helpDeskDAO;
	}

	@Override
	public ArrayList<BoardVO> selectBoardList(BoardVO boardVO, int firstRow,
			int lastRow)throws SQLException {
		ArrayList<BoardVO> boardList = helpDeskDAO.selectBoardList(boardVO, firstRow, lastRow);
		return boardList;
	}

	@Override
	public BoardVO selectBoard(String bc_num)throws SQLException {
		
		return helpDeskDAO.selectBoard(bc_num);
	}
	
	
	@Override
	public int updateBoard(BoardVO boardVO)throws SQLException {
		int result = helpDeskDAO.updateBoard(boardVO);
				return result;
	}

	@Override
	public int deleteBoard(int board_num)throws SQLException {
		int result = helpDeskDAO.deleteBoard(board_num);
		return result;
	}

	@Override
	public int insertBoard(BoardVO boardVO) throws SQLException {
		int result = helpDeskDAO.insertBoard(boardVO);
		return result;
	}

	@Override
	public BoardVO selectInsertBaseData() throws SQLException {
		return helpDeskDAO.selectInsertBaseData();
	}

	@Override
	public ArrayList<BoardVO> searchBoardList(BoardVO boardVO) throws SQLException {
		return helpDeskDAO.selectSearchList(boardVO);
	}
	
	@Override
	public ArrayList<BoardVO> searchMultiBoardList(BoardVO boardVO) throws SQLException {
		return helpDeskDAO.selectMultiSearchList(boardVO);
	}

	@Override
	public int updateBoardCount(String board_num, String board_count)
			throws SQLException {
		return helpDeskDAO.updateBoardCount(board_num, board_count);
	}

	@Override
	public int selectBoardCount(BoardVO boardVO) throws SQLException {
		return helpDeskDAO.selectBoardCount(boardVO);
	}

	@Override
	public int selectMultiBoardCount(BoardVO boardVO) throws SQLException {
		return helpDeskDAO.selectMultiBoardCount(boardVO);
	}

}
