package com.avengers.admin.professorManage.serviceImpl;

import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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
		
		return proDAO.selectPrfsList(key, firstRow, lastRow);
	}

	@Override
	public PrfsVO selectPrfs(String prfs_num) throws SQLException {
		return proDAO.selectPrfs(prfs_num);
	}

	
	@Override
	public int insertPrfs(PrfsVO prfsVO) throws SQLException {
			int result = proDAO.insertPrfs(prfsVO);
		return result;
	}

	 
	
	@Override
	public int updatePrfs(PrfsVO prfsVO) throws SQLException {
		int result = proDAO.updatePrfs(prfsVO);
		return result;
	}

	@Override
	public int deletePrfs(String prfs_num) throws SQLException {
		int result = proDAO.deletePrfs(prfs_num);
		return result;
	}

	@Override
	public int insertSecurity(PrfsVO prfsVO) {
		int result = proDAO.insertSecurity(prfsVO);
		return result;
	}

	@Override
	public ArrayList<PrfsVO> selectPrfsList() throws SQLException {
		ArrayList<PrfsVO> prfsList = proDAO.selectPrfsList();
		return prfsList;
	}

	@Override
	public String selectPrfsNum() throws SQLException {
		String prfsNum = proDAO.selectPrfsNum();
		return prfsNum;
	}

	@Override
	public int getEmpListCount(PrfsVO prfsVO) throws SQLException {
		int result = proDAO.getEmpListCount(prfsVO);
		System.out.println("prfsVO.getPrfs_dept() :" + prfsVO.getPrfs_dept());
		return result;
	}

	@Override
	public List<PrfsVO> getEmpList(PrfsVO prfsVO) throws SQLException {
		ArrayList<PrfsVO> prfsList = proDAO.getEmpList(prfsVO);
		return prfsList;
	}

	@Override
	public void updatePrfsEnabled(String prfs_num) throws SQLException {
		proDAO.updatePrfsEnabled(prfs_num);
	}

}
