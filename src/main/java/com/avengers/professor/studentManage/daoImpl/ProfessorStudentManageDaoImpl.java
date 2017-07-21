package com.avengers.professor.studentManage.daoImpl;

import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.avengers.db.dto.CnsVO;
import com.avengers.db.dto.PrfsVO;
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
	public void updateCns(CnsVO cnsVO) throws SQLException {
		
		sqlSession.update("cns.cnsUpdate",cnsVO);
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

	@Override
	public void counselDateInsert(String cns_date, String cns_prfs,
			 String cns_kind) throws SQLException {
		DateFormat sdFormat = new SimpleDateFormat("yyyy/MM/dd");
		Date tempDate = null;
		try {
			tempDate = sdFormat.parse(cns_date);
		} catch (ParseException e) {
			e.printStackTrace();
		}

		CnsVO vo = new CnsVO();
		vo.setCns_date(tempDate);
		vo.setCns_prfs(cns_prfs);
		vo.setCns_kind(cns_kind);
		sqlSession.insert("cns.professorCounselInsert",vo);
	}

	@Override
	public CnsVO cnsDetail(String cns_num) throws SQLException {

		CnsVO vo = (CnsVO)sqlSession.selectOne("cns.cnsDetail",cns_num);
		return vo;
	}

	@Override
	public List<StudVO> getDepartmentStudentList(PrfsVO prfsVO) throws SQLException {
		
		return sqlSession.selectList("student.getDepartmentStudentList",prfsVO);
	}

	@Override
	public int getDepartmentStudentListCount(PrfsVO prfsVO) throws SQLException {
		return (Integer)sqlSession.selectOne("student.getDepartmentStudentListCount",prfsVO);
	}



	
}
