package com.avengers.professor.studentManage.daoImpl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.avengers.db.dto.CnsVO;
import com.avengers.db.dto.StudVO;
import com.avengers.professor.studentManage.dao.ProfessorStudentManageDao;

@Repository
public class ProfessorStudentManageDaoImpl implements ProfessorStudentManageDao {
	@Autowired
	protected SqlSession sqlSession;


	@Override
	public ArrayList<CnsVO> selectCnsList(String cns_prfs)
			throws SQLException {
		ArrayList<CnsVO> cnsList = (ArrayList<CnsVO>)sqlSession.selectList("cns.selectCnsList",cns_prfs);
		return cnsList;
	}

	@Override
	public CnsVO selectCns(String cns_prfs, String cns_stud)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public CnsVO updateCns(CnsVO cnsVO) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<StudVO> selectStudList(String prfs_num)
			throws SQLException {
		ArrayList<StudVO> studentList = (ArrayList<StudVO>)sqlSession.selectList("student.selectDepartmentStudentList",prfs_num);
		
		return studentList;
	}

	@Override
	public StudVO selectStud(String stud_num)
			throws SQLException {
		StudVO studDetail = (StudVO)sqlSession.selectOne("student.getStudentInfo",stud_num);
		return studDetail;
	}


	
}
