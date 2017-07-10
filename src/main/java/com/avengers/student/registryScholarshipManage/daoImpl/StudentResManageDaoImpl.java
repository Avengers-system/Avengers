package com.avengers.student.registryScholarshipManage.daoImpl;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.w3c.dom.views.DocumentView;

import com.avengers.db.dto.LoaVO;
import com.avengers.db.dto.LsVO;
import com.avengers.db.dto.RtsVO;
import com.avengers.student.registryScholarshipManage.dao.StudentResManageDao;
import com.lowagie.text.Document;
import com.lowagie.text.pdf.PdfWriter;

/**
 * 학생 학적관리 
 * StudentResManageDao interfaceImpl
 * @author 조영훈
 * 최조작성 2017.07.10
 */
public class StudentResManageDaoImpl implements StudentResManageDao{

	@Autowired
	protected SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public DocumentView getDocument() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void buildPdfDocument(Document document, PdfWriter pdfWriter)
			throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int insertLoa(LoaVO loa) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertRts(RtsVO rts) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertLs(LsVO ls) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

}
