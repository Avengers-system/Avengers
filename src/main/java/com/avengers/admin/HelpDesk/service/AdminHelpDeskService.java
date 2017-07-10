package com.avengers.admin.HelpDesk.service;

import java.util.ArrayList;

import com.avengers.db.dto.BoardVO;

public interface AdminHelpDeskService {
	//학교,학과,학사일정,Q&A,FAQ포털공지게시판
		public ArrayList<BoardVO> selectBoard(String bc_num);//게시판글읽어오기
		public int insertBoard(BoardVO boardVO,String bc_num);//게시판글 등록
		public int updateBoard(BoardVO boardVO,int board_num,String bc_num);//게시판글 수정
		public int deleteBoard(int board_num,String bc_num);//게시판글 삭제
}
