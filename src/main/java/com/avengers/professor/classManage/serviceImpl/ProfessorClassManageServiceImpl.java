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

	@Override
	public ArrayList<LctVO> selectLctList(String key, int firstRow, int endRow)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public LctVO selectLct(String lct_num) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertLct(LctVO lctVO) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateLct(LctVO lctVO) throws SQLException {
		int result = proClassDAO.updateLct(lctVO);
		return result;
	}

	@Override
	public ArrayList<ExamVO> selectExamList(String key, int firstRow, int endRow)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ExamVO selectExam(String exam_num) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateExam(ExamVO examVO, String exam_num) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteExam(String exam_num) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<TeVO> selectTeList(String key, String exam_lct,
			int firstRow, int endRow) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	

	@Override
	public ArrayList<SaVO> selectSaList(String te_num) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertTe(TeVO teVO) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateTe(TeVO teVO, String te_num) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<AsgnVO> selectAsgnList(String key, int firstRow, int endRow)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public AsgnVO selectAsgn(String asgn_num) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertAsgn(AsgnVO asgnVO) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateAsgn(AsgnVO asgnVO, String asgn_num) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteAsgn(String asgn_num) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<SubVO> selectSubList(String key, int firstRow, int endRow)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public SubVO selectSub(String sub_num) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateSub(SubVO subVO, String sub_num) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<TlVO> selectTlList(String key, int firstRow, int endRow)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public TlVO selectTl(String tl_num) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateTl(TlVO tlVO, String tl_num) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<AtdcVO> selectAtdcList(Date atdc_date, String lct_num)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateAtdc(AtdcVO atdcVO, Date atdc_date, String atdc_tl)
			throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<AcVO> selectAcList(String ac_atdc) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public AcVO selectAc(String ac_num) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<BoardVO> selectBoardList(String key, int firstRow,
			int endRow) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BoardVO selectBoard(String board_num) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertBoard(BoardVO boardVO) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateBoard(BoardVO boardVO, String board_num)
			throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<LaVO> selectLaList(int firstRow, int endRow)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public LaVO selectLa(String la_num) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	//배현상------------------------------------------------------------------
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

}
