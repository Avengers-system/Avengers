package com.avengers.student.mypage.service;

import java.sql.SQLException;
import java.util.ArrayList;

import com.avengers.db.dto.DeptVO;
import com.avengers.db.dto.PerschdVO;
import com.avengers.db.dto.StudVO;

/**
 * 학생 mypage
 * StudentMypageService interface
 * @author 조영훈
 * 최초작성 2017.07.10
 */
public interface StudentMypageService {
	//개인정보 수정
		//1은 성공,-1은 실패
		public int updateMyInfo(StudVO stud,DeptVO dept) throws SQLException;
		
		//개인정보 조회
		//학생의 학과번호로 학과 이름을 찾는다.
		public StudVO selectMyInfo(String stud_num) throws SQLException;
		
		public ArrayList<PerschdVO> selectPerschdList(String perschd_writer)throws SQLException;//일정 전체목록 읽어오기
		public PerschdVO selectPerschd(int perschd_num)throws SQLException;//일정 선택 읽어오기
		public int insertPerschd(PerschdVO perschdVO)throws SQLException;//일정 등록
		public int updatePerschd(PerschdVO perschdVO)throws SQLException;//일정 수정
		public int deletePerschd(int perschd_num)throws SQLException;//일정 삭제
		public PerschdVO selectPerschd_title(String title);
		
}
