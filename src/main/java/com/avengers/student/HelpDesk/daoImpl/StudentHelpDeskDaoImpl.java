package com.avengers.student.HelpDesk.daoImpl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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



}
