package com.avengers.student.HelpDesk.daoImpl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.util.StringUtils;

import com.avengers.db.dto.BoardVO;
import com.avengers.db.dto.EmpVO;
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
	protected SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		sqlSession = sqlSession;
	}
	

	@Override
	public ArrayList<BoardVO> selectBoardList(String bc_num, String key,
			int firstRow, int lastRow) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}


	

	@Override
	public ArrayList<BoardVO> selectFAQList(BoardVO boardVO) throws SQLException {
		
		ArrayList<BoardVO> list = (ArrayList<BoardVO>) sqlSession.selectList("board.getStudentFAQList");
		return list;
	}


	@Override
	public Object selectPagingList(String queryId, Object params) {
	    Map<String,Object> map = (Map<String,Object>)params;
	     
	    String strPageIndex = (String)map.get("PAGE_INDEX");
	    String strPageRow = (String)map.get("PAGE_ROW");
	    int nPageIndex = 0;
	    int nPageRow = 20;
	     
	    if(StringUtils.isEmpty(strPageIndex) == false){
	        nPageIndex = Integer.parseInt(strPageIndex)-1;
	    }
	    if(StringUtils.isEmpty(strPageRow) == false){
	        nPageRow = Integer.parseInt(strPageRow);
	    }
	    map.put("START", (nPageIndex * nPageRow) + 1);
	    map.put("END", (nPageIndex * nPageRow) + nPageRow);
	     
	    return sqlSession.selectList(queryId, map);
	}


	@Override
	public List<Map<String, Object>> selectBoardList(Map<String, Object> map)
			throws Exception {
		
		return (List<Map<String, Object>>)selectPagingList("board.selectFAQList", map);
	}


	@Override
	public int getTotalCount() throws SQLException {
		
		
		return (Integer)sqlSession.selectOne("board.getFAQListCount");
	}


	@Override
	public int getEmpListCount(EmpVO empVO) {
		return (Integer)sqlSession.selectOne("board.getEmpListCount",empVO);
	}


	@Override
	public List<EmpVO> getEmpList(EmpVO empVO) {
		return (List<EmpVO>)sqlSession.selectList("board.getEmpList",empVO);
	}


	@Override
	public int getFAQListCount(BoardVO boardVO) {
		return (Integer)sqlSession.selectOne("board.getFAQListCount",boardVO);
	}


	@Override
	public List<BoardVO> getFAQList(BoardVO boardVO) {
		return (List<BoardVO>)sqlSession.selectList("board.getFAQList",boardVO);
	}


	@Override
	public BoardVO getStudentFAQDetail(int board_num) {
		return (BoardVO)sqlSession.selectOne("board.getFAQDetail",board_num);
	}


	@Override
	public void updateStudentFAQ(BoardVO boardVO) {
		sqlSession.update("board.updateStudentFAQ",boardVO);
		
	}


	@Override
	public void deleteStudentFAQ(BoardVO boardVO) {
		sqlSession.delete("board.deleteStudentFAQ",boardVO);
	}


	@Override
	public void writeStudentFAQ(BoardVO boardVO) {

		sqlSession.insert("board.writeStudentFAQ",boardVO);
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
		ArrayList<BoardVO> boardList = (ArrayList<BoardVO>) sqlSession.selectList("board.selectSearchList", map,rowBounds);
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



}
