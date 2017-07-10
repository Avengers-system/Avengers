package com.avengers.admin.lectureManage.serviceImpl;

import java.util.ArrayList;

import com.avengers.admin.lectureManage.service.AdminLectureManageService;
import com.avengers.db.dto.LctVO;

public class AdminLectureManageServiceImpl implements AdminLectureManageService {

	@Override
	public ArrayList<LctVO> selectLctList(int firstRow, int lastRow) {
		return null;
	}

	@Override
	public LctVO selectLct(String lct_num) {
		return null;
	}

	@Override
	public int insertLct(LctVO lctVO) {
		return 0;
	}

	@Override
	public int updateLct(LctVO lctVO, String lct_num) {
		return 0;
	}

	@Override
	public int deleteLct(String lct_num) {
		return 0;
	}

}
