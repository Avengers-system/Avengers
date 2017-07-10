package com.avengers.admin.professorManage.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import com.avengers.db.dto.PrfsVO;

public interface AdminProfessorManageDao {
	public ArrayList<PrfsVO> selectPrfsList(int firstRow,int lastRow)throws SQLException;//전체 교수 목록 가져오기
	public PrfsVO selectPrfs(String prfs_num)throws SQLException;//교수 상세정보 읽어오기
	public int insertPrfs(PrfsVO prfsVO)throws SQLException;//교수 등록
	public int updatePrfs(PrfsVO prfsVO,String prfs_num)throws SQLException;//교수 수정
	public int deletePrfs(String prfs_num)throws SQLException;//교수 삭제
}
