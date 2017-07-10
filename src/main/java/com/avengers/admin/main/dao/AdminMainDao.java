package com.avengers.admin.main.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import com.avengers.db.dto.DeptVO;
import com.avengers.db.dto.LctVO;
import com.avengers.db.dto.PrfsVO;
import com.avengers.db.dto.StudVO;

public interface AdminMainDao {
	public ArrayList<LctVO> selectLctList()throws SQLException; //강의리스트를 가져온다.
	public ArrayList<PrfsVO> selectPrfsList()throws SQLException; //교수리스트를 가져온다.
	public ArrayList<StudVO> selectStudList()throws SQLException; //학생리스트를 가져온다.
	public ArrayList<DeptVO> selectDeptList()throws SQLException; //학과리스트를 가져온다.
}
