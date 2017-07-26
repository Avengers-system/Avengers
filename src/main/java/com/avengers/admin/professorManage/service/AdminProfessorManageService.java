package com.avengers.admin.professorManage.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.avengers.db.dto.PrfsVO;

public interface AdminProfessorManageService {
	public String selectPrfsNum() throws SQLException; //현재 등록한 교수 번호 찾기
	public ArrayList<PrfsVO> selectPrfsList() throws SQLException;//전체 교수 목록
	public ArrayList<PrfsVO> selectPrfsList(String key,int firstRow,int lastRow)throws SQLException;//전체 교수 목록 가져오기
	public PrfsVO selectPrfs(String prfs_num)throws SQLException;//교수 상세정보 읽어오기
	public int insertPrfs(PrfsVO prfsVO)throws SQLException;//교수 등록
	public int updatePrfs(PrfsVO prfsVO)throws SQLException;//교수 수정
	public int deletePrfs(String prfs_num)throws SQLException;//교수 삭제
	public int insertSecurity(PrfsVO prfsVO2); //시큐리티 추가
	public int getEmpListCount(PrfsVO prfsVO)throws SQLException;
	public List<PrfsVO> getEmpList(PrfsVO prfsVO)throws SQLException;
}
