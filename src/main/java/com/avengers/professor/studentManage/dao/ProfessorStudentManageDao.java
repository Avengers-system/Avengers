package com.avengers.professor.studentManage.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import com.avengers.db.dto.CnsVO;
import com.avengers.db.dto.StudVO;

public interface ProfessorStudentManageDao {
	
	//학생상담
	public ArrayList<CnsVO> selectCnsList(String cns_prfs)throws SQLException; //전체상담내역과  특정검색 조건을 추가하여 검색한다.
	public CnsVO selectCns(String cns_prfs,String cns_stud)throws SQLException; //특정학생의 상담내역을 관리한다.
	public CnsVO updateCns(CnsVO cnsVO)throws SQLException;//상담내역을 수정한다.
	//학과관리
	public ArrayList<StudVO> selectStudList(String prfs_num)throws SQLException; //PRFS테이블에서 prfs_num으로 교수의 학과번호를 가져온뒤 학과번호로 STUD테이블의 해당학과 학생들을 검색한다. 
	public StudVO selectStud(String stud_num)throws SQLException; //해당학과 특정학생을 검색한다.
}
