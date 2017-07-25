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
	//	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception;
	// 학교,학과,학사일정,Q&A,FAQ포털공지게시판
	// 게시판글 전체목록 읽어오기
	// 검색조건을 추가하여 검색가능
	public ArrayList<BoardVO> selectFAQList(BoardVO boardVO) throws SQLException;

	//학교,학과,학사일정,Q&A,FAQ포털공지게시판
	public ArrayList<BoardVO> selectStuBoardList(BoardVO boardVO,int firstRow,int lastRow)throws SQLException;//게시판글 전체목록 읽어오기
	public BoardVO selectStuBoard(String bc_num)throws SQLException;//게시판글 선택 읽어오기
	public ArrayList<BoardVO> searchStuBoardList(BoardVO boardVO) throws SQLException;// 검색(제목)
	public int insertStuBoard(BoardVO boardVO)throws SQLException;//게시판글 등록
	public int updateStuBoard(BoardVO boardVO)throws SQLException;//게시판글 수정
	public int deleteStuBoard(int board_num)throws SQLException;//게시판글 삭제
	public BoardVO selectStuInsertBaseData() throws SQLException;
	public int updateStuBoardCount(String board_num, String board_count) throws SQLException;
	public int selectStuBoardCount(BoardVO boardVO) throws SQLException;
	public String selectStuDept(String key) throws SQLException;
}
