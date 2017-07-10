package com.avengers.student.mypage.dao;

import java.sql.SQLException;

import com.avengers.db.dto.DeptVO;
import com.avengers.db.dto.PerschdVO;
import com.avengers.db.dto.StudVO;


/**
 * 학생 mypage
 * StudentMyPageDao 
 * @author 조영훈
 * 최초작성 2017.07.10
 */
public interface StudentMyPageDao {
	
	//개인정보 수정
	//1은 성공,-1은 실패
	public int updateMyInfo(StudVO stud,DeptVO dept) throws SQLException;
	
	//개인정보 조회
	//학생의 학과번호로 학과 이름을 찾는다.
	public StudVO selectMyInfo(String stud_num) throws SQLException;
	
	//개인일정 입력
	public int insertPerschd(PerschdVO perschd)throws SQLException;
	
	//개인일정 수정
	public int updatePerschd(PerschdVO perschd)throws SQLException;
	
	//개인일정 삭제
	public int deletePersched(PerschdVO persched)throws SQLException;
	
}
