package com.avengers.professor.studentManage.serviceImpl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.avengers.db.dto.CnsVO;
import com.avengers.db.dto.StudVO;
import com.avengers.professor.studentManage.dao.ProfessorStudentManageDao;
import com.avengers.professor.studentManage.service.ProfessorStudentManageService;

@Service
public class ProfessorStudentManageServiceImpl implements ProfessorStudentManageService {

	@Autowired
	private ProfessorStudentManageDao proStuDAO;
	
	@Override
	public ArrayList<CnsVO> selectCnsList(String cns_prfs)
			throws SQLException {
		ArrayList<CnsVO> cnsList = proStuDAO.selectCnsList(cns_prfs);
		return cnsList;
	}

	@Override
	public CnsVO selectCns(String cns_prfs, String cns_stud)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public CnsVO updateCns(CnsVO cnsVO) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<StudVO> selectStudList(String prfs_num)
			throws SQLException {

		ArrayList<StudVO> studentList = proStuDAO.selectStudList(prfs_num);
		return studentList;
	}

	@Override
	public StudVO selectStud(String stud_num)
			throws SQLException {
		StudVO studDetail = proStuDAO.selectStud(stud_num);
		return studDetail;
	}


	

}
