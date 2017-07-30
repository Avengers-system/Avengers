package com.avengers.admin.lectureManage.serviceImpl;

import java.sql.SQLException;
import java.util.ArrayList;





import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.avengers.admin.lectureManage.dao.AdminLectureManageDao;
import com.avengers.admin.lectureManage.service.AdminLectureManageService;
import com.avengers.db.dto.LctVO;

@Service
public class AdminLectureManageServiceImpl implements AdminLectureManageService {
	
	@Autowired
	private AdminLectureManageDao lectureDAO;
	
	public void setLectureDAO(AdminLectureManageDao lectureDAO) {
		this.lectureDAO = lectureDAO;
	}

	@Override
	public ArrayList<LctVO> selectLctList(String key,int firstRow, int lastRow)throws SQLException {
		return null;
	}

	@Override
	public LctVO selectLct(String lct_num)throws SQLException {
		return null;
	}

	@Override
	public int insertLct(LctVO lctVO)throws SQLException {
		return 0;
	}

	@Override
	public int updateLct(LctVO lctVO, String lct_num)throws SQLException {
		return 0;
	}

	@Override
	public int deleteLct(String lct_num)throws SQLException {
		return 0;
	}

	@Override
	public ArrayList<Map<String, String>> selectAllLctList()
			throws SQLException {
		ArrayList<Map<String, String>> allLctList = lectureDAO.selectAllLctList();
		return allLctList;
	}

}
