package com.avengers.professor.classManage.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import com.avengers.db.dto.EqVO;
import com.avengers.db.dto.LctVO;
import com.avengers.db.dto.SaVO;
import com.avengers.db.dto.TeVO;

public interface ProfessorClassManageDao {
	public ArrayList<LctVO> selectLctList() throws SQLException; //강의 전체 리스트를 불러온다.
	public LctVO selectLct(String lct_num ) throws SQLException; //검색한 특정 강의를 불러온다.
	public int insertLct(LctVO lctVO) throws SQLException; //강의계획서에 보여줄 내용을 등록한다.
	public int updateLct(LctVO lctVO,String lct_num) throws SQLException; //강의계획서에 보여줄 내용을 수정한다.
	
	public ArrayList<TeVO> selectTeList(String exam_lct) throws SQLException; //현재 강의에 대한 시험 응시현황을 불러온다.먼저 exam테이블에 강의고유번호로 시험고유번호를 구한뒤 te에서 시험고유번호로 검색한다.
	public ArrayList<EqVO> selectEqList(String exam_num) throws SQLException; //교수가 클릭한 시험에대한 문제정보들을 불러온다.
	public ArrayList<SaVO> selectSaList(String te_num) throws SQLException; //교수가 응시확인 화면에서 클릭한 해당항목에 대한 학생의 답안들을 불러온다.
	
	
}
