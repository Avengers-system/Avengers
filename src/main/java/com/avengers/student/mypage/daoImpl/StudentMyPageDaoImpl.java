package com.avengers.student.mypage.daoImpl;

import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.avengers.db.dto.DeptVO;
import com.avengers.db.dto.PerschdVO;
import com.avengers.db.dto.StudVO;
import com.avengers.student.mypage.dao.StudentMyPageDao;

/**
 * 학생 mypage
 * @author 조영훈
 * 최초작성 2017.07.10
 */
@Repository
public class StudentMyPageDaoImpl implements StudentMyPageDao{
	
	@Autowired
	protected SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
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

	@Override // 일정등록
	public int insertPerschd(PerschdVO perschdVO) throws SQLException {
		int result = sqlSession.insert("perschd.insertSchd",perschdVO);
		return result;
	}

	@Override // 일정수정
	public int updatePerschd(PerschdVO perschdVO) throws SQLException {
		int success = -1;
		success = sqlSession.update("perschd.updateSchd", perschdVO);
		return success;
	}

	@Override //일정보여주기
	public ArrayList<PerschdVO> selectPerschdList(String perschd_writer){
		ArrayList<PerschdVO> perschdList = new ArrayList<PerschdVO>();
		perschdList =  (ArrayList<PerschdVO>) sqlSession.selectList("perschd.selectPerschdList", perschd_writer);
		System.out.println("size : "+ perschdList.size());
		return perschdList;
	}

	@Override
	public PerschdVO selectPerschd(int perschd_num) throws SQLException {
		PerschdVO perschdVO = null;
		perschdVO = (PerschdVO) sqlSession.selectOne("perschd.getPerschd", perschd_num);
		return perschdVO;
	}

	@Override // 일정삭제
	public int deletePerschd(int perschd_num) throws SQLException {
		int success = -1;
		success = sqlSession.delete("perschd.deleteSchd", perschd_num);
		return success;
	}

	@Override
	public PerschdVO selectPerschd_title(String perschd_title) {
		PerschdVO perschdVO = (PerschdVO) sqlSession.selectOne("perschd.selectSchdTitle",perschd_title);
		return perschdVO;
	}

	
}
