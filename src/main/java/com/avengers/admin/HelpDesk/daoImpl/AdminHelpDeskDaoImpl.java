package com.avengers.admin.HelpDesk.daoImpl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.avengers.admin.HelpDesk.dao.AdminHelpDeskDao;
import com.avengers.db.dto.BoardVO;
@Repository
public class AdminHelpDeskDaoImpl implements AdminHelpDeskDao {
	@Autowired
	protected SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) throws SQLException {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public ArrayList<BoardVO> selectBoardList(BoardVO boardVO, int firstRow,
			int lastRow)throws SQLException {
		int offset=firstRow-1;
		int limit = lastRow-firstRow+1;
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		ArrayList<BoardVO> boardList =(ArrayList<BoardVO>) sqlSession.selectList("Board.selectBoardNoticeList",boardVO,rowBounds);
		
		return boardList;
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
