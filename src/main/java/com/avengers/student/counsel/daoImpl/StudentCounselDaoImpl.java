package com.avengers.student.counsel.daoImpl;

import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.avengers.db.dto.CnsVO;
import com.avengers.student.counsel.dao.StudentCounselDao;


/**
 * 학생 상담관리
 * StudentCounselDaoImpl 
 * @author 조영훈
 *2017.07.11
 */
@Repository
public class StudentCounselDaoImpl implements StudentCounselDao {

	@Autowired
	protected SqlSession sqlSession;
	

	@Override
	public int insertCounsel(CnsVO cns, int firstRow, int endRow)
			throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<CnsVO> selectCounselList(String stud_num) throws SQLException {
		ArrayList<CnsVO> counselList = (ArrayList<CnsVO>)sqlSession.selectList("cns.selectStudentCnsList",stud_num);
			
		return counselList;
	}

	@Override
	public ArrayList<CnsVO> selectCounselList(String searchKey,
			String cns_stud, int firstRow, int endRow) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteCounsel(String key, String cns_stud, int firstRow,
			int endRow) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

}
