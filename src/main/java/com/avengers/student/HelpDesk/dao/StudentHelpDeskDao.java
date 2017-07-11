package com.avengers.student.HelpDesk.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import com.avengers.db.dto.BoardVO;

/**
 * 학생 게시판관리
 * StudentHelpDeskDao interface
 * @author 조영훈
 *2017.07.11
 */
public interface StudentHelpDeskDao {
	// 학교,학과,학사일정,Q&A,FAQ포털공지게시판
	// 게시판글 전체목록 읽어오기
	// 검색조건을 추가하여 검색가능
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
