package com.avengers.student.admissionApplication.serviceImpl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.avengers.db.dto.CartVO;
import com.avengers.db.dto.LctVO;
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
	public ArrayList<LctVO> selectLctList(LctVO lctVO) throws SQLException {
		return stuAdmAppDAO.selectLctList(lctVO);
	}

	@Override
	public ArrayList<TlVO> selectTlList(String tl_stud) throws SQLException {
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
	public ArrayList<CartVO> selectCartList(String cart_stud)
			throws SQLException {
		return stuAdmAppDAO.selectCartList(cart_stud);
	}

	@Override
	public int insertCart(CartVO cartVO) throws SQLException {
		return stuAdmAppDAO.insertCart(cartVO);
	}

	@Override
	public int deleteCart(String cart_lct, String cart_stud)
			throws SQLException {
		return stuAdmAppDAO.deleteCart(cart_lct, cart_stud);
	}

	@Override
	public List<HashMap<String, String>> selectStudClass(String tl_stud)
			throws SQLException {
		return stuAdmAppDAO.selectStudClass(tl_stud);
	}

	

}
