package com.avengers.professor.studentManage.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.avengers.db.dto.BoardVO;
import com.avengers.db.dto.CnsVO;
import com.avengers.db.dto.PrfsVO;
import com.avengers.db.dto.StudVO;


public interface ProfessorStudentManageService {
		public CnsVO cnsDetail(String cns_num) throws SQLException;
		public void counselDateInsert(String cns_date, String cns_prfs, String cns_kind) throws SQLException;
		public List<StudVO> getDepartmentStudentList(PrfsVO prfsVO) throws SQLException;
		public int getDepartmentStudentListCount(PrfsVO prfsVO) throws SQLException;
		//학생상담
		public ArrayList<CnsVO> selectCnsList(String cns_prfs)throws SQLException; //전체상담내역과  특정검색 조건을 추가하여 검색한다.
		public CnsVO selectCns(String cns_prfs,String cns_stud)throws SQLException; //특정학생의 상담내역을 관리한다.
		public void updateCns(CnsVO cnsVO)throws SQLException;//상담내역을 수정한다.
		//학과관리
		public ArrayList<StudVO> selectStudList(String prfs_num)throws SQLException; //PRFS테이블에서 prfs_num으로 교수의 학과번호를 가져온뒤 학과번호로 STUD테이블의 해당학과 학생들을 검색한다. 
		public StudVO selectStud(String stud_num)throws SQLException; //해당학과 특정학생을 검색한다.
}
