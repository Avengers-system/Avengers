package com.avengers.professor.HelpDesk.serviceImpl;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.avengers.db.dto.BoardVO;
import com.avengers.professor.HelpDesk.dao.ProfessorHelpDeskDao;
import com.avengers.professor.HelpDesk.service.ProfessorHelpDeskService;
@Service
public class ProfessorHelpDeskServiceImpl implements ProfessorHelpDeskService {
	
	@Autowired
	private ProfessorHelpDeskDao proHelpDeskDAO;
	
	public void setProHelpDeskDAO(ProfessorHelpDeskDao proHelpDeskDAO) {
		this.proHelpDeskDAO = proHelpDeskDAO;
	}

	@Override
	public ArrayList<BoardVO> selectBoardList(String bc_num, String key,
			int firstRow, int lastRow) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BoardVO selectBoard(String bc_num) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertBoard(BoardVO boardVO, String bc_num) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateBoard(BoardVO boardVO, int board_num, String bc_num)
			throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteBoard(int board_num, String bc_num) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}
	
	

	

}
