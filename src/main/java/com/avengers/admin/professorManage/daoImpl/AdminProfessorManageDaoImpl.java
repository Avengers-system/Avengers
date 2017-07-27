package com.avengers.admin.professorManage.daoImpl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.avengers.admin.professorManage.dao.AdminProfessorManageDao;
import com.avengers.db.dto.DeptVO;
import com.avengers.db.dto.PrfsVO;
@Repository
public class AdminProfessorManageDaoImpl implements AdminProfessorManageDao {
	@Autowired
	protected SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) throws SQLException {
		this.sqlSession = sqlSession;
	}
	@Override
	public ArrayList<PrfsVO> selectPrfsList(String key,int firstRow, int lastRow)
			throws SQLException {
		sqlSession.selectList("");//게시판쿼리쓰기~~~
		return null;
	}

	@Override
	public PrfsVO selectPrfs(String prfs_num) throws SQLException {
		PrfsVO prfsVO = new PrfsVO();
		prfsVO = (PrfsVO)sqlSession.selectOne("prfs.selectPrfs",prfs_num);
		return prfsVO;  
	}

	@Override
	public int insertPrfs(PrfsVO prfsVO) throws SQLException {
		int result = sqlSession.insert("admin.insertProfessor",prfsVO);
		return result;
	}

	@Override
	public int updatePrfs(PrfsVO prfsVO) throws SQLException {
		HashMap map = new HashMap();
		map.put("prfs_nm", prfsVO.getPrfs_nm());
		map.put("prfs_eng_nm", prfsVO.getPrfs_eng_nm());
		map.put("prfs_dept", prfsVO.getPrfs_dept());
		map.put("prfs_bir", prfsVO.getPrfs_bir());
		map.put("prfs_regno", prfsVO.getPrfs_regno());
		map.put("prfs_gen", prfsVO.getPrfs_gen());
		map.put("prfs_hp", prfsVO.getPrfs_hp());
		map.put("prfs_tel", prfsVO.getPrfs_tel());
		map.put("prfs_act_num", prfsVO.getPrfs_act_num());
		map.put("prfs_bank", prfsVO.getPrfs_bank());
		map.put("prfs_ah", prfsVO.getPrfs_ah());
		map.put("prfs_zip", prfsVO.getPrfs_zip());
		map.put("prfs_addr", prfsVO.getPrfs_addr());
		map.put("prfs_email", prfsVO.getPrfs_email());
		map.put("prfs_pw", prfsVO.getPrfs_pw());
		map.put("prfs_num", prfsVO.getPrfs_num());
		
		if(!prfsVO.getPrfs_pic().isEmpty()){
			map.put("prfs_pic", prfsVO.getPrfs_pic());	
		}
		
		int result = sqlSession.update("prfs.updatePrfs", map);
		System.out.println(prfsVO.getPrfs_pic());
		return result;
	}

	@Override
	public int deletePrfs(String prfs_num) throws SQLException {
		int result = sqlSession.delete("admin.deleteProfessor",prfs_num);
		System.out.println("dao : "+ result + ", prfs_num : "+prfs_num);
		return result;
	}
	@Override
	public int insertSecurity(PrfsVO prfsVO) {
		int result = sqlSession.insert("admin.insertSecurity",prfsVO);
		System.out.println("dao!!!"+prfsVO.getPrfs_num()+" ,"+prfsVO.getPrfs_pw());
//		int result = 1;
		return result;
	}
	@Override
	public int selectCountPrfs() {
		int result = (Integer) sqlSession.selectOne("prfs.selectCount");
		return result;
	}
	
	
	@Override
	public ArrayList<PrfsVO> selectPrfsList() throws SQLException {
		ArrayList<PrfsVO> prfsList = (ArrayList<PrfsVO>) sqlSession.selectList("prfs.selectAllPrfs");
		return prfsList;
	}
	@Override
	public String selectPrfsNum() throws SQLException {
		String prfs_num = (String) sqlSession.selectOne("admin.prfsNumCurr");
		System.out.println(prfs_num);
		return prfs_num;
	}
	@Override
	public ArrayList<DeptVO> selectDeptList() throws SQLException {
		ArrayList<DeptVO> selectDepList = new ArrayList<DeptVO>(); 
		selectDepList = (ArrayList<DeptVO>) sqlSession.selectList("admin.selectDeptList");
		return selectDepList;
	}
	
	@Override
	public int getEmpListCount(PrfsVO prfsVO) throws SQLException {
		int result = (int) sqlSession.selectOne("admin.getPrfsEmpListCount",prfsVO);
		System.out.println("daoimpl getEmpListCount result : "+result);
		return result;
	}
	
	@Override
	public ArrayList<PrfsVO> getEmpList(PrfsVO prfsVO) throws SQLException {
		ArrayList<PrfsVO> prfsList = (ArrayList<PrfsVO>) sqlSession.selectList("admin.getPrfsEmpList",prfsVO);
		return prfsList;
	}

}
