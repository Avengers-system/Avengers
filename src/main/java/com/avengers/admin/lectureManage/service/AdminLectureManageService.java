package com.avengers.admin.lectureManage.service;

import java.sql.SQLException;
import java.util.ArrayList;

import com.avengers.db.dto.LctVO;

public interface AdminLectureManageService {
	public ArrayList<LctVO> selectLctList(String key,int firstRow,int lastRow)throws SQLException;//전체강의 가져오기
	public LctVO selectLct(String lct_num)throws SQLException;//강의 상세정보 읽어오기
	public int insertLct(LctVO lctVO)throws SQLException;//강의 등록
	public int updateLct(LctVO lctVO,String lct_num)throws SQLException;//강의 수정
	public int deleteLct(String lct_num)throws SQLException;//강의 삭제
}
