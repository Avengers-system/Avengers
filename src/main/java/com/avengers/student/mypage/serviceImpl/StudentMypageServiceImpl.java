package com.avengers.student.mypage.serviceImpl;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.avengers.db.dto.DeptVO;
import com.avengers.db.dto.PerschdVO;
import com.avengers.db.dto.StudVO;
import com.avengers.student.mypage.dao.StudentMyPageDao;
import com.avengers.student.mypage.service.StudentMypageService;

/**
 * 학생 mypage
 * StudentMypageServiceImpl 
 * @author 조영훈
 * 최초작성 2017.07.10
 */
@Service
public class StudentMypageServiceImpl implements StudentMypageService{

	@Autowired
	private StudentMyPageDao stuMypageDAO;
	
	public void setStuMypageDAO(StudentMyPageDao stuMypageDAO) {
		this.stuMypageDAO = stuMypageDAO;
	}

	@Override
	public int updateMyInfo(StudVO stud, DeptVO dept) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public StudVO selectMyInfo(String stud_num) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertPerschd(PerschdVO perschd) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updatePerschd(PerschdVO perschd) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deletePersched(PerschdVO persched) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

}
