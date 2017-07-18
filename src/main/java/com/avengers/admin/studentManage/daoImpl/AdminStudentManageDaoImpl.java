package com.avengers.admin.studentManage.daoImpl;

import java.sql.SQLException;
import java.util.ArrayList;

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
		return studVO;
	}

	@Override
	public int insertStud(StudVO studVO) throws SQLException {
		int result = sqlSession.insert("admin.insertStudent",studVO);
		return result;
	}

	@Override
	public int updateStud(StudVO studVO, String stud_num) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
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
		System.out.println(stud_num);
		return stud_num;
	}
	@Override
	public int insertSecurity(StudVO studVO) {
		int result = sqlSession.insert("admin.insertStudSecurity",studVO);
		System.out.println("dao!!!"+studVO.getStud_num()+","+studVO.getStud_pw());
		return result;
	}
 

}
