package com.avengers.student.counsel.serviceImpl;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.avengers.db.dto.CnsVO;
import com.avengers.student.counsel.dao.StudentCounselDao;
import com.avengers.student.counsel.service.StudentCounselService;



/**
 * 학생 상담관리
 * StudentCounselServiceImpl
 * @author 조영훈
 *2017.07.11
 */
@Service
public class StudentCounselServiceImpl implements StudentCounselService {
	@Autowired
	private StudentCounselDao stuCounselDAO;
	
	public void setStuCounselDAO(StudentCounselDao stuCounselDAO) {
		this.stuCounselDAO = stuCounselDAO;
	}

	@Override
	public int insertCounsel(CnsVO cns, int firstRow, int endRow)
			throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<CnsVO> selectCounselList(int firstRow, int endRow)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
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
