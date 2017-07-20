package com.avengers.student.HelpDesk.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.avengers.db.dto.BoardVO;
import com.avengers.db.dto.EmpVO;

/**
 * 학생 게시판관리
 * StudentHelpDeskService interface
 * @author 조영훈
 *2017.07.11
 */
public interface StudentHelpDeskService {
	
	public int getEmpListCount(EmpVO empVO);
    public List<EmpVO> getEmpList(EmpVO empVO);
    public int getFAQListCount(BoardVO boardVO);
    public List<BoardVO> getFAQList(BoardVO boardVO);
    public BoardVO getStudentFAQDetail(int board_num);
    public void updateStudentFAQ(BoardVO boardVO);
    public void deleteStudentFAQ(BoardVO boardVO);
    public void writeStudentFAQ(BoardVO boardVO);
	
	public int getTotalCount() throws SQLException;
	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception;
	// 학교,학과,학사일정,Q&A,FAQ포털공지게시판
	// 게시판글 전체목록 읽어오기
	// 검색조건을 추가하여 검색가능
	public ArrayList<BoardVO> selectFAQList(BoardVO boardVO) throws SQLException;
	public ArrayList<BoardVO> selectBoardList(String bc_num, String key,
			int firstRow, int lastRow) throws SQLException;
	
	// 게시판글 선택
	// 읽어오기
	public BoardVO selectBoard(String bc_num) throws SQLException;
	
	// 게시판글
	// 등록
	public int insertBoard(BoardVO boardVO, String bc_num) throws SQLException;

	// 게시판글 수정
	public int updateBoard(BoardVO boardVO, int board_num, String bc_num)
			throws SQLException;
	
	// 게시판글
	// 삭제
	public int deleteBoard(int board_num, String bc_num) throws SQLException;
}
