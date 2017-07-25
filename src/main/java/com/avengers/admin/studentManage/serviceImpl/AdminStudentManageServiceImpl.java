package com.avengers.admin.studentManage.serviceImpl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.avengers.admin.studentManage.dao.AdminStudentManageDao;
import com.avengers.admin.studentManage.service.AdminStudentManageService;
import com.avengers.db.dto.BoardVO;
import com.avengers.db.dto.StudVO;
@Service
public class AdminStudentManageServiceImpl implements AdminStudentManageService {

	@Autowired
	private AdminStudentManageDao amdinStudentDAO;
	
	public void setAmdinStudentDAO(AdminStudentManageDao amdinStudentDAO) {
		this.amdinStudentDAO = amdinStudentDAO;
	}


	@Override
	public StudVO selectStud(String stud_num) throws SQLException {
		return amdinStudentDAO.selectStud(stud_num);
	}

	@Override
	public int insertStud(StudVO studVO) throws SQLException {
		int result = amdinStudentDAO.insertStud(studVO);
		return result;
	}


	@Override
	public int deleteStud(String stud_num) throws SQLException {
		int result = amdinStudentDAO.deleteStud(stud_num);
		return result;
	}

	@Override
	public ArrayList<StudVO> selectStudList() throws SQLException {
		ArrayList<StudVO> studentList = new ArrayList<StudVO>();
		studentList = amdinStudentDAO.selectStudList();
		return studentList;
	}


	@Override
	public String selectStudNum() throws SQLException {
		String studNum = amdinStudentDAO.selectStudNum();
		return studNum;
	}


	@Override
	public void insertSecurity(StudVO studVO) {
		amdinStudentDAO.insertSecurity(studVO);
	}


	@Override
	public int updateStud(StudVO studVO) throws SQLException {
		int result = amdinStudentDAO.updateStud(studVO);
		return result;
	}


	@Override
	public ArrayList<StudVO> selectStudbyKeyword(String keyword) {
		
		return amdinStudentDAO.selectStudbyKeyword(keyword);
	}

	@Override
	public List<StudVO> getStudList(StudVO studVO) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public int getTotalCount() throws SQLException {
		return amdinStudentDAO.getTotalCount();
	}


	@Override
	public Object selectPagingList(String queryId, Object params) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public List<Map<String, Object>> selectStudList(Map<String, Object> map)
			throws Exception {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public ArrayList<BoardVO> selectStuBoardList(String key, int firstRow,
			int lastRow) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}
 
}
