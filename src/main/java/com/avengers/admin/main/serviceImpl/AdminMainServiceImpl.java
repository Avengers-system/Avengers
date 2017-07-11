package com.avengers.admin.main.serviceImpl;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.avengers.admin.main.dao.AdminMainDao;
import com.avengers.admin.main.service.AdminMainService;
import com.avengers.db.dto.DeptVO;
import com.avengers.db.dto.LctVO;
import com.avengers.db.dto.PrfsVO;
import com.avengers.db.dto.StudVO;
@Service
public class AdminMainServiceImpl implements AdminMainService {
	
	@Autowired
	private AdminMainDao mainDAO;
	
	public void setMainDAO(AdminMainDao mainDAO) {
		this.mainDAO = mainDAO;
	}

	@Override
	public ArrayList<LctVO> selectLctList()throws SQLException {
		return null;
	}

	@Override
	public ArrayList<PrfsVO> selectPrfsList()throws SQLException {
		return null;
	}

	@Override
	public ArrayList<StudVO> selectStudList()throws SQLException {
		return null;
	}

	@Override
	public ArrayList<DeptVO> selectDeptList()throws SQLException {
		return null;
	}

}
