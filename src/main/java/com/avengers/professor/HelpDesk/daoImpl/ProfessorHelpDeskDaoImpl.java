package com.avengers.professor.HelpDesk.daoImpl;

import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.avengers.admin.HelpDesk.dao.AdminHelpDeskDao;
import com.avengers.db.dto.BoardVO;
import com.avengers.professor.HelpDesk.dao.ProfessorHelpDeskDao;
@Repository
public class ProfessorHelpDeskDaoImpl implements ProfessorHelpDeskDao {
	@Autowired
	protected SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) throws SQLException {
		this.sqlSession = sqlSession;
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
