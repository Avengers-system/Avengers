package com.avengers.admin.HelpDesk.service;

import java.sql.SQLException;
import java.util.ArrayList;

import com.avengers.db.dto.BoardVO;

public interface AdminHelpDeskService {
	//학교,학과,학사일정,Q&A,FAQ포털공지게시판
		public ArrayList<BoardVO> selectBoardList(BoardVO boardVO,int firstRow,int lastRow)throws SQLException;//게시판글 전체목록 읽어오기
		public BoardVO selectBoard(String bc_num)throws SQLException;//게시판글 선택 읽어오기
		public int insertBoard(BoardVO boardVO)throws SQLException;//게시판글 등록
		public int updateBoard(BoardVO boardVO,int board_num,String bc_num)throws SQLException;//게시판글 수정
		public int deleteBoard(int board_num,String bc_num)throws SQLException;//게시판글 삭제
}
