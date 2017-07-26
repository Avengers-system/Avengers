package com.avengers.student.main.dao;


import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.avengers.db.dto.AdmissionApplicationVO;
import com.avengers.db.dto.BoardVO;
import com.avengers.db.dto.CnsVO;
import com.avengers.db.dto.DeptVO;
import com.avengers.db.dto.LctVO;
import com.avengers.db.dto.PerschdVO;
import com.avengers.db.dto.StudVO;
import com.avengers.db.dto.StudentMainVO;
import com.avengers.db.dto.TlLctRequest;
import com.avengers.db.dto.TlVO;


/**
 * 학생 메인 화면
 * StudentMainDao
 * @author 조영훈
 * 최초작성 2017.07.10
 */
public interface StudentMainDao {
	public ArrayList<BoardVO> selectPortalNoticeList() throws SQLException;
 	public ArrayList<BoardVO> selectSchoolNoticeList() throws SQLException;
 	public ArrayList<BoardVO> selectDepartmentNoticeList(String bc_dept) throws SQLException;
 	public ArrayList<PerschdVO> selectSchoolScheduleList() throws SQLException;
 	public String selectSchedule(String stud_num) throws SQLException;
 	
 	
 	public ArrayList<BoardVO> getStudMainSchoolNotice() throws SQLException;
 	public ArrayList<BoardVO> getStudMainDepartNotice(String stud_dept) throws SQLException;
 	public ArrayList<BoardVO> getStudMainPotalNotice() throws SQLException;
 	public String getDeptNum(String stud_num) throws SQLException;
 	
 	public List<HashMap<String, String>> selectCartList(AdmissionApplicationVO cart_stud) throws SQLException;
 	public List<HashMap<String, String>> selectLctList(AdmissionApplicationVO lctVO) throws SQLException;
 	public List<HashMap<String, String>> selectTlList(AdmissionApplicationVO tl_stud) throws SQLException;
 	public StudVO selectStudMaxCrd(String stud_num) throws SQLException;
 	public ArrayList<TlVO> selectTl_LCTList(TlVO tlVO) throws SQLException;
 	public LctVO selectLct(String tl_lct) throws SQLException;
 	
 	
 	
 	
	
	public String allGrades(String stud_num) throws SQLException;
	public ArrayList<StudentMainVO> selectLectureList(String tl_stud,String lct_yr, String lct_qtr) throws SQLException;
	public DeptVO selectDept(String dept_num) throws SQLException;
	//학적 상태 정보 (이름,학년) 조회
	//학생 화면 메인에 나오는 학생 정보
	//학생의 아이디(학번)를 통해 조회
	//table join
	//학적 상태정보 (학과 이름 )조회
	//학적 상태정보 (단과대학) 조회
	public StudVO selectStudInfo(String stud_num) throws SQLException;
	
	//개인일정 조회
	//작성자ID를 통해 개인일정을 조회한다.
	//작성자 아이디를 통해 개인일정분류 번호 조회
	//개인일정분류번호를 통해 개인일정조회
	public ArrayList<PerschdVO> selectPerschd(String PSC_WRITER) throws SQLException;
	
	//수강현황
	//학생 고유번호를 통해 학생이 듣고 있는 수강 조회
	//수강 고유 번호를 통해 강의 각각의 정보 조회(년도,학기,과목명,분반)
	public ArrayList<TlVO> selectStuTLList(String stud_num)throws SQLException;
	
	//상담현황
	//학생 고유번호를 통해 상담조회
	public ArrayList<CnsVO> selectCnsList(String cns_stud) throws SQLException;
	
	//학생정보(이수학기,총이수학점,현학기 수강신청학점)과 이수정보(전공 이수학점,교양 이수학점,교직 이수학점)
	//학생,강의,수강 테이블 join
	//이수구분을 통해 전공,교양,교직 구분
	//수강평가여부로 총 이수학점 구분,수강평가가 완료되지 않았다면 수강신청학점으로
	//이수학기는 현재학기와 현재 학년으로 구한다.ex)2학년 1학기라면 -> 2
	//ex) key 총 이수학점,value 총 이수학점 값
	public Map<String, Integer> selectBachelor(String stud_num);
	
   //포털소식,학교공지,학과공지,학사일정 조회
	public ArrayList<BoardVO> selectBoradList();
	
	//배현상
	//강의목록
	public ArrayList<Map<String, String>> selectClassList(String stud_num) throws SQLException;
	
}
