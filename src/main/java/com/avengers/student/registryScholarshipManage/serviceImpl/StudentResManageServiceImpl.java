package com.avengers.student.registryScholarshipManage.serviceImpl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.avengers.db.dto.LoaRtsVO;
import com.avengers.db.dto.RegVO;
import com.avengers.db.dto.ScrVO;
import com.avengers.db.dto.ScrapplVO;
import com.avengers.db.dto.resSchStudentVO;
import com.avengers.student.registryScholarshipManage.dao.StudentResManageDao;
import com.avengers.student.registryScholarshipManage.service.StudentResManageService;



@Service
public class StudentResManageServiceImpl implements StudentResManageService {
	@Autowired
	private StudentResManageDao stuResDAO;
	

	@Override
	public ArrayList<ScrapplVO> selectScrapplList(String scrappl_stud,
			HashMap<String, String> map) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertScrappl(ScrapplVO scrapplVO) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<RegVO> selectRegList(String reg_stud) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public RegVO selectReg(String reg_stud) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateReg(RegVO regVO) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<resSchStudentVO> selectResSchHistory(String stud_num,String lct_yr)
			throws SQLException {
		ArrayList<resSchStudentVO> resSchStudent = null;
		resSchStudent = stuResDAO.selectresSchStudent(stud_num,lct_yr);
		return resSchStudent;
	}

	@Override
	public ArrayList<LoaRtsVO> selectLoaRts(String loa_stud)
			throws SQLException {
		ArrayList<LoaRtsVO> LoaRtsList = null;
		LoaRtsList = stuResDAO.selectLoaRts(loa_stud);
		return LoaRtsList;
	}

	@Override
	public List<HashMap<String, String>> selectScrList(ScrapplVO scrApplVO)
			throws SQLException {		
		return stuResDAO.selectScrList(scrApplVO);
	}

	@Override
	public List<HashMap<String, String>> selectScrApplList(
			ScrapplVO scrApplVO) throws SQLException {		
		return stuResDAO.selectScrApplList(scrApplVO);
	}

	@Override
	public resSchStudentVO selectStudInfo(String stud_num) throws SQLException {
		return stuResDAO.selectStudInfo(stud_num);
	}

	@Override
	public ArrayList<ScrVO> selectScrVO() throws SQLException {
		return stuResDAO.selectScrVO();
	}

}
