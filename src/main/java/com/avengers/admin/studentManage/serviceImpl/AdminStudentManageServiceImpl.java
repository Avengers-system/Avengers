package com.avengers.admin.studentManage.serviceImpl;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.avengers.admin.studentManage.dao.AdminStudentManageDao;
import com.avengers.admin.studentManage.service.AdminStudentManageService;
import com.avengers.db.dto.StudVO;
@Service
public class AdminStudentManageServiceImpl implements AdminStudentManageService {

	@Autowired
	private AdminStudentManageDao amdinStudentDAO;
	
	public void setAmdinStudentDAO(AdminStudentManageDao amdinStudentDAO) {
		this.amdinStudentDAO = amdinStudentDAO;
	}

	@Override
	public ArrayList<StudVO> selectStudList(String key,int firstRow, int lastRow)
			throws SQLException {
		return null;
	}

	@Override
	public StudVO selectStud(String stud_num) throws SQLException {
		return null;
	}

	@Override
	public int insertStud(StudVO studVO) throws SQLException {
		return 0;
	}

	@Override
	public int updateStud(StudVO studVO, String stud_num) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteStud(String stud_num) throws SQLException {
		return 0;
	}
}
