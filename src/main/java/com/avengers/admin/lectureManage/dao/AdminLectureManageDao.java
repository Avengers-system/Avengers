package com.avengers.admin.lectureManage.dao;

import java.util.ArrayList;

import com.avengers.db.dto.LctVO;

public interface AdminLectureManageDao {
	public ArrayList<LctVO> selectLctList(int firstRow,int lastRow);//전체강의 가져오기
	public LctVO selectLct(String lct_num);//강의 상세정보 읽어오기
	public int insertLct(LctVO lctVO);//강의 등록
	public int updateLct(LctVO lctVO,String lct_num);//강의 수정
	public int deleteLct(String lct_num);//강의 삭제
}
