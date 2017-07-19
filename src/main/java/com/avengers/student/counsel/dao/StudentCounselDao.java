package com.avengers.student.counsel.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import com.avengers.db.dto.CnsVO;


/**
 * 학생 상담관리
 * StudentCounselDao interface
 * @author 조영훈
 *2017.07.11
 */
public interface StudentCounselDao {
	public ArrayList<CnsVO> selectCounselDateList(String cns_date) throws SQLException;
	//상담 신청(입력)
	//상담 신청 교수,날짜 및 기간 선택 , 내용 입력
	public int insertCounsel(CnsVO cns,int firstRow,int endRow)throws SQLException;
	
	//상담 조회
	//기간,교수명,과목, 상담여부로 조회
	//전체목록
	public ArrayList<CnsVO> selectCounselList(String stud_num) throws SQLException;
	
	//key,학생번호로 검색
	public ArrayList<CnsVO> selectCounselList(String searchKey,String cns_stud,int firstRow,int endRow) throws SQLException;
	
	//상담 취소(삭제)
	public int deleteCounsel(String key,String cns_stud,int firstRow,int endRow) throws SQLException;
	
	
}
