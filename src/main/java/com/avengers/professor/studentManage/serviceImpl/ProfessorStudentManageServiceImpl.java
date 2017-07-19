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
	public void updateCns(CnsVO cnsVO) throws SQLException {
		System.out.println("!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~!");
		System.out.println(cnsVO.getCns_num());
		System.out.println(cnsVO.getCns_title());
		
		proStuDAO.updateCns(cnsVO);
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

	@Override
	public void counselDateInsert(String cns_date, String cns_prfs,
			 String cns_kind) throws SQLException {

			proStuDAO.counselDateInsert(cns_date, cns_prfs,  cns_kind);
		
	}

	@Override
	public CnsVO cnsDetail(String cns_num) throws SQLException {

		CnsVO vo = proStuDAO.cnsDetail(cns_num);
		return vo;
	}



	

}
