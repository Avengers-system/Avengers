package com.avengers.student.HelpDesk.serviceImpl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.avengers.db.dto.BoardVO;
import com.avengers.db.dto.EmpVO;
import com.avengers.student.HelpDesk.dao.StudentHelpDeskDao;
import com.avengers.student.HelpDesk.service.StudentHelpDeskService;

@Service
public class StudentHelpDeskServiceImpl implements StudentHelpDeskService {
	@Autowired
	private  StudentHelpDeskDao stuHelpDeskDAO;
	



	


	@Override
	public ArrayList<BoardVO> selectFAQList(BoardVO boardVO) throws SQLException {
		ArrayList<BoardVO> list = stuHelpDeskDAO.selectFAQList(boardVO);
		
		return list;
	}


	@Override
	public int getTotalCount() throws SQLException {
		
		return stuHelpDeskDAO.getTotalCount();
	}

	@Override
	public int getEmpListCount(EmpVO empVO) {
		return stuHelpDeskDAO.getEmpListCount(empVO);
	}

	@Override
	public List<EmpVO> getEmpList(EmpVO empVO) {
		return stuHelpDeskDAO.getEmpList(empVO);
	}

	@Override
	public int getFAQListCount(BoardVO boardVO) {
		return stuHelpDeskDAO.getFAQListCount(boardVO);
	}

	@Override
	public List<BoardVO> getFAQList(BoardVO boardVO) {
		return stuHelpDeskDAO.getFAQList(boardVO);
	}

	@Override
	public BoardVO getStudentFAQDetail(int board_num) {
		
		return stuHelpDeskDAO.getStudentFAQDetail(board_num);
	}

	@Override
	public void updateStudentFAQ(BoardVO boardVO) {
		stuHelpDeskDAO.updateStudentFAQ(boardVO);
	}

	@Override
	public void deleteStudentFAQ(BoardVO boardVO) {

		
		stuHelpDeskDAO.deleteStudentFAQ(boardVO);
	}

	@Override
	public void writeStudentFAQ(BoardVO boardVO) {
		stuHelpDeskDAO.writeStudentFAQ(boardVO);
	}
	
	
	
	@Override
	public ArrayList<BoardVO> selectBoardList(BoardVO boardVO, int firstRow,
			int lastRow)throws SQLException {
		ArrayList<BoardVO> boardList = stuHelpDeskDAO.selectBoardList(boardVO, firstRow, lastRow);
		return boardList;
	}

	@Override
	public BoardVO selectBoard(String bc_num)throws SQLException {
		
		return stuHelpDeskDAO.selectBoard(bc_num);
	}
	
	
	@Override
	public int updateBoard(BoardVO boardVO)throws SQLException {
		int result = stuHelpDeskDAO.updateBoard(boardVO);
				return result;
	}

	@Override
	public int deleteBoard(int board_num)throws SQLException {
		int result = stuHelpDeskDAO.deleteBoard(board_num);
		return result;
	}

	@Override
	public int insertBoard(BoardVO boardVO) throws SQLException {
		int result = stuHelpDeskDAO.insertBoard(boardVO);
		return result;
	}

	@Override
	public BoardVO selectInsertBaseData() throws SQLException {
		return stuHelpDeskDAO.selectInsertBaseData();
	}

	@Override
	public ArrayList<BoardVO> searchBoardList(BoardVO boardVO) throws SQLException {
		return stuHelpDeskDAO.selectSearchList(boardVO);
	}

	@Override
	public int updateBoardCount(String board_num, String board_count)
			throws SQLException {
		return stuHelpDeskDAO.updateBoardCount(board_num, board_count);
	}

	@Override
	public int selectBoardCount(BoardVO boardVO) throws SQLException {
		return stuHelpDeskDAO.selectBoardCount(boardVO);
	}

	
	

}
