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

	@Override
	public Object selectPagingList(String queryId, Object params)
			throws SQLException {
		Map<String,Object> map=(Map<String,Object>)params;
		
		String strPageIndex = (String)map.get("PAGE_INDEX");
		String strPageRow = (String)map.get("PAGE_ROW");
		int nPageIndex = 0;
		int nPageRow = 20;
		if(StringUtils.isEmpty(strPageIndex)==false){
			nPageIndex = Integer.parseInt(strPageIndex)-1;
		}
		if(StringUtils.isEmpty(strPageRow)==false){
			nPageRow = Integer.parseInt(strPageRow);
		}
		
		map.put("START", (nPageIndex * nPageRow)+1);
		map.put("END", (nPageIndex * nPageRow)+nPageRow);
		
		return SqlSession.selectList(queryId,map);
	}

	@Override
	public List<Map<String, Object>> selectBoardList(Map<String, Object> map)
			throws Exception {
		return (List<Map<String, Object>>)selectPagingList("sample.selectBoardList", map);
	}

}
