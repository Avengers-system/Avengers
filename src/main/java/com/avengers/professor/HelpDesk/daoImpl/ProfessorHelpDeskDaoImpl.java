package com.avengers.professor.HelpDesk.daoImpl;

import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;

import com.avengers.admin.HelpDesk.dao.AdminHelpDeskDao;
import com.avengers.db.dto.BoardVO;

public class ProfessorHelpDeskDaoImpl implements AdminHelpDeskDao {
	
	protected SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) throws SQLException {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public ArrayList<BoardVO> selectBoardList(String bc_num, int firstRow,
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
