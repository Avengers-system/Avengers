package com.avengers.admin.main.serviceImpl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.avengers.admin.main.dao.AdminMainDao;
import com.avengers.admin.main.service.AdminMainService;
import com.avengers.db.dto.AdminVO;
import com.avengers.db.dto.DeptVO;
import com.avengers.db.dto.LctVO;
import com.avengers.db.dto.LoaVO;
import com.avengers.db.dto.PerschdVO;
import com.avengers.db.dto.PrfsVO;
import com.avengers.db.dto.RtsVO;
import com.avengers.db.dto.ScrapplVO;
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

	@Override
	public AdminVO selectAdminInfo(String adminId) throws SQLException {
		AdminVO adminVO = mainDAO.selectAdminInfo(adminId);
		return adminVO;
	}

	@Override
	public ArrayList<Integer> getStudStatus() throws SQLException {
		ArrayList<Integer> studStatus = new ArrayList<Integer>();
		studStatus.add(mainDAO.getInSchoolCount());
		studStatus.add(mainDAO.getRestSchoolCount());
		studStatus.add(mainDAO.getLeaveSchoolCount());
		studStatus.add(mainDAO.getGetOutSchoolCount());
		return studStatus;
	}

	@Override
	public ArrayList<LoaVO> getUntreatedLoa() throws SQLException {
		ArrayList<LoaVO> untreatedLoaList = mainDAO.selectUntreatedLoaList();
		return untreatedLoaList;
	}

	@Override
	public ArrayList<RtsVO> getUntreatedRts() throws SQLException {
		ArrayList<RtsVO> untreatedRtsList = mainDAO.selectUntreatedRtsList();
		return untreatedRtsList;
	}

	@Override
	public ArrayList<PerschdVO> getPerschdList(String adminId) throws SQLException {
		ArrayList<PerschdVO> perschdList = mainDAO.selectPerschdList(adminId);
		return perschdList;
	}

	@Override
	public ArrayList<Map<String, String>> getScrapplList()
			throws SQLException {
		ArrayList<Map<String, String>> scrapplList = mainDAO.selectScrapplList();
		return scrapplList;
	}

	@Override
	public ArrayList<Map<String, Object>> getPrfsOfDeptList()
			throws SQLException {
		ArrayList<Map<String,Object>> prfsOfDeptList = mainDAO.selectPrfsOfDeptList();
		return prfsOfDeptList;
	}

	@Override
	public String selectNextPrfsNum() throws SQLException {
		String nextPrfsNum = mainDAO.selectNextPrfsNum();
		return nextPrfsNum;
	}

	@Override
	public List<HashMap<String, String>> getLeaveDeptList()
			throws SQLException {
		List<HashMap<String, String>> getLeaveDeptList  = null;
		getLeaveDeptList = mainDAO.getLeaveDeptList();
		return getLeaveDeptList;
	}

	@Override
	public List<HashMap<String, String>> getDropOffDeptList()
			throws SQLException {
		List<HashMap<String, String>> getDropOffDeptList= null;
		getDropOffDeptList = mainDAO.getDropOffDeptList();
		return getDropOffDeptList;
	}

	@Override
	public List<HashMap<String, String>> getReinstatementDeptList()
			throws SQLException {
		List<HashMap<String, String>>  getReinstatementDeptList = null;
		getReinstatementDeptList = mainDAO.getReinstatementDeptList();
		return getReinstatementDeptList;
	}

	@Override
	public ArrayList<String> selectSchedule(String admin_id) throws SQLException {
		return mainDAO.selectSchedule(admin_id);
	}

}
