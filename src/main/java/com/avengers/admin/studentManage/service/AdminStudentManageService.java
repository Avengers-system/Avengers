package com.avengers.admin.studentManage.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.avengers.db.dto.BoardVO;
import com.avengers.db.dto.StudVO;

public interface AdminStudentManageService {
	public ArrayList<StudVO> selectStudList()throws SQLException;//전체 학생 목록 가져오기
	public StudVO selectStud(String stud_num)throws SQLException;//학생 상세정보 읽어오기
	public int insertStud(StudVO studVO)throws SQLException;//학생 등록
	public int updateStud(StudVO studVO)throws SQLException;//학생 수정
	public int deleteStud(String stud_num)throws SQLException;//학생 삭제
	public String selectStudNum()throws SQLException; //학생번호가져오기
	public void insertSecurity(StudVO studVO); // 시큐리티등록하기
	public ArrayList<StudVO> selectStudbyKeyword(String keyword);
	public int getEmpListCount(StudVO studVO)throws SQLException;
	public List<StudVO> getEmpList(StudVO studVO)throws SQLException;

}
