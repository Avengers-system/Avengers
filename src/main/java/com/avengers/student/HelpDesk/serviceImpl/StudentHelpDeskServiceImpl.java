package com.avengers.student.HelpDesk.serviceImpl;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.avengers.db.dto.BoardVO;
import com.avengers.student.HelpDesk.dao.StudentHelpDeskDao;
import com.avengers.student.HelpDesk.service.StudentHelpDeskService;

@Service
public class StudentHelpDeskServiceImpl implements StudentHelpDeskService {
	@Autowired
	private  StudentHelpDeskDao stuHelpDeskDAO;
	
	public void setStuHelpDeskDAO(StudentHelpDeskDao stuHelpDeskDAO) {
		this.stuHelpDeskDAO = stuHelpDeskDAO;
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
