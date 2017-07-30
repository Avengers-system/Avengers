package com.avengers.professor.HelpDesk.daoImpl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.avengers.db.dto.BoardVO;
import com.avengers.db.dto.PrfsVO;
import com.avengers.professor.HelpDesk.dao.ProfessorHelpDeskDao;
@Repository
public class ProfessorHelpDeskDaoImpl implements ProfessorHelpDeskDao {
	@Autowired
	protected SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	/**
	 * 검색
	 * @param bc_num 
	 * */

	@Override
	public BoardVO selectBoard(String bc_num)throws SQLException {

		BoardVO result = (BoardVO)sqlSession.selectOne("board.selectBoardOne",bc_num);


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
		map.put("BOARD_BC", boardVO.getBoard_bc());

		map.put("BOARD_AF", boardVO.getBoard_af());		

		int boardInsert = sqlSession.update("board.insertBoard", map);
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
		int boardUpdate = sqlSession.update("board.updateBoard", map);

		return boardUpdate;
	}

	@Override
	public int deleteBoard(int board_num)throws SQLException {
		int result = sqlSession.delete("board.deleteBoard",board_num);
		return result;
	}

	@Override
	public BoardVO selectInsertBaseData() throws SQLException {
		BoardVO boardVo;
		System.out.println("insertForm Dao");
		boardVo = (BoardVO) sqlSession.selectOne("board.insertBaseData");
		return boardVo;
	}

	@Override
	public ArrayList<BoardVO> selectSearchList(BoardVO boardVO) {
		int offset=boardVO.getStartRowNo()-1;
		int limit = boardVO.getEndRowNo()-boardVO.getStartRowNo()+1;
		RowBounds rowBounds = new RowBounds(offset,limit);


		HashMap map = new HashMap();

		map.put("BOARD_BC", boardVO.getBoard_bc());
		map.put("BOARD_TITLE", boardVO.getBoard_title());

		System.out.println(map.get("BOARD_TITLE")+"dao 이전");
		ArrayList<BoardVO> boardList = (ArrayList<BoardVO>) sqlSession.selectList("board.selectSearchList", map,rowBounds);
		System.out.println(boardList.get(0).getBoard_title()+boardList.size());
		return boardList;
	}

	public int updateBoardCount(String board_num, String board_count) throws SQLException{
		HashMap map = new HashMap();

		map.put("BOARD_NUM", board_num);
		map.put("BOARD_COUNT", board_count);
		int result = (int) sqlSession.update("board.updateBoardCount", map);

		return result;
	}

	public int selectBoardCount(BoardVO boardVO) throws SQLException{
		int count = 0;
		HashMap map = new HashMap();

		map.put("BOARD_BC", boardVO.getBoard_bc());
		map.put("searchFiled", boardVO.getSearchFiled());
		map.put("searchValue", boardVO.getSearchValue());
		map.put("board_title", boardVO.getBoard_title());
		count = (Integer) sqlSession.selectOne("selectBoardCount", map);
		return count;
	}


	@Override
	public ArrayList<BoardVO> selectBoardList(BoardVO boardVO, int firstRow,
			int lastRow) {
		int offset=firstRow-1;
		int limit = lastRow-firstRow+1;
		RowBounds rowBounds = new RowBounds(offset,limit);

		HashMap map = new HashMap();
		map.put("BOARD_BC", boardVO.getBoard_bc());
		System.out.println(map.get("BOARD_BC"));
		ArrayList<BoardVO> boardList = (ArrayList<BoardVO>) sqlSession.selectList("board.selectBoardNoticeList",map,rowBounds);

		return boardList;
	}


	@Override
	public String selectProfDept(String key) throws SQLException {
		PrfsVO vo = (PrfsVO) sqlSession.selectOne("prfs.selectPrfs",key);
		return vo.getPrfs_dept();
	}


}
