package com.avengers.admin.professorManage.daoImpl;

import java.sql.SQLException;
import java.util.ArrayList;

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
	public int updatePrfs(PrfsVO prfsVO, String prfs_num) throws SQLException {
		
		return 0;
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

}
