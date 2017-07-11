package com.avengers.student.admissionApplication.daoImpl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public ArrayList<LctVO> selectLctList(Map<String, String> searchKeys)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<LctVO> selectLctList() throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<TlVO> selectTlList(String tl_stud) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertTlList(ArrayList<TlVO> tlList) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteTl(ArrayList<TlVO> tlList) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertCartList(ArrayList<TlVO> tlList) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delteCart(ArrayList<TlVO> tlList) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<TlVO> selectStudClass(String tl_stud) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

}
