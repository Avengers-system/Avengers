package com.avengers.professor.main.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.avengers.db.dto.BoardVO;
import com.avengers.db.dto.CnsVO;
import com.avengers.db.dto.DeptVO;
import com.avengers.db.dto.LctVO;
import com.avengers.db.dto.PerschdVO;
import com.avengers.db.dto.PrfsVO;

public interface ProfessorMainService {
	
	/**
	 * 교수 화면 메인에 나오는 교수 정보
	교수의 아이디를 통해 조회
	 * @param prfs_num
	 * @return
	 * @throws SQLException
	 */
	public PrfsVO selectPrfs(String prfs_num) throws SQLException;
	
	/**
	 * 교수의 학과를 검색하여 학과공지 게시판을 이용하기위한 학과검색 메서드
	 * @param prfs_dept
	 * @return
	 * @throws SQLException
	 */
	public DeptVO selectDept(String prfs_dept ) throws SQLException;
	/**
	 * 개인일정 조회
	작성자ID를 통해 개인일정을 조회한다.
	작성자 아이디를 통해 개인일정분류 번호 조회
	개인일정분류번호를 통해 개인일정조회
	 * @param PSC_WRITER
	 * @return
	 * @throws SQLException
	 */
	public ArrayList<PerschdVO> selectPerschdList(String PSC_WRITER) throws SQLException;
	/**
	 * 학사일정 조회
	 * @return
	 */
	public ArrayList<PerschdVO> selectSchoolScheduleList() throws SQLException;
	
	/**
	 * 강의현황
	교수 고유번호를 통해 교수가 진행중인 강의 조회
	 * @param lct_prfs
	 * @param lct_yr
	 * @param lct_qtr
	 * @return
	 * @throws SQLException
	 */
	public List<HashMap<String, String>> selectLctList(String lct_prfs,String lct_yr,String lct_qtr)throws SQLException;
	
	
	/**
	 * 상담현황
	교수 고유번호를 통해 상담조회
	 * @param cns_prfs
	 * @return
	 * @throws SQLException
	 */
	public ArrayList<CnsVO> selectCnsList(String cns_prfs) throws SQLException;
	
	
 
	/** 포털소식 조회
	 * 
	 * @return
	 */
	public ArrayList<BoardVO> selectPortalNoticeList();
	/**
	 * 학교공지 조회
	 * @return
	 */
	public ArrayList<BoardVO> selectSchoolNoticeList();
	/**
	 * 학과공지 조회
	 * @return
	 */
	public ArrayList<BoardVO> selectDepartmentNoticeList(String bc_dept);
	
}
