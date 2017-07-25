package com.avengers.admin.studentManage.daoImpl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.avengers.admin.studentManage.dao.AdminStudentManageDao;
import com.avengers.db.dto.StudVO;
@Repository
public class AdminStudentManageDaoImpl implements AdminStudentManageDao {
	@Autowired
	protected SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) throws SQLException {
		this.sqlSession = sqlSession;
	}
	@Override
	public ArrayList<StudVO> selectStudList(String key,int firstRow, int lastRow)
			throws SQLException {
		return null;
	}

	@Override
	public StudVO selectStud(String stud_num) throws SQLException {
		StudVO studVO = null;
		studVO = (StudVO)sqlSession.selectOne("student.selectStud",stud_num);
		System.out.println();
		return studVO;
	}

	@Override
	public int insertStud(StudVO studVO) throws SQLException {
		int result = sqlSession.insert("admin.insertStudent",studVO);
		System.out.println("학생등록성공????"+result);
		return result;
	}

	@Override
	public int updateStud(StudVO studVO) throws SQLException {
		int result = sqlSession.update("admin.updateStudent", studVO); 
		System.out.println("?");
		return result;
	}

	@Override
	public int deleteStud(String stud_num) throws SQLException {
		int result = sqlSession.delete("admin.deleteStudent",stud_num);
		System.out.println("dao : "+ result + ", stud_num : "+stud_num);
		return result;
	}
	
	@Override
	public ArrayList<StudVO> selectStudList() throws SQLException {
		ArrayList<StudVO> studList = new ArrayList<StudVO>();
		studList = (ArrayList<StudVO>)sqlSession.selectList("student.selectAllStud");
		return studList;
	}
	
	@Override
	public String selectStudNum() throws SQLException {
		String stud_num = (String) sqlSession.selectOne("admin.studNumCurr");
		System.out.println("빨리나와"+stud_num);
		return stud_num;
	}
	
	@Override
	public int insertSecurity(StudVO studVO) {
		int result = sqlSession.insert("admin.insertStudSecurity",studVO);
		System.out.println("dao studVO insertSecurity!!!"+studVO.getStud_num()+","+studVO.getStud_pw());
		return result;
	}
	
	@Override
	public ArrayList<StudVO> selectStudbyKeyword(String keyword) {
		ArrayList<StudVO> studentList = new ArrayList<StudVO>();
		studentList = (ArrayList<StudVO>) sqlSession.selectList("admin.searchStudent",keyword);
		System.out.println("dao studVO 키워드검색" + keyword);
		return studentList;
	}
	 
	@Override
	public List<StudVO> getStudList(StudVO studVO) {
		// TODO Auto-generated method stub
		return null;
	}

	
	// 총 글수
	@Override
	public int getTotalCount() throws SQLException {
		int result = (Integer) sqlSession.selectOne("admin.selectCountStudent");
		return result;
	}
	@Override
	public Object selectPagingList(String queryId, Object params) {
		// TODO Auto-generated method stub
		return null;
	}

}
