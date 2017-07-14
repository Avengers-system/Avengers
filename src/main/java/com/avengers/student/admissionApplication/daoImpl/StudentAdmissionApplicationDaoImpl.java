package com.avengers.student.admissionApplication.daoImpl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.avengers.db.dto.AdmissionApplicationVO;
import com.avengers.db.dto.CartVO;
import com.avengers.db.dto.LctVO;
import com.avengers.db.dto.StudVO;
import com.avengers.db.dto.TlVO;
import com.avengers.student.admissionApplication.dao.StudentAdmissionApplicationDao;

/**
 * 수강신청
 * StudentAdmissionApplicationDaoImpl 
 * @author 관리자
 *2017.07.11
 */
@Repository
public class StudentAdmissionApplicationDaoImpl implements
		StudentAdmissionApplicationDao {

	@Autowired
	protected SqlSession sqlSession;
	

	@Override
	public List<HashMap<String, String>> selectLctList(AdmissionApplicationVO admissionVO) throws SQLException {
		List<HashMap<String, String>> selectLctList = (List<HashMap<String, String>>)sqlSession.selectList("admission.selectLctList",admissionVO);
		return selectLctList;
	}

	@Override
	public List<HashMap<String, String>> selectTlList(AdmissionApplicationVO admissionVO) throws SQLException {
		List<HashMap<String, String>> selectTlList = (List<HashMap<String, String>>)sqlSession.selectList("admission.selectTlList",admissionVO);
		return selectTlList;
	}

	@Override
	public int insertTl(TlVO tlVO) throws SQLException {
		return 0;
	}

	@Override
	public int deleteTl(String tl_num) throws SQLException {
		return 0;
	}

	@Override
	public List<HashMap<String, String>> selectCartList(AdmissionApplicationVO admissionVO)
			throws SQLException {
		List<HashMap<String, String>> selectCartList = (List<HashMap<String, String>>)sqlSession.selectList("admission.selectCartList",admissionVO);
		return selectCartList;
	}

	@Override
	public int insertCart(CartVO cartVO) throws SQLException {
		return 0;
	}

	@Override
	public int deleteCart(CartVO cartVO)
			throws SQLException {
		return 0;
	}

	@Override
	public List<HashMap<String, String>> selectStudClass(String tl_stud)
			throws SQLException {
		return null;
	}

	@Override
	public StudVO selectStudMaxCrd(String stud_num) throws SQLException {
		return null;
	}

	@Override
	public CartVO selectCart(CartVO cartVO) throws SQLException {
		return null;
	}

	@Override
	public int updateLctMinus(String tl_lct) throws SQLException {
		return 0;
	}

	@Override
	public int updateLctPlus(String tl_lct) throws SQLException {
		return 0;
	}

	@Override
	public TlVO selectTl(TlVO tlVO) throws SQLException {
		return null;
	}

	@Override
	public ArrayList<TlVO> selectTlList(TlVO tlVO) throws SQLException {
		return null;
	}


	@Override
	public LctVO selectLct(String tl_lct) throws SQLException {
		return null;
	}

	

}
