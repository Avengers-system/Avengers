package com.avengers.professor.main.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import com.avengers.db.dto.BoardVO;
import com.avengers.db.dto.CnsVO;
import com.avengers.db.dto.LctVO;
import com.avengers.db.dto.PerschdVO;
import com.avengers.db.dto.PrfsVO;

public interface ProfessorMainDao {
		//교수 화면 메인에 나오는 교수 정보
		//교수의 아이디를 통해 조회
		public PrfsVO selectStudInfo(String stud_num) throws SQLException;
		
		//개인일정 조회
		//작성자ID를 통해 개인일정을 조회한다.
		//작성자 아이디를 통해 개인일정분류 번호 조회
		//개인일정분류번호를 통해 개인일정조회
		public ArrayList<PerschdVO> selectPerschd(String PSC_WRITER) throws SQLException;
		
		//강의현황
		//교수 고유번호를 통해 교수가 진행중인 강의 조회
		public ArrayList<LctVO> selectLctList(String lct_prfs,String lct_yr,String lct_qtr)throws SQLException;
		
		//상담현황
		//교수 고유번호를 통해 상담조회
		public ArrayList<CnsVO> selectCnsList(String cns_prfs) throws SQLException;
		
		
	   //포털소식,학교공지,학과공지,학사일정 조회
		public ArrayList<BoardVO> selectBoradList();
}
