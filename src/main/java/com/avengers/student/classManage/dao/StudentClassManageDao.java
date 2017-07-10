package com.avengers.student.classManage.dao;

import java.util.ArrayList;
import java.util.Map;

import com.avengers.db.dto.ExamVO;
import com.avengers.db.dto.LctVO;


/**
 * 수업관리
 *StudentClassManageDao interface 
 * @author 조영훈
 * 2017.07.10
 */
public interface StudentClassManageDao {
	//강의 시간표를 강의명/강의실/전공/교양으로 검색
	//강의명,시간,강의실,교수명,전공/교양,학점을 map에 넣는다.
	//강의명,전공/교양,학점은 LCT table
	//교수명은 PRFS table
	//강의실은 LRC table 
	public ArrayList<Map<String, String>> selectClassList(String searchKey);
	
	//강의 상세 페이지
	
	//강의계획서
	//교과목개요, 수업목표, 수업방법, 평가방법, 교재 및 참고서, 수업내용, 과제물
	public LctVO selectLct(String lct_nm);
	
	//시험관리
	//강의명을 통해 강의 고유번호 조회
	//시험명/기간으로 시험검색
	public ArrayList<ExamVO> selectExam(String lct_nm,String searchKey);
	
	
	
}
