package com.avengers.admin.main.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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

public interface AdminMainDao {
	public ArrayList<LctVO> selectLctList()throws SQLException; //강의리스트를 가져온다.
	public ArrayList<PrfsVO> selectPrfsList()throws SQLException; //교수리스트를 가져온다.
	public ArrayList<StudVO> selectStudList()throws SQLException; //학생리스트를 가져온다.
	public ArrayList<DeptVO> selectDeptList()throws SQLException; //학과리스트를 가져온다.
	public AdminVO selectAdminInfo(String adminId) throws SQLException;//관리자의 정보를 가져온다.
	public int getInSchoolCount() throws SQLException;//재학생수를 가져온다.
	public int getRestSchoolCount() throws SQLException;//휴학생수를 가져온다.
	public int getLeaveSchoolCount() throws SQLException;//자퇴한 학생 수를 가져온다.
	public int getGetOutSchoolCount() throws SQLException;//제적한 학생 수를 가져온다.
	public ArrayList<LoaVO> selectUntreatedLoaList() throws SQLException; //미처리된 휴학신청정보를 가져온다.
	public ArrayList<RtsVO> selectUntreatedRtsList() throws SQLException; //미처리된 복학신청정보를 가져온다.
	public ArrayList<PerschdVO> selectPerschdList(String adminId) throws SQLException; //개인일정을 가져온다.
	public ArrayList<Map<String,String>> selectScrapplList() throws SQLException; //미처리된 장학신청정보를 가져온다.
	public ArrayList<Map<String,Object>> selectPrfsOfDeptList() throws SQLException; //학과당 교수의 수를 가져온다.
	public String selectNextPrfsNum() throws SQLException; //다음번 교수번호를 가져온다.
	public List<HashMap<String, String>> selectLeaveDeptList() throws SQLException;//휴학한 학생의 수와 학과. 학과별 휴학생의수
}
