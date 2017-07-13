package com.avengers.admin.main.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import com.avengers.db.dto.AdminVO;
import com.avengers.db.dto.DeptVO;
import com.avengers.db.dto.LctVO;
import com.avengers.db.dto.LoaVO;
import com.avengers.db.dto.PerschdVO;
import com.avengers.db.dto.PrfsVO;
import com.avengers.db.dto.RtsVO;
import com.avengers.db.dto.ScrapplVO;
import com.avengers.db.dto.StudVO;

public interface AdminMainService {
	public ArrayList<LctVO> selectLctList()throws SQLException; //강의리스트를 가져온다.
	public ArrayList<PrfsVO> selectPrfsList()throws SQLException; //교수리스트를 가져온다.
	public ArrayList<StudVO> selectStudList()throws SQLException; //학생리스트를 가져온다.
	public ArrayList<DeptVO> selectDeptList()throws SQLException; //학과리스트를 가져온다.
	public AdminVO selectAdminInfo(String adminId) throws SQLException;
	public ArrayList<Integer> getStudStatus() throws SQLException;//재학, 휴학, 자퇴, 제적의 학생수를 가져온다.
	public ArrayList<LoaVO> getUntreatedLoa() throws SQLException;//미처리된 휴학신청정보들을 가져온다.
	public ArrayList<RtsVO> getUntreatedRts() throws SQLException;//미처리된 복학신청정보들을 가져온다.
	public ArrayList<PerschdVO> getPerschdList(String adminId) throws SQLException; //개인일정 정보를 가져온다.
	public ArrayList<Map<String,String>> getScrapplList() throws SQLException; //미처리된 장학신청정보를 가져온다.
	public ArrayList<Map<String,Object>> getPrfsOfDeptList() throws SQLException; //학과당 교수의 수를 가져온다.
}
