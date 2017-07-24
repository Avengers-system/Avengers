package com.avengers.student.registryScholarshipManage.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.avengers.db.dto.LoaRtsVO;
import com.avengers.db.dto.RegVO;
import com.avengers.db.dto.ScrVO;
import com.avengers.db.dto.ScrapplVO;
import com.avengers.db.dto.resSchStudentVO;



/**
 * 학생의 장학/등록금관리 메뉴
 * @author 
 * 2017.07.11.배진
 * 2017.07.24.배진 (scr,scrAppl 두가지검색하는 메서드추가)
 *
 */
public interface StudentResManageDao {
	/**
	 * 학생 장학이력/신청조회 탭에서
	 * 학생정보 조회
	 */
	public ArrayList<resSchStudentVO> selectresSchStudent(String stud_num,String lct_yr) throws SQLException;
	
	/**
	 * 장학이력,신청조회
	 * 학생고유번호로 장학정보를 검색한뒤에 승인여부가 승인일경우엔 장학이력 테이블에 데이터를 넣고
	 * 승인이 취소되었거나 혹은 아직 신청중인경우에는 신청조회목록으로 들어간다.
	 * HashMap을 이용하여 원하는 검색조건으로 검색이 가능하다.
	 * @param scrappl_stud
	 * @param map
	 * @return
	 */
	public ArrayList<ScrapplVO> selectScrapplList(String scrappl_stud,HashMap<String,String> map)throws SQLException;
	
	/**
	 * 장학금신청
	 * 모든정보들을 입력한뒤에 장학신청을 할수있다.
	 * @param scrapplVO
	 * @return
	 */		
	public int insertScrappl(ScrapplVO scrapplVO)throws SQLException;
	
	/**
	 * 등록금이력 조회
	 * 학생의 고유번호를 통해 그동안 납부했던 등록금이력에 대해 조회한다.
	 * @param reg_stud
	 * @return
	 * @throws SQLException
	 */
	public ArrayList<RegVO> selectRegList(String reg_stud)throws SQLException;
	
	/**
	 * 납부할 등록금조회
	 * @param reg_stud
	 * @return
	 * @throws SQLException
	 */
	public RegVO selectReg(String reg_stud)throws SQLException;
	
	/**
	 * 등록금 분할납부신청
	 * 필요한 정보들을 입력후 신청하면 신청된다.
	 * @param regVO
	 * @return
	 * @throws SQLException
	 */
	public int updateReg(RegVO regVO)throws SQLException;
	
	/**
	 * 학생의 휴학 및 복학 정보를 보여준다.
	 * @param loa_stud
	 * @return LoaRtsVO
	 * @throws SQLException
	 */
	public ArrayList<LoaRtsVO> selectLoaRts(String loa_stud)throws SQLException;
	/**
	 * 학생의 장학내역을 조회한다.
	 * @param scrApplVO
	 * @return
	 * @throws SQLException
	 */
	public List<HashMap<String,String>> selectScrList (ScrapplVO scrApplVO)throws SQLException;
	/**
	 * 학생의 장학신청내역을 조회한다.
	 * @param scrApplVO
	 * @return
	 * @throws SQLException
	 */
	public List<HashMap<String,String>> selectScrApplList (ScrapplVO scrApplVO)throws SQLException;
	/**
	 * 학생의 수강내역이 없을경우 ex)신입생인경우 
	 * 학생의 정보들을 보여주기위한 메서드
	 * @param stud_num
	 * @return
	 * @throws SQLException
	 */
	public resSchStudentVO selectStudInfo(String stud_num)throws SQLException;
	/**
	 * 장학의 기본정보들 조회
	 * @return
	 * @throws SQLException
	 */
	public ArrayList<ScrVO> selectScrVO()throws SQLException;
}
