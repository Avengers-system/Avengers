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
		int insertTl = (int)sqlSession.insert("tl.insertTl",tlVO);
		return insertTl;
	}

	@Override
	public int deleteTl(String tl_num) throws SQLException {
		int deleteTl = (int)sqlSession.delete("tl.deleteTl",tl_num);
		return deleteTl;
	}

	@Override
	public List<HashMap<String, String>> selectCartList(AdmissionApplicationVO admissionVO)
			throws SQLException {
		List<HashMap<String, String>> selectCartList = (List<HashMap<String, String>>)sqlSession.selectList("admission.selectCartList",admissionVO);
		return selectCartList;
	}

	@Override
	public int insertCart(CartVO cartVO) throws SQLException {
		int insertCart = (int)sqlSession.insert("cart.insertCart",cartVO);
		return insertCart;
	}

	@Override
	public int deleteCart(CartVO cartVO)
			throws SQLException {
		int deleteCart = (int)sqlSession.delete("cart.deleteCart",cartVO);
		return deleteCart;
	}

	@Override
	public List<HashMap<String, String>> selectStudClass(String tl_stud)
			throws SQLException {
		return null;
	}

	@Override
	public StudVO selectStudMaxCrd(String stud_num) throws SQLException {
		StudVO selectStudMaxCrd = (StudVO)sqlSession.selectOne("student.getStudentInfo",stud_num);
		return selectStudMaxCrd;
	}

	@Override
	public CartVO selectCart(CartVO cartVO) throws SQLException {
		CartVO selectCart = (CartVO)sqlSession.selectOne("cart.selectCart",cartVO);
		return selectCart;
	}

	@Override
	public int updateLctMinus(String tl_lct) throws SQLException {
		int updateLctMinus = (int)sqlSession.update("lct.updateLctMinus",tl_lct);
		return updateLctMinus;
	}

	@Override
	public int updateLctPlus(String tl_lct) throws SQLException {
		int updateLctPlus = (int)sqlSession.update("lct.updateLctPlus",tl_lct);
		return updateLctPlus;
	}

	@Override
	public TlVO selectTl(TlVO tlVO) throws SQLException {
		TlVO selectTl =(TlVO)sqlSession.selectOne("tl.selectTl",tlVO);
		return selectTl;
	}

	@Override
	public ArrayList<TlVO> selectTl_LCTList(TlVO tlVO) throws SQLException {
		ArrayList<TlVO> selectTl_LCTList = (ArrayList<TlVO>)sqlSession.selectList("tl.slectTl_lctList", tlVO);
		return selectTl_LCTList;
	}


	@Override
	public LctVO selectLct(String tl_lct) throws SQLException {
		LctVO selectLct =(LctVO)sqlSession.selectOne("lct.selectLct",tl_lct);
		return selectLct;
	}

	

}
