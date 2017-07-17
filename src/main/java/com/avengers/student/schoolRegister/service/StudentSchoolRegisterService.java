package com.avengers.student.schoolRegister.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.avengers.db.dto.LoaVO;
import com.avengers.db.dto.LsVO;
import com.avengers.db.dto.RtsVO;
import com.lowagie.text.Document;
import com.lowagie.text.pdf.PdfWriter;

/**
 * 학생 학적관리 
 * StudentResManageService interface
 * @author 조영훈
 * 최조작성 2017.07.10
 */
public interface StudentSchoolRegisterService {
		public HashMap<String, String> selectGradeInfo(String stud_num) throws SQLException;
		public List<HashMap<String,String>> selectGradeList(String stud_num) throws SQLException;
		public int selectAllGrade(String stud_num) throws SQLException;
		public int selectAllGradeCount(String stud_num) throws SQLException;
		public void applyLeave(LoaVO vo) throws SQLException;
		public void applyBack(RtsVO vo) throws SQLException;
		public void applyDropOff(LsVO vo) throws SQLException;
		public ArrayList<LsVO> selectDropOffList(String stud_num) throws SQLException;
		public ArrayList<LoaVO> selectLeaveList(String stud_num) throws SQLException;
		public ArrayList<RtsVO> selectBackList(String stud_num) throws SQLException;
		
	//증명서 발급
		//발급할 증명서 선택 발급
		public void buildPdfDocument(Document document,PdfWriter pdfWriter) throws SQLException; 
		
		
		//휴학 신청
		// 학생은 휴학시작일,휴학종료일,휴학사유,복학예정일,학번만을 입력한다.
		public int insertLoa(LoaVO loa)throws SQLException;
		
		//복학 신청
		public int insertRts(RtsVO rts)throws SQLException;
		
		//자퇴 신청
		public int insertLs(LsVO ls)throws SQLException;
}
