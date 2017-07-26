package com.avengers.student.mypage.serviceImpl;

import java.sql.SQLException;
import java.util.ArrayList;

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
	public int insertPerschd(PerschdVO perschdVO) throws SQLException {
		int result = stuMypageDAO.insertPerschd(perschdVO);
		return result;
	}

	@Override
	public int updatePerschd(PerschdVO perschdVO) throws SQLException {
		int success = -1; 
		success = stuMypageDAO.updatePerschd(perschdVO);
		return success;
	}

	@Override
	public ArrayList<PerschdVO> selectPerschdList(String perschd_writer)
			throws SQLException {
		ArrayList<PerschdVO> perschdList= stuMypageDAO.selectPerschdList(perschd_writer);
		System.out.println(perschd_writer+"야");
		return perschdList;
	}

	@Override
	public PerschdVO selectPerschd(int perschd_num) throws SQLException {
		PerschdVO pershcdVO = null;
		pershcdVO = stuMypageDAO.selectPerschd(perschd_num);
		return pershcdVO;
	}

	@Override
	public int deletePerschd(int perschd_num) throws SQLException {
		int success= -1;
		success = stuMypageDAO.deletePerschd(perschd_num);
		return success;
	}

	@Override
	public PerschdVO selectPerschd_title(String title) {
		return  stuMypageDAO.selectPerschd_title(title);
	}


	
	
	
}
