package com.avengers.admin.professorManage.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import com.avengers.db.dto.DeptVO;
import com.avengers.db.dto.PrfsVO;

public interface AdminProfessorManageDao {
	public String selectPrfsNum() throws SQLException; //현재 입력한 교수의  prfs_num 가져오기 
	public ArrayList<PrfsVO> selectPrfsList()throws SQLException;//전체 교수 목록 가져오기
	public PrfsVO selectPrfs(String prfs_num)throws SQLException;//교수 상세정보 읽어오기
	public int insertPrfs(PrfsVO prfsVO)throws SQLException;//교수 등록
	public int updatePrfs(PrfsVO prfsVO)throws SQLException;//교수 수정
	public int deletePrfs(String prfs_num)throws SQLException;//교수 삭제
	public int insertSecurity(PrfsVO prfsVO2); //교수 security 등록 
	public int selectCountPrfs(); //전체 교수 카운트
	public ArrayList<PrfsVO> selectPrfsList(String key, int firstRow, int lastRow) throws SQLException;//전체 교수 목록 가져오기
	public ArrayList<DeptVO> selectDeptList() throws SQLException; //전체 과목 리스트
	public int getEmpListCount(PrfsVO prfsVO) throws SQLException;
	public ArrayList<PrfsVO> getEmpList(PrfsVO prfsVO)throws SQLException;
}
