package com.avengers.student.registryScholarshipManage.dao;


import java.sql.SQLException;

import org.w3c.dom.views.AbstractView;

import com.avengers.db.dto.LoaVO;
import com.avengers.db.dto.LsVO;
import com.avengers.db.dto.RtsVO;
import com.lowagie.text.Document;
import com.lowagie.text.pdf.PdfWriter;

/**
 * 학생 학적관리 
 * StudentResManageDao interface
 * @author 조영훈
 * 최조작성 2017.07.10
 */
public interface StudentResManageDao extends AbstractView{
	
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
