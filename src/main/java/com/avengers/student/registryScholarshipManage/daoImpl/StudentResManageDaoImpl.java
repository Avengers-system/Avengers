package com.avengers.student.registryScholarshipManage.daoImpl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.avengers.db.dto.LoaRtsVO;
import com.avengers.db.dto.RegVO;
import com.avengers.db.dto.ScrVO;
import com.avengers.db.dto.ScrapplVO;
import com.avengers.db.dto.resSchStudentVO;
import com.avengers.student.registryScholarshipManage.dao.StudentResManageDao;

@Repository
public class StudentResManageDaoImpl implements StudentResManageDao{
	@Autowired
	protected SqlSession sqlSession;
	

	@Override
	public ArrayList<ScrapplVO> selectScrapplList(String scrappl_stud,
			HashMap<String, String> map) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertScrappl(ScrapplVO scrapplVO) throws SQLException {
		int insertScrappl =(int) sqlSession.insert("resSchManage.insertScrAppl",scrapplVO);
		return insertScrappl;
	}

	@Override
	public List<HashMap<String,String>> selectRegList(RegVO regVO)throws SQLException {
		List<HashMap<String,String>> selectRegList=(List<HashMap<String,String>>)sqlSession.selectList("resSchManage.selectRegList",regVO); 
		return selectRegList;
	}

	@Override
	public RegVO selectReg(String reg_stud) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateReg(RegVO regVO) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<resSchStudentVO> selectresSchStudent(String stud_num,String lct_yr)
			throws SQLException {
		ArrayList<resSchStudentVO> resSchList = new ArrayList<resSchStudentVO>();
		resSchStudentVO resVO = new resSchStudentVO();
		resVO.setStud_num(stud_num);
		resVO.setLct_yr(lct_yr);
		resSchList =  (ArrayList<resSchStudentVO>) sqlSession.selectList("resSchManage.resSchSelect",resVO);
			
		return resSchList;
	}

	@Override
	public ArrayList<LoaRtsVO> selectLoaRts(String loa_stud)
			throws SQLException {
		ArrayList<LoaRtsVO> LoaRtsList = new ArrayList<LoaRtsVO>();
		LoaRtsList = (ArrayList<LoaRtsVO>) sqlSession.selectList("resSchManage.LoaRtsSelect",loa_stud);
		return LoaRtsList;
	}

	@Override
	public List<HashMap<String, String>> selectScrList(ScrapplVO scrApplVO)
			throws SQLException {
		List<HashMap<String,String>> selectScrList = (List<HashMap<String,String>>) sqlSession.selectList("resSchManage.scrSelect",scrApplVO); 
		return selectScrList;
	}

	@Override
	public List<HashMap<String, String>> selectScrApplList(
			ScrapplVO scrApplVO) throws SQLException {
		List<HashMap<String,String>> selectScrApplList = (List<HashMap<String,String>>) sqlSession.selectList("resSchManage.scrApplSelect",scrApplVO); 
		return selectScrApplList;
	}

	@Override
	public resSchStudentVO selectStudInfo(String stud_num) throws SQLException {
		resSchStudentVO resVO = new resSchStudentVO();
		resVO.setStud_num(stud_num);
		resSchStudentVO studInfo = new resSchStudentVO();
		studInfo = (resSchStudentVO) sqlSession.selectOne("resSchManage.studInfoSelect",resVO);
		return studInfo;
	}

	@Override
	public ArrayList<ScrVO> selectScrVO() throws SQLException {
		ArrayList<ScrVO> scrVO = (ArrayList<ScrVO>) sqlSession.selectList("resSchManage.scrList");
		return scrVO;
	}
	
	

}
