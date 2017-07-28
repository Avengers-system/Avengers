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
import com.avengers.db.dto.BoardVO;
import com.avengers.db.dto.LoaVO;
import com.avengers.db.dto.PrfsVO;
import com.avengers.db.dto.RtsVO;
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
		HashMap map = new HashMap();
		map.put("stud_nm", studVO.getStud_nm());
		map.put("stud_eng_nm", studVO.getStud_eng_nm());
		map.put("stud_email", studVO.getStud_email());
		map.put("stud_pw", studVO.getStud_pw());	
		map.put("stud_bir", studVO.getStud_bir());	
		map.put("stud_grd", studVO.getStud_grd());
		map.put("stud_regno", studVO.getStud_regno());	
		map.put("stud_gen", studVO.getStud_gen());	
		map.put("stud_qtr", studVO.getStud_qtr());	
		map.put("stud_schreg_code", studVO.getStud_schreg_code());	
		map.put("stud_act_num", studVO.getStud_act_num());
		map.put("stud_bank", studVO.getStud_bank());
		map.put("stud_ah", studVO.getStud_ah());	
		map.put("stud_addr", studVO.getStud_addr());
		map.put("stud_zip", studVO.getStud_zip());
		map.put("stud_tel", studVO.getStud_tel());
		map.put("stud_hp", studVO.getStud_hp());	
		map.put("stud_dept", studVO.getStud_dept());
		map.put("stud_guad_nm", studVO.getStud_guad_nm());
		map.put("stud_guad_rel", studVO.getStud_guad_rel());
		map.put("stud_guad_hp", studVO.getStud_hp());
		map.put("stud_num", studVO.getStud_num());
		map.put("stud_max_crd", studVO.getStud_max_crd());
		
		if(!studVO.getStud_pic().isEmpty()){
			map.put("stud_pic", studVO.getStud_pic());	
		}
			
		int result = sqlSession.update("admin.updateStudent", map); 
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
	 
	//페이징 
	@Override
	public int getEmpListCount(StudVO studVO) throws SQLException {
		int result = (int) sqlSession.selectOne("admin.getStudEmpListCount",studVO);
		System.out.println("daoimpl getEmpListCount result : "+result);
		return result;
	}
	@Override
	public ArrayList<StudVO> getEmpList(StudVO studVO) throws SQLException {
		ArrayList<StudVO> studList = (ArrayList<StudVO>) sqlSession.selectList("admin.getStudEmpList",studVO);
		return studList;
	}
	/**
	 *  2017.07.27일자 추가 -배진 
	 */
	@Override
	public List<HashMap<String, String>> selectLoaList(LoaVO loaVO)
			throws SQLException {
		List<HashMap<String, String>> selectLoaList = (List<HashMap<String, String>>) sqlSession.selectList("loa.selectLoaList",loaVO);
		return selectLoaList;
	}
	/**
	 *  2017.07.27일자 추가 -배진 
	 */
	@Override
	public List<HashMap<String, String>> selectRtsList(RtsVO rtsVO)
			throws SQLException {
		List<HashMap<String, String>> selectRtsList = (List<HashMap<String, String>>) sqlSession.selectList("rts.selectRtsList",rtsVO);
		return selectRtsList;
	}
	/**
	 *  2017.07.27일자 추가 -배진 
	 */
	@Override
	public int updateLoaList(LoaVO loaVO)
			throws SQLException {
		int updateLoaList = (int) sqlSession.update("loa.updateLoa",loaVO);
		return updateLoaList;
	}
	/**
	 *  2017.07.27일자 추가 -배진 
	 */
	@Override
	public int updateRtsList(RtsVO rtsVO)
			throws SQLException {
		int updateRtsList = (int) sqlSession.update("rts.updateRts",rtsVO);
		return updateRtsList;
	}

}
