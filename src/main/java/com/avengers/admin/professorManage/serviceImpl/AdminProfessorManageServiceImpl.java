package com.avengers.admin.professorManage.serviceImpl;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.avengers.admin.professorManage.dao.AdminProfessorManageDao;
import com.avengers.admin.professorManage.service.AdminProfessorManageService;
import com.avengers.db.dto.PrfsVO;
@Service
public class AdminProfessorManageServiceImpl implements AdminProfessorManageService {
	@Autowired
	private AdminProfessorManageDao proDAO;
	
	public void setProDAO(AdminProfessorManageDao proDAO) {
		this.proDAO = proDAO;
	}

	@Override
	public ArrayList<PrfsVO> selectPrfsList(String key,int firstRow, int lastRow)
			throws SQLException {
		return null;
	}

	@Override
	public PrfsVO selectPrfs(String prfs_num) throws SQLException {
		return null;
	}

	@Override
	public int insertPrfs(PrfsVO prfsVO) throws SQLException {
		return 0;
	}

	@Override
	public int updatePrfs(PrfsVO prfsVO, String prfs_num) throws SQLException {
		return 0;
	}

	@Override
	public int deletePrfs(String prfs_num) throws SQLException {
		return 0;
	}

}
