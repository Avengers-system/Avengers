package com.avengers.professor.HelpDesk.serviceImpl;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.avengers.db.dto.BoardVO;
import com.avengers.db.dto.StudVO;
import com.avengers.professor.HelpDesk.dao.ProfessorHelpDeskDao;
import com.avengers.professor.HelpDesk.service.ProfessorHelpDeskService;
@Service
public class ProfessorHelpDeskServiceImpl implements ProfessorHelpDeskService {
	
	@Autowired
	private ProfessorHelpDeskDao proHelpDeskDAO;
	
	public void setProproHelpDeskDAO(ProfessorHelpDeskDao proproHelpDeskDAO) {
		this.proHelpDeskDAO = proproHelpDeskDAO;
	}

	@Override
	public ArrayList<BoardVO> selectBoardList(BoardVO boardVO, int firstRow,
			int lastRow)throws SQLException {
		ArrayList<BoardVO> boardList = proHelpDeskDAO.selectBoardList(boardVO, firstRow, lastRow);
		return boardList;
	}

	@Override
	public BoardVO selectBoard(String bc_num)throws SQLException {
		
		return proHelpDeskDAO.selectBoard(bc_num);
	}
	
	
	@Override
	public int updateBoard(BoardVO boardVO)throws SQLException {
		int result = proHelpDeskDAO.updateBoard(boardVO);
				return result;
	}

	@Override
	public int deleteBoard(int board_num)throws SQLException {
		int result = proHelpDeskDAO.deleteBoard(board_num);
		return result;
	}

	@Override
	public int insertBoard(BoardVO boardVO) throws SQLException {
		int result = proHelpDeskDAO.insertBoard(boardVO);
		return result;
	}

	@Override
	public BoardVO selectInsertBaseData() throws SQLException {
		return proHelpDeskDAO.selectInsertBaseData();
	}

	@Override
	public ArrayList<BoardVO> searchBoardList(BoardVO boardVO) throws SQLException {
		return proHelpDeskDAO.selectSearchList(boardVO);
	}

	@Override
	public int updateBoardCount(String board_num, String board_count)
			throws SQLException {
		return proHelpDeskDAO.updateBoardCount(board_num, board_count);
	}

	@Override
	public int selectBoardCount(BoardVO boardVO) throws SQLException {
		return proHelpDeskDAO.selectBoardCount(boardVO);
	}

	@Override
	public String selectProfDept(String key) throws SQLException {
		
		return proHelpDeskDAO.selectProfDept(key);
		
	}

	

	

}
