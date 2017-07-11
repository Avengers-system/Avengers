package com.avengers.student.admissionApplication.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import com.avengers.db.dto.LctVO;
import com.avengers.db.dto.TlVO;

/**
 * 수강신청
 * StudentAdmissionApplicationService interface
 * @author 관리자
 *2017.07.11
 */
public interface StudentAdmissionApplicationService {
	//수강 검색
	//개설강좌 리스트
	//신청,과목번호,과목명,이수구분,강의실,담당교수,시간표,학점,수강제한인원,수강신청인원,강의계획서
	public ArrayList<LctVO> selectLctList(Map<String, String> searchKeys) throws SQLException;
	
	//수강 신청 목록
	//개설강좌 리스트
	//강의 table에 교수번호로 학생과 일치하는 학과 조회
	public ArrayList<LctVO> selectLctList()throws SQLException;
	
	//신청내역리스트
	//학생 번호로 신청 내역리스트 조회
	public ArrayList<TlVO> selectTlList(String tl_stud) throws SQLException;
	
	//수강 신청
	//수강 신청 기간에
	//개설강좌리스트 -> 신청 내역리스트
	public int insertTlList(ArrayList<TlVO> tlList) throws SQLException;
	
	//신청 내역리스트 취소
	public int deleteTlList(ArrayList<TlVO> tlList) throws SQLException;
	
	//장바구니기간에
	//개설강좌리스트 -> 장바구니리스트
	public int insertCartList(ArrayList<TlVO> tlList) throws SQLException;
	
	//장바구니리스트 취소
	public int delteCartList(ArrayList<TlVO> tlList) throws SQLException;
	
	//시간표 보기(신청한 강의)
	public ArrayList<TlVO> selectStudClass(String tl_stud) throws SQLException;
}
