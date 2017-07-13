package com.avengers.student.admissionApplication.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.avengers.db.dto.CartVO;
import com.avengers.db.dto.LctVO;
import com.avengers.db.dto.TlVO;

/**
 * 수강신청
 * StudentAdmissionApplicationService interface
 * @author 관리자
 *2017.07.11 최초작성
 *2017.07.13 대폭수정
 */
public interface StudentAdmissionApplicationService {
	//수강 검색
		//개설강좌 리스트
		//신청,과목번호,과목명,이수구분,강의실,담당교수,시간표,학점,수강제한인원,수강신청인원,강의계획서
		public ArrayList<LctVO> selectLctList(LctVO lctVO) throws SQLException;
			
		//신청내역리스트
		//학생 번호로 신청 내역리스트 조회
		public ArrayList<TlVO> selectTlList(String tl_stud) throws SQLException;
		
		//수강 신청
		//수강 신청 기간에	
		//개설강좌리스트 -> 신청 내역리스트
		public int insertTl(TlVO tlVO) throws SQLException;
		
		//신청 내역리스트 취소
		public int deleteTl(String tl_num) throws SQLException;
		
		//장바구니기간에
		//개설강좌리스트 -> 장바구니리스트
		public ArrayList<CartVO> selectCartList(String cart_stud)throws SQLException;
		
		public int insertCart(CartVO cartVO) throws SQLException;
		
		//장바구니리스트 취소
		public int deleteCart(String cart_lct,String cart_stud) throws SQLException;
		
		//시간표 보기(신청한 강의)
		public List<HashMap<String,String>> selectStudClass(String tl_stud) throws SQLException;
}
