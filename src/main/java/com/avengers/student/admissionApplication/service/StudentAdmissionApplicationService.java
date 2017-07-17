package com.avengers.student.admissionApplication.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.avengers.db.dto.AdmissionApplicationVO;
import com.avengers.db.dto.CartVO;
import com.avengers.db.dto.LctVO;
import com.avengers.db.dto.LrVO;
import com.avengers.db.dto.StudVO;
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
		public List<HashMap<String, String>> selectLctList(AdmissionApplicationVO lctVO) throws SQLException;
			
		//신청내역리스트
		//학생 번호로 신청 내역리스트 조회
		public List<HashMap<String, String>> selectTlList(AdmissionApplicationVO tl_stud) throws SQLException;
		
		//수강 신청
		//수강 신청 기간에	
		//개설강좌리스트 -> 신청 내역리스트
		public int insertTl(TlVO tlVO) throws SQLException;
		
		//신청 내역리스트 취소
		public int deleteTl(String tl_num) throws SQLException;
		
		//장바구니기간에
		//개설강좌리스트 -> 장바구니리스트
		public List<HashMap<String, String>> selectCartList(AdmissionApplicationVO cart_stud)throws SQLException;
		
		public int insertCart(CartVO cartVO) throws SQLException;
		
		//장바구니리스트 취소
		public int deleteCart(CartVO cartVO) throws SQLException;
		
		//시간표 보기(신청한 강의)
		public List<HashMap<String,String>> selectStudClass(String tl_stud) throws SQLException;
		
		/**
		 * STUD_MAX_CRD검색 최대신청가능학점
		 * @param stud_num
		 * @return
		 * @throws SQLException
		 */
		public StudVO selectStudMaxCrd(String stud_num) throws SQLException;
		/**
		 * stud_num,cart_lct로 검색 중복으로 장바구니 추가가 안되기위해 인서트 전에 검색
		 * @param cartVO
		 * @return
		 * @throws SQLException
		 */
		public CartVO selectCart(CartVO cartVO)throws SQLException;
		/**
		 * tl_lct로 검색해서 lct_cnt_num-1 수강신청이후에 해줌
		 * @param tl_lct
		 * @return
		 * @throws SQLException
		 */
		public int updateLctMinus(String tl_lct)throws SQLException;
		/**
		 * tl_lct로 검색해서 lct_cnt_num+1 수강취소이후에 해줌
		 * @param tl_lct
		 * @return
		 * @throws SQLException
		 */
		public int updateLctPlus(String tl_lct)throws SQLException;
		/**
		 * stud_num,tl_lct로 검색 수강신청 이전에 중복을막기 위해 먼저실행
		 * @param tlVO
		 * @return
		 * @throws SQLException
		 */
		public TlVO selectTl(TlVO tlVO)throws SQLException;
		/**
		 * 현재 수강신청한 학점을 구하기위해서 먼저 수강리스트들을 불러온다 여기서 각 lct_num들을 찾아온다.	
		 * @param tlVO
		 * @return
		 * @throws SQLException
		 */
		public ArrayList<TlVO> selectTl_LCTList(TlVO tlVO)throws SQLException;
		/**
		 * 수강신청 이전에  LCT_QUA_NUM != LCT_CNT_NUM 최대수강신청인원이 현재 수강신청한 인원과 같지않아야 신청할수있도록
		 * 값을 비교해준다.
		 * 또한
		 * for문을 돌려서 selectTlList 로 불러온 lct_num을 하나하나 넣어주면서 lct_crd를 찾아와서 변수에 계속 더해준다.
		 * 이렇게 현재 총신청한 학점을 구할수있게된다.
		 * @param tl_lct
		 * @return
		 * @throws SQLException
		 */
		public LctVO selectLct(String tl_lct)throws SQLException;
		/**
		 * 수강신청시 중복되는 시간대에 수강신청을 하는것을 막기위해서 수강신청하려는 강의의 시간을 가져오는 메서드
		 * @param lct_num
		 * @return
		 * @throws SQLException
		 */
		public LrVO selectLr(String lct_num)throws SQLException;
}
