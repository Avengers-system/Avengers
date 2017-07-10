package com.avengers.admin.main.dao;

import java.util.ArrayList;

import com.avengers.db.dto.DeptVO;
import com.avengers.db.dto.LctVO;
import com.avengers.db.dto.PrfsVO;
import com.avengers.db.dto.StudVO;

public interface AdminMainDao {
	public ArrayList<LctVO> selectLctList(); //강의리스트를 가져온다.
	public ArrayList<PrfsVO> selectPrfsList(); //교수리스트를 가져온다.
	public ArrayList<StudVO> selectStudList(); //학생리스트를 가져온다.
	public ArrayList<DeptVO> selectDeptList(); //학과리스트를 가져온다.
}
