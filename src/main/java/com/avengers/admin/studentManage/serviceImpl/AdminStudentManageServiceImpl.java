package com.avengers.admin.studentManage.serviceImpl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.avengers.admin.studentManage.dao.AdminStudentManageDao;
import com.avengers.admin.studentManage.service.AdminStudentManageService;
import com.avengers.db.dto.BoardVO;
import com.avengers.db.dto.LoaVO;
import com.avengers.db.dto.PrfsVO;
import com.avengers.db.dto.RtsVO;
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

	//페이징처리
	@Override
	public int getEmpListCount(StudVO studVO) throws SQLException {
		int result = amdinStudentDAO.getEmpListCount(studVO);
		return result;
	}


	@Override
	public List<StudVO> getEmpList(StudVO studVO) throws SQLException {
		ArrayList<StudVO> studList = amdinStudentDAO.getEmpList(studVO);
		return studList;
	}

	/**
	 *  2017.07.27일자 추가 -배진 
	 */
	@Override
	public List<HashMap<String, String>> selectLoaList(LoaVO loaVO)
			throws SQLException {
		return amdinStudentDAO.selectLoaList(loaVO);
	}
	
	/**
	 *  2017.07.27일자 추가 -배진 
	 */
	@Override
	public List<HashMap<String, String>> selectRtsList(RtsVO rtsVO)
			throws SQLException {
		return amdinStudentDAO.selectRtsList(rtsVO);
	}

	/**
	 *  2017.07.27일자 추가 -배진 
	 */
	@Override
	public int updateLoaList(LoaVO loaVO)
			throws SQLException {
		return amdinStudentDAO.updateLoaList(loaVO);
	}
	
	/**
	 *  2017.07.27일자 추가 -배진 
	 */
	@Override
	public int updateRtsList(RtsVO rtsVO)
			throws SQLException {
		return amdinStudentDAO.updateRtsList(rtsVO);
	}

}
