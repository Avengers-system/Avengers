package com.avengers.professor.classManage.serviceImpl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
import com.avengers.professor.classManage.service.ProfessorClassManageService;
@Service
public class ProfessorClassManageServiceImpl implements ProfessorClassManageService{

	@Autowired
	private ProfessorClassManageDao proClassDAO;
	
	public void setProClassDAO(ProfessorClassManageDao proClassDAO) {
		this.proClassDAO = proClassDAO;
	}
	//배현상------------------------------------------------------------------
	
	@Override
	public int updateLct(LctVO lctVO) throws SQLException {
		int result = proClassDAO.updateLct(lctVO);
		return result;
	}
	
	@Override
	public ArrayList<Map<String, String>> selectPrfsLecture(String prfs_num)
			throws SQLException {
		ArrayList<Map<String, String>> prfsLctList = proClassDAO.selectPrfsLecture(prfs_num);
		return prfsLctList;
	}

	@Override
	public Map<String, String> selectDetailLct(String lct_num)
			throws SQLException {
		Map<String,String> lctInfo = proClassDAO.selectDetailLct(lct_num);
		return lctInfo;
	}

	@Override
	public ArrayList<Map<String, String>> selectPrfsExamList(
			Map<String, String> key) throws SQLException {
		ArrayList<Map<String, String>> prfsExamList = proClassDAO.selectPrfsExamList(key);
		return prfsExamList;
	}

	@Override
	public LctVO selectLctYearQtr(String lct_num) throws SQLException {
		LctVO lctVO = proClassDAO.selectLctYearQtr(lct_num);
		return lctVO;
	}

	@Override
	public int insertExam(ExamVO examVO) throws SQLException {
		int result = proClassDAO.insertExam(examVO);
		return result;
	}

	@Override
	public ArrayList<String> selectExamPk(String exam_lct) throws SQLException {
		ArrayList<String> examPkList = proClassDAO.selectExamPk(exam_lct);
		return examPkList;
	}

	@Override
	public int insertStudTe(Map<String, String> key) throws SQLException {
		int result = proClassDAO.insertStudTe(key);
		return result;
	}

	@Override
	public int updateExamCheck(String exam_num) throws SQLException {
		int result = proClassDAO.updateExamCheck(exam_num);
		return result;
	}

	@Override
	public ArrayList<EqVO> selectEqList(String exam_num) throws SQLException {
		ArrayList<EqVO> eqList = proClassDAO.selectEqList(exam_num);
		return eqList;
	}

	@Override
	public int deleteEqInfo(String eq_num) throws SQLException {
		int result = proClassDAO.deleteEqInfo(eq_num);
		return result;
	}

	@Override
	public ArrayList<String> selectEqPkList(String exam_num)
			throws SQLException {
		ArrayList<String> eqPkList = proClassDAO.selectEqPkList(exam_num);
		return eqPkList;
	}

	@Override
	public int allFunctionEq(ArrayList<EqVO> eqList) throws SQLException {
		int result = proClassDAO.allFunctionEq(eqList);
		return result;
	}

	@Override
	public int insertEq(ArrayList<EqVO> eqList) throws SQLException {
		int result = proClassDAO.insertEq(eqList);
		return result;
	}

	@Override
	public ArrayList<Map<String, String>> selectStudTeList(String exam_num)
			throws SQLException {
		ArrayList<Map<String, String>> studTeList = proClassDAO.selectStudTeList(exam_num);
		return studTeList;
	}

	@Override
	public Map<String, String> selectStudColDeptInfo(String stud_num)
			throws SQLException {
		Map<String, String> studInfo = proClassDAO.selectStudColDeptInfo(stud_num);
		return studInfo;
	}

	@Override
	public ArrayList<Map<String, String>> selectSaInfoList(
			Map<String, String> key) throws SQLException {
		ArrayList<Map<String, String>> saInfoList = proClassDAO.selectSaInfoList(key);
		return saInfoList;
	}

	@Override
	public int updateSa(ArrayList<Map<String, String>> saList)
			throws SQLException {
		int result = proClassDAO.updateSa(saList);
		return result;
	}

	@Override
	public int selectScoreSum(String te_num)
			throws SQLException {
		int score = proClassDAO.selectScoreSum(te_num);
		return score;
	}

	@Override
	public int updateExamPoint(String te_num) throws SQLException {
		int result = proClassDAO.updateExamPoint(te_num);
		return result;
	}

	@Override
	public ArrayList<Map<String, String>> selectLctAsgnInfo(String lct_num) throws SQLException{
		ArrayList<Map<String, String>> lctAsgnInfo = proClassDAO.selectLctAsgnInfo(lct_num);
		return lctAsgnInfo;
	}

	@Override
	public int insertAsgn(AsgnVO asgnVO) throws SQLException {
		int result = proClassDAO.insertAsgn(asgnVO);
		return result;
	}

	@Override
	public String selectAsgnPk(String lct_num) throws SQLException {
		String asgnPk = proClassDAO.selectAsgnPk(lct_num);
		return asgnPk;
	}
	
	@Override
	public int insertStudSub(Map<String, String> key) throws SQLException{
		int result = proClassDAO.insertStudSub(key);
		return result;
	}

	@Override
	public int updateAsgnCheck(String asgn_num) throws SQLException {
		int result = proClassDAO.updateAsgnCheck(asgn_num);
		return result;
	}

	@Override
	public Map<String, String> selectAsgnInfo(String asgn_num)
			throws SQLException {
		Map<String, String> asgnInfo = proClassDAO.selectAsgnInfo(asgn_num);
		return asgnInfo;
	}

	@Override
	public ArrayList<Map<String, String>> selectAsgnOfStudList(String asgn_num)
			throws SQLException {
		ArrayList<Map<String, String>> asgnOfStudList = proClassDAO.selectAsgnOfStudList(asgn_num);
		return asgnOfStudList;
	}

	@Override
	public Map<String, String> selectSubDetail(String sub_num)
			throws SQLException {
		Map<String, String> subDetail = proClassDAO.selectSubDetail(sub_num);
		return subDetail;
	}

	@Override
	public int updateSubSjtPoint(Map<String, String> key) throws SQLException {
		int result = proClassDAO.updateSubSjtPoint(key);
		return result;
	}

	@Override
	public int updateAsgn(AsgnVO asgnVO) throws SQLException {
		int result = proClassDAO.updateAsgn(asgnVO);
		return result;
	}

	@Override
	public Map<String, String> selectLctNmInfo(String lct_num)
			throws SQLException {
		Map<String, String> lctNmInfo = proClassDAO.selectLctNmInfo(lct_num);
		return lctNmInfo;
	}
}
