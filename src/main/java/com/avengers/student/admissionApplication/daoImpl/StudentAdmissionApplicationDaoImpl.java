package com.avengers.student.admissionApplication.daoImpl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.avengers.db.dto.CartVO;
import com.avengers.db.dto.LctVO;
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
	public ArrayList<LctVO> selectLctList(LctVO lctVO) throws SQLException {
		return null;
	}

	@Override
	public ArrayList<TlVO> selectTlList(String tl_stud) throws SQLException {
		return null;
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
	public ArrayList<CartVO> selectCartList(String cart_stud)
			throws SQLException {
		return null;
	}

	@Override
	public int insertCart(CartVO cartVO) throws SQLException {
		return 0;
	}

	@Override
	public int deleteCart(String cart_lct, String cart_stud)
			throws SQLException {
		return 0;
	}

	@Override
	public List<HashMap<String, String>> selectStudClass(String tl_stud)
			throws SQLException {
		return null;
	}

	

}
