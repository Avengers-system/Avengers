package com.avengers.professor.classManage.daoImpl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.avengers.db.dto.AcVO;
import com.avengers.db.dto.AsgnVO;
import com.avengers.db.dto.AtdcVO;
import com.avengers.db.dto.BoardVO;
import com.avengers.db.dto.EqVO;
import com.avengers.db.dto.ExamVO;
import com.avengers.db.dto.LaVO;
import com.avengers.db.dto.LctVO;
import com.avengers.db.dto.SaVO;
import com.avengers.db.dto.SubVO;
import com.avengers.db.dto.TeVO;
import com.avengers.db.dto.TlVO;
import com.avengers.professor.classManage.dao.ProfessorClassManageDao;
@Repository
public class ProfessorClassManageDaoImpl implements ProfessorClassManageDao {
	@Autowired
	protected SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) throws SQLException {
		this.sqlSession = sqlSession;
	}

	//배현상--------------------------------------------------

	@Override
	public int updateLct(LctVO lctVO) throws SQLException {
		int result = sqlSession.update("lct.updateLctInfo", lctVO);
		return result;
	}
	
	@Override
	public ArrayList<Map<String, String>> selectPrfsLecture(String prfs_num)
			throws SQLException {
		ArrayList<Map<String, String>> prfsLctList = (ArrayList<Map<String, String>>) sqlSession.selectList("lct.selectPrfsLecture", prfs_num);
		return prfsLctList;
	}

	@Override
	public Map<String, String> selectDetailLct(String lct_num)
			throws SQLException {
		Map<String, String> lctInfo = (Map<String, String>) sqlSession.selectOne("lct.selectDetailLecture", lct_num);
		return lctInfo;
	}

	@Override
	public ArrayList<Map<String, String>> selectPrfsExamList(
			Map<String, String> key) throws SQLException {
		ArrayList<Map<String, String>> prfsExamList = (ArrayList<Map<String, String>>) sqlSession.selectList("exam.selectPrfsExamList", key);
		return prfsExamList;
	}

	@Override
	public LctVO selectLctYearQtr(String lct_num) throws SQLException {
		LctVO lctVO = (LctVO) sqlSession.selectOne("lct.selectLctYearQtr", lct_num);
		return lctVO;
	}

	@Override
	public int insertExam(ExamVO examVO) throws SQLException {
		int result = sqlSession.insert("exam.insertExam", examVO);
		return result;
	}

	@Override
	public ArrayList<String> selectExamPk(String exam_lct) throws SQLException {
		//기본키 역순정렬, 시험에 대해 학생을 등록했는지 안했는지에 대한 exam_check 를 검사(1,등록/2,미등록)
		ArrayList<String> examPkList = (ArrayList<String>) sqlSession.selectList("exam.selectExamPk", exam_lct);
		return examPkList;
	}

	@Override
	public int insertStudTe(Map<String, String> key) throws SQLException {
		int result = sqlSession.insert("te.insertStudTe", key);
		return result;
	}

	@Override
	public int updateExamCheck(String exam_num) throws SQLException {
		int result = sqlSession.update("exam.updateExamCheck", exam_num);
		return result;
	}
	
	@Override
	public ArrayList<EqVO> selectEqList(String exam_num) throws SQLException {
		ArrayList<EqVO> eqList = (ArrayList<EqVO>) sqlSession.selectList("eq.selectEqAllDataList", exam_num);
		return eqList;
	}

	@Override
	public int deleteEqInfo(String eq_num) throws SQLException {
		int result = sqlSession.delete("eq.deleteEqInfo", eq_num);
		return result;
	}

	@Override
	public ArrayList<String> selectEqPkList(String exam_num)
			throws SQLException {
		ArrayList<String> eqPkList = (ArrayList<String>) sqlSession.selectList("eq.selectEqPkList", exam_num);
		return eqPkList;
	}

	@Override
	public int allFunctionEq(ArrayList<EqVO> eqList) throws SQLException {
		int result = -1;
		for(int i=0; i<eqList.size(); i++){
			if(eqList.get(i).getEq_num().equals("-1")){
				result = sqlSession.insert("eq.insertEqInfo", eqList.get(i));
			} else if(eqList.get(i).getEq_num().substring(eqList.get(i).getEq_num().length()-1).equals("u")){
				System.out.println(eqList.get(i).getEq_num().substring(eqList.get(i).getEq_num().length()-1));
				eqList.get(i).setEq_num(eqList.get(i).getEq_num().substring(0, eqList.get(i).getEq_num().length()-1));
				result = sqlSession.update("eq.updateEqInfo", eqList.get(i));
			} else if(eqList.get(i).getEq_num().substring(eqList.get(i).getEq_num().length()-1).equals("d")){
				System.out.println(eqList.get(i).getEq_num().substring(eqList.get(i).getEq_num().length()-1));
				eqList.get(i).setEq_num(eqList.get(i).getEq_num().substring(0, eqList.get(i).getEq_num().length()-1));
				result = sqlSession.delete("eq.deleteEqInfo", eqList.get(i));
			}
		}
		return result;
	}

	@Override
	public int insertEq(ArrayList<EqVO> eqList) throws SQLException {
		int result = -1;
		for (int i = 0; i < eqList.size(); i++) {
			result = sqlSession.insert("eq.insertEqInfo", eqList.get(i));
		}
		return result;
	}

	//시험응시자 가져오기
	@Override
	public ArrayList<Map<String, String>> selectStudTeList(String exam_num)
			throws SQLException {
		ArrayList<Map<String, String>> studTeList = (ArrayList<Map<String, String>>) sqlSession.selectList("te.selectStudTeList", exam_num);
		return studTeList;
	}

	@Override
	public Map<String, String> selectStudColDeptInfo(String stud_num)
			throws SQLException {
		Map<String, String> studInfo = (Map<String, String>) sqlSession.selectOne("student.selectStudColDeptInfo", stud_num);
		return studInfo;
	}

	@Override
	public ArrayList<Map<String, String>> selectSaInfoList(
			Map<String, String> key) throws SQLException {
		ArrayList<Map<String, String>> saInfoList = (ArrayList<Map<String, String>>) sqlSession.selectList("sa.selectSaInfoList", key);
		return saInfoList;
	}

	@Override
	public int updateSa(ArrayList<Map<String, String>> saList)
			throws SQLException {
		int result = 0;
		for(int i=0; i<saList.size(); i++){
			result += sqlSession.update("sa.updateSa", saList.get(i));
		}
		return result;
	}

	@Override
	public int selectScoreSum(String te_num)
			throws SQLException {
		int score = (Integer) sqlSession.selectOne("sa.selectScoreSum", te_num);
		return score;
	}

	@Override
	public int updateExamPoint(String te_num) throws SQLException {
		int result = sqlSession.update("te.updateExamPoint", te_num);
		return result;
	}

	@Override
	public ArrayList<Map<String, String>> selectLctAsgnInfo(String lct_num) throws SQLException{
		ArrayList<Map<String, String>> lctAsgnInfo = (ArrayList<Map<String, String>>) sqlSession.selectList("asgn.selectLctAsgnInfo", lct_num);
		return lctAsgnInfo;
	}

	@Override
	public int insertAsgn(AsgnVO asgnVO) throws SQLException {
		int result = sqlSession.insert("asgn.insertAsgn", asgnVO);
		return result;
	}

	@Override
	public String selectAsgnPk(String lct_num) throws SQLException {
		String asgnPk = (String) sqlSession.selectOne("asgn.selectAsgnPk", lct_num);
		return asgnPk;
	}

	@Override
	public int insertStudSub(Map<String, String> key) throws SQLException {
		int result = sqlSession.insert("submission.insertStudSub", key);
		return result;
	}

	@Override
	public int updateAsgnCheck(String asgn_num) throws SQLException {
		int result = sqlSession.update("asgn.updateAsgnCheck",asgn_num);
		return result;
	}

	@Override
	public Map<String, String> selectAsgnInfo(String asgn_num)
			throws SQLException {
		Map<String, String> asgnInfo = (Map<String, String>) sqlSession.selectOne("asgn.selectAsgnDetailInfo", asgn_num);
		return asgnInfo;
	}

	@Override
	public ArrayList<Map<String, String>> selectAsgnOfStudList(String asgn_num)
			throws SQLException {
		ArrayList<Map<String, String>> asgnOfStudList = (ArrayList<Map<String, String>>) sqlSession.selectList("asgn.selectAsgnOfStudList", asgn_num);
		return asgnOfStudList;
	}

	@Override
	public Map<String, String> selectSubDetail(String sub_num)
			throws SQLException {
		Map<String, String> subDetail = (Map<String, String>) sqlSession.selectOne("submission.selectSubDetail", sub_num);
		return subDetail;
	}

	@Override
	public int updateSubSjtPoint(Map<String, String> key) throws SQLException {
		int result = sqlSession.update("submission.updateSubSjtPoint", key);
		return result;
	}
	

}
