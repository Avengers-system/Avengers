package com.avengers.student.HelpDesk.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.avengers.db.dto.BoardVO;
import com.avengers.db.dto.EmpVO;

/**
 * 학생 게시판관리
 * StudentHelpDeskDao interface
 * @author 조영훈
 *2017.07.11
 */
public interface StudentHelpDeskDao {
	
	public int getEmpListCount(EmpVO empVO);
    public List<EmpVO> getEmpList(EmpVO empVO);
    public int getFAQListCount(BoardVO boardVO);
    public List<BoardVO> getFAQList(BoardVO boardVO);
    public BoardVO getStudentFAQDetail(int board_num);
    public void updateStudentFAQ(BoardVO boardVO);
    public void deleteStudentFAQ(BoardVO boardVO);
    public void writeStudentFAQ(BoardVO boardVO);
    
	public int getTotalCount() throws SQLException;
	
	public Object selectPagingList(String queryId, Object params);
	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception;
	
	public ArrayList<BoardVO> selectFAQList(BoardVO boardVO) throws SQLException;
	// 학교,학과,학사일정,Q&A,FAQ포털공지게시판
	// 게시판글 전체목록 읽어오기
	// 검색조건을 추가하여 검색가능
	
	public ArrayList<BoardVO> selectBoardList(String bc_num, String key,
			int firstRow, int lastRow) throws SQLException;
	
//	// 게시판글 선택
//	// 읽어오기
//	public BoardVO selectBoard(String bc_num) throws SQLException;
//	
//	// 게시판글
//	// 등록
//	public int insertBoard(BoardVO boardVO, String bc_num) throws SQLException;
//
//	// 게시판글 수정
//	public int updateBoard(BoardVO boardVO, int board_num, String bc_num)
//			throws SQLException;
//	
//	// 게시판글
//	// 삭제
//	public int deleteBoard(int board_num, String bc_num) throws SQLException;
	
	
	//학교,학과,학사일정,Q&A,FAQ포털공지게시판
		public BoardVO selectBoard(String board_title)throws SQLException;//게시판글 선택 읽어오기
		public ArrayList<BoardVO> selectSearchList(BoardVO boardVO);//게시판 검색 읽어오기
		public int insertBoard(BoardVO boardVO)throws SQLException;//게시판글 등록
		public int updateBoard(BoardVO boardVO)throws SQLException;//게시판글 수정
		public int deleteBoard(int board_num)throws SQLException;//게시판글 삭제
		public BoardVO selectInsertBaseData() throws SQLException;// 입력시 데이터 보이게하기
		public int updateBoardCount(String board_num, String board_count) throws SQLException;
		public int selectBoardCount(BoardVO boardVO) throws SQLException;
		public ArrayList<BoardVO> selectBoardList(BoardVO boardVO,
				int firstRow, int lastRow);
	
	
}
