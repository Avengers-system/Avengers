package com.avengers.student.admissionApplication.serviceImpl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.avengers.db.dto.AdmissionApplicationVO;
import com.avengers.db.dto.CartVO;
import com.avengers.db.dto.LctVO;
import com.avengers.db.dto.LrVO;
import com.avengers.db.dto.StudVO;
import com.avengers.db.dto.TlVO;
import com.avengers.student.admissionApplication.daoImpl.StudentAdmissionApplicationDaoImpl;
import com.avengers.student.admissionApplication.service.StudentAdmissionApplicationService;


/**
 * 수강신청
 * StudentAdmissionApplicationServiceImpl
 * @author 관리자
 *2017.07.11
 */

@Service
public class StudentAdmissionApplicationServiceImpl implements
		StudentAdmissionApplicationService {

	@Autowired
	private StudentAdmissionApplicationDaoImpl stuAdmAppDAO;
	

	@Override
	public List<HashMap<String, String>> selectLctList(AdmissionApplicationVO lctVO) throws SQLException {
		return stuAdmAppDAO.selectLctList(lctVO);
	}

	@Override
	public List<HashMap<String, String>> selectTlList(AdmissionApplicationVO tl_stud) throws SQLException {
		return stuAdmAppDAO.selectTlList(tl_stud);
	}

	@Override
	public int insertTl(TlVO tlVO) throws SQLException {		
		return stuAdmAppDAO.insertTl(tlVO);
	}

	@Override
	public int deleteTl(String tl_num) throws SQLException {
		return stuAdmAppDAO.deleteTl(tl_num);
	}

	@Override
	public List<HashMap<String, String>> selectCartList(AdmissionApplicationVO cart_stud)
			throws SQLException {
		return stuAdmAppDAO.selectCartList(cart_stud);
	}

	@Override
	public int insertCart(CartVO cartVO) throws SQLException {
		return stuAdmAppDAO.insertCart(cartVO);
	}

	@Override
	public int deleteCart(CartVO cartVO)
			throws SQLException {
		return stuAdmAppDAO.deleteCart(cartVO);
	}

	@Override
	public List<HashMap<String, String>> selectStudClass(String tl_stud)
			throws SQLException {
		return stuAdmAppDAO.selectStudClass(tl_stud);
	}

	@Override
	public StudVO selectStudMaxCrd(String stud_num) throws SQLException {
		return stuAdmAppDAO.selectStudMaxCrd(stud_num);
	}

	@Override
	public CartVO selectCart(CartVO cartVO) throws SQLException {
		return stuAdmAppDAO.selectCart(cartVO);
	}

	@Override
	public int updateLctMinus(String tl_lct) throws SQLException {
		return stuAdmAppDAO.updateLctMinus(tl_lct);
	}

	@Override
	public int updateLctPlus(String tl_lct) throws SQLException {
		return stuAdmAppDAO.updateLctPlus(tl_lct);
	}

	@Override
	public TlVO selectTl(TlVO tlVO) throws SQLException {
		return stuAdmAppDAO.selectTl(tlVO);
	}

	@Override
	public ArrayList<TlVO> selectTl_LCTList(TlVO tlVO) throws SQLException {
		return stuAdmAppDAO.selectTl_LCTList(tlVO);
	}


	@Override
	public LctVO selectLct(String tl_lct) throws SQLException {
		return stuAdmAppDAO.selectLct(tl_lct);
	}

	@Override
	public LrVO selectLr(String lct_num) throws SQLException {
		return stuAdmAppDAO.selectLr(lct_num);
	}


	

}
