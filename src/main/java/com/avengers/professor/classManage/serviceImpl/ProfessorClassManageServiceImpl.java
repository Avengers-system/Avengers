package com.avengers.professor.classManage.serviceImpl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

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
import com.avengers.professor.classManage.service.ProfessorClassManageService;

public class ProfessorClassManageServiceImpl implements ProfessorClassManageService{

	@Override
	public ArrayList<LctVO> selectLctList() throws SQLException {
		return null;
	}

	@Override
	public LctVO selectLct(String lct_num) throws SQLException {
		return null;
	}

	@Override
	public int insertLct(LctVO lctVO) throws SQLException {
		return 0;
	}

	@Override
	public int updateLct(LctVO lctVO, String lct_num) throws SQLException {
		return 0;
	}

	@Override
	public ArrayList<ExamVO> selectExamList() throws SQLException {
		return null;
	}

	@Override
	public ExamVO selectExam(String exam_num) throws SQLException {
		return null;
	}

	@Override
	public int updateExam(ExamVO examVO, String exam_num) throws SQLException {
		return 0;
	}

	@Override
	public int deleteExam(String exam_num) throws SQLException {
		return 0;
	}

	@Override
	public ArrayList<TeVO> selectTeList(String exam_lct) throws SQLException {
		return null;
	}

	@Override
	public ArrayList<EqVO> selectEqList(String exam_num) throws SQLException {
		return null;
	}

	@Override
	public ArrayList<SaVO> selectSaList(String te_num) throws SQLException {
		return null;
	}

	@Override
	public int insertTe(TeVO teVO) throws SQLException {
		return 0;
	}

	@Override
	public int updateTe(TeVO teVO, String te_num) throws SQLException {
		return 0;
	}

	@Override
	public ArrayList<AsgnVO> selectAsgnList() throws SQLException {
		return null;
	}

	@Override
	public AsgnVO selectAsgn(String asgn_num) throws SQLException {
		return null;
	}

	@Override
	public int insertAsgn(AsgnVO asgnVO) throws SQLException {
		return 0;
	}

	@Override
	public int updateAsgn(AsgnVO asgnVO, String asgn_num) throws SQLException {
		return 0;
	}

	@Override
	public int deleteAsgn(String asgn_num) throws SQLException {
		return 0;
	}

	@Override
	public ArrayList<SubVO> selectSubList() throws SQLException {
		return null;
	}

	@Override
	public SubVO selectSub(String sub_num) throws SQLException {
		return null;
	}

	@Override
	public int updateSub(SubVO subVO, String sub_num) throws SQLException {
		return 0;
	}

	@Override
	public ArrayList<TlVO> selectTlList() throws SQLException {
		return null;
	}

	@Override
	public TlVO selectTl(String tl_num) throws SQLException {
		return null;
	}

	@Override
	public int updateTl(TlVO tlVO, String tl_num) throws SQLException {
		return 0;
	}

	@Override
	public ArrayList<AtdcVO> selectAtdcList(Date atdc_date, String lct_num)
			throws SQLException {
		return null;
	}

	@Override
	public int updateAtdc(AtdcVO atdcVO, Date atdc_date, String atdc_tl)
			throws SQLException {
		return 0;
	}

	@Override
	public ArrayList<AcVO> selectAcList(String ac_atdc) throws SQLException {
		return null;
	}

	@Override
	public AcVO selectAc(String ac_num) throws SQLException {
		return null;
	}

	@Override
	public ArrayList<BoardVO> selectBoardList() throws SQLException {
		return null;
	}

	@Override
	public BoardVO selectBoard(String board_num) throws SQLException {
		return null;
	}

	@Override
	public int insertBoard(BoardVO boardVO) throws SQLException {
		return 0;
	}

	@Override
	public int updateBoard(BoardVO boardVO, String board_num)
			throws SQLException {
		return 0;
	}

	@Override
	public ArrayList<LaVO> selectLaList() throws SQLException {
		return null;
	}

	@Override
	public LaVO selectLa(String la_num) throws SQLException {
		return null;
	}

}
