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
	
	public void setStuHelpDeskDAO(StudentHelpDeskDao stuHelpDeskDAO) {
		this.stuHelpDeskDAO = stuHelpDeskDAO;
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
		ArrayList<BoardVO> list = stuHelpDeskDAO.selectFAQList(boardVO);
		
		return list;
	}

	@Override
	public List<Map<String, Object>> selectBoardList(Map<String, Object> map)
			throws Exception {
		
		return stuHelpDeskDAO.selectBoardList(map);
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

}
