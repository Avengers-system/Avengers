package com.avengers.professor.main.serviceImpl;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.avengers.db.dto.BoardVO;
import com.avengers.db.dto.CnsVO;
import com.avengers.db.dto.LctVO;
import com.avengers.db.dto.PerschdVO;
import com.avengers.db.dto.PrfsVO;
import com.avengers.professor.main.dao.ProfessorMainDao;
import com.avengers.professor.main.service.ProfessorMainService;
@Service
public class ProfessorMainServiceImpl implements ProfessorMainService {

	@Autowired
	private ProfessorMainDao proMainDAO;
	
	public void setProMainDAO(ProfessorMainDao proMainDAO) {
		this.proMainDAO = proMainDAO;
	}

	@Override
	public PrfsVO selectStudInfo(String stud_num) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<PerschdVO> selectPerschd(String PSC_WRITER)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<LctVO> selectLctList(String lct_prfs, String lct_yr,
			String lct_qtr) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<CnsVO> selectCnsList(String cns_prfs) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<BoardVO> selectBoradList() {
		// TODO Auto-generated method stub
		return null;
	}

}
