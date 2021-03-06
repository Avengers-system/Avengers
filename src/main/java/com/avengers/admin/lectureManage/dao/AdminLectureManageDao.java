package com.avengers.admin.lectureManage.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import com.avengers.db.dto.LctVO;

public interface AdminLectureManageDao {
	public ArrayList<LctVO> selectLctList(String key,int firstRow,int lastRow)throws SQLException;//전체강의 가져오기
	public LctVO selectLct(String lct_num)throws SQLException;//강의 상세정보 읽어오기
	public int insertLct(LctVO lctVO)throws SQLException;//강의 등록
	public int updateLct(LctVO lctVO,String lct_num)throws SQLException;//강의 수정
	public int deleteLct(String lct_num)throws SQLException;//강의 삭제
	
	public ArrayList<Map<String, String>> selectAllLctList() throws SQLException;
}
