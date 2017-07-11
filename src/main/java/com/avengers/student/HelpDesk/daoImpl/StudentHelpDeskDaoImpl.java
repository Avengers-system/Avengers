package com.avengers.student.HelpDesk.daoImpl;

import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.avengers.db.dto.BoardVO;
import com.avengers.student.HelpDesk.dao.StudentHelpDeskDao;

/**
 * 학생 게시판관리
 * StudentCounselDaoImpl
 * @author 조영훈
 *2017.07.11
 */
@Repository
public class StudentHelpDeskDaoImpl implements StudentHelpDeskDao {

	@Autowired
	protected SqlSession SqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		SqlSession = sqlSession;
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
