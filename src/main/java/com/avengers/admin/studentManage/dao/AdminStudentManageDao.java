package com.avengers.admin.studentManage.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import com.avengers.db.dto.StudVO;

public interface AdminStudentManageDao {
	public ArrayList<StudVO> selectStudList(String key,int firstRow,int lastRow)throws SQLException;//전체 학생 목록 가져오기
	public StudVO selectStud(String stud_num)throws SQLException;//학생 상세정보 읽어오기
	public int insertStud(StudVO studVO)throws SQLException;//학생 등록
	public int updateStud(StudVO studVO,String stud_num)throws SQLException;//학생 수정
	public int deleteStud(String stud_num)throws SQLException;//학생 삭제
}
