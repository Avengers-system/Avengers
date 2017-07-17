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
		
		System.out.println("다오");
		System.out.println(boardVO.getBoard_writer());
		System.out.println(boardVO.getBoard_date());
		System.out.println(boardVO.getBoard_bc());
		System.out.println(boardVO.getBoard_num());
		ArrayList<BoardVO> boardList = new ArrayList<BoardVO>();
		boardList = (ArrayList<BoardVO>) sqlSession.selectList("Board.selectBoardNoticeList",boardVO,rowBounds);
		
		System.out.println("다오후");
		return boardList;
	}
	
	
	@Override
	public BoardVO selectBoard(String bc_num)throws SQLException {
		
		BoardVO result = (BoardVO)sqlSession.selectOne("Board.selectBoardOne",bc_num);
		
		
		System.out.println("dao"+result.getBoard_date());
		
		return result;
	}

	@Override
	public int insertBoard(BoardVO boardVO)throws SQLException {
		
		HashMap map = new HashMap();
		
		map.put("BOARD_NUM", boardVO.getBoard_num());
		map.put("BOARD_TITLE", boardVO.getBoard_title());
		map.put("BOARD_CONT", boardVO.getBoard_cont());
		map.put("BOARD_WRITER", boardVO.getBoard_writer());
		map.put("BOARD_AF", boardVO.getBoard_af());		
		map.put("BOARD_BC", boardVO.getBoard_bc());
				
		int boardInsert = sqlSession.update("Board.insertBoard", map);
		System.out.println("뭔가찍힘");
		System.out.println(boardVO.getBoard_title());
		System.out.println(boardVO.getBoard_writer());
		return boardInsert;
	}

	@Override
	public int updateBoard(BoardVO boardVO)throws SQLException {
		HashMap map = new HashMap();

		map.put("BOARD_NUM", boardVO.getBoard_num());
		map.put("BOARD_TITLE", boardVO.getBoard_title());
		map.put("BOARD_CONT", boardVO.getBoard_cont());
		map.put("BOARD_AF", boardVO.getBoard_af());	
		int boardUpdate = sqlSession.update("Board.updateBoard", map);
		
		return boardUpdate;
	}

	@Override
	public int deleteBoard(int board_num)throws SQLException {
		int result = sqlSession.delete("Board.deleteBoard",board_num);
		return result;
	}

	@Override
	public BoardVO selectInsertBaseData() throws SQLException {
		BoardVO boardVo;
		System.out.println("insertForm Dao");
		boardVo = (BoardVO) sqlSession.selectOne("Board.insertBaseData");
		
		return boardVo;
	}
	

}
