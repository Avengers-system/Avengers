package com.avengers.professor.HelpDesk.service;

import java.sql.SQLException;
import java.util.ArrayList;

import com.avengers.db.dto.BoardVO;

public interface ProfessorHelpDeskService {
	public ArrayList<BoardVO> selectBoardList(BoardVO boardVO,int firstRow,int lastRow)throws SQLException;//게시판글 전체목록 읽어오기
	public BoardVO selectBoard(String bc_num)throws SQLException;//게시판글 선택 읽어오기
	public ArrayList<BoardVO> searchBoardList(BoardVO boardVO) throws SQLException;// 검색(제목)
	public int insertBoard(BoardVO boardVO)throws SQLException;//게시판글 등록
	public int updateBoard(BoardVO boardVO)throws SQLException;//게시판글 수정
	public int deleteBoard(int board_num)throws SQLException;//게시판글 삭제
	public BoardVO selectInsertBaseData() throws SQLException;
	public int updateBoardCount(String board_num, String board_count) throws SQLException;
	public int selectBoardCount(BoardVO boardVO) throws SQLException;
	public String selectProfDept(String key) throws SQLException;
}
