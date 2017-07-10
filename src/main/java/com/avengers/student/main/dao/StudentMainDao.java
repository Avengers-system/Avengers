package com.avengers.student.main.dao;


import com.avengers.db.dto.StudVO;


/**
 * 학생 메인 화면
 * StudentMainDao interface
 * @author 조영훈
 * 최초작성 2017.07.10
 */
public interface StudentMainDao {
	
	//학적 상태 정보 (이름,학년) 조회
	//학생 화면 메인에 나오는 학생 정보
	//학생의 아이디(학번)를 통해 조회
	public StudVO selectByStudInfo(String stud_num);
	
	//학적 상태정보 (학과 이름 )조회
	public String selectByDeptNm(String stud_dept);
	
	//학적 상태정보 (단과대학) 조회
	public String selectByColNm(String col_code);
	
	//개인일정 조회
	
	
}
