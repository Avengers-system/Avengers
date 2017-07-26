package com.avengers.professor.main.serviceImpl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.avengers.db.dto.BoardVO;
import com.avengers.db.dto.CnsVO;
import com.avengers.db.dto.DeptVO;
import com.avengers.db.dto.LctVO;
import com.avengers.db.dto.PerschdVO;
import com.avengers.db.dto.PrfsVO;
import com.avengers.professor.main.dao.ProfessorMainDao;
import com.avengers.professor.main.daoImpl.ProfessorMainDaoImpl;
import com.avengers.professor.main.service.ProfessorMainService;
@Service
public class ProfessorMainServiceImpl implements ProfessorMainService {

	@Autowired
	private ProfessorMainDaoImpl proMainDAO;
	

	@Override
	public PrfsVO selectPrfs(String prfs_num) throws SQLException {
		return proMainDAO.selectPrfs(prfs_num);
	}

	@Override
	public ArrayList<PerschdVO> selectPerschdList(String PSC_WRITER)
			throws SQLException {
		return proMainDAO.selectPerschdList(PSC_WRITER);
	}

	@Override
	public List<HashMap<String, String>> selectLctList(String lct_prfs, String lct_yr,
			String lct_qtr) throws SQLException {
		return proMainDAO.selectLctList(lct_prfs, lct_yr, lct_qtr);
	}

	@Override
	public ArrayList<CnsVO> selectCnsList(String cns_prfs) throws SQLException {
		return proMainDAO.selectCnsList(cns_prfs);
	}

	@Override
	public ArrayList<BoardVO> selectPortalNoticeList() {
		return proMainDAO.selectPortalNoticeList();
	}

	@Override
	public ArrayList<BoardVO> selectSchoolNoticeList() {
		return proMainDAO.selectSchoolNoticeList();
	}

	@Override
	public ArrayList<BoardVO> selectDepartmentNoticeList(String bc_dept) {
		return proMainDAO.selectDepartmentNoticeList(bc_dept);
	}

	@Override
	public ArrayList<PerschdVO> selectSchoolScheduleList() {
		return proMainDAO.selectSchoolScheduleList();
	}

	@Override
	public DeptVO selectDept(String prfs_dept) throws SQLException {
		return proMainDAO.selectDept(prfs_dept);
	}

	@Override
	public ArrayList<BoardVO> getProfessorMainSchoolNotice()
			throws SQLException {
		return proMainDAO.getProfessorMainSchoolNotice();
	}

	@Override
	public ArrayList<BoardVO> getProfessorMainDepartNotice(String prfs_dept)
			throws SQLException {
		
		return proMainDAO.getProfessorMainDepartNotice(prfs_dept);
	}

	@Override
	public ArrayList<BoardVO> getProfessorMainPotalNotice() throws SQLException {
		return proMainDAO.getProfessorMainPotalNotice();
	}

	@Override
	public String selectSchedule(String prfs_num) throws SQLException {
		return proMainDAO.selectSchedule(prfs_num);
	}

	

}
