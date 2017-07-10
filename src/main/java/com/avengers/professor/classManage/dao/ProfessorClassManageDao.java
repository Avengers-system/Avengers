package com.avengers.professor.classManage.dao;

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

public interface ProfessorClassManageDao {
	//초기 강의검색,강의계획서
	public ArrayList<LctVO> selectLctList() throws SQLException; //강의 전체 리스트를 불러온다.
	public LctVO selectLct(String lct_num ) throws SQLException; //검색한 특정 강의를 불러온다.
	public int insertLct(LctVO lctVO) throws SQLException; //강의계획서에 보여줄 내용을 등록한다.
	public int updateLct(LctVO lctVO,String lct_num) throws SQLException; //강의계획서에 보여줄 내용을 수정한다.
	//시험관리-시험조회
	public ArrayList<ExamVO> selectExamList() throws SQLException; //해당과목의 시험전체 리스트를 불러온다.
	public ExamVO selectExam(String exam_num) throws SQLException; //선택한 특정 시험의 상세정보를 가져온다.
	public int updateExam(ExamVO examVO,String exam_num) throws SQLException; //시험문제를 수정할수있다.
	public int deleteExam(String exam_num) throws SQLException; //해당 시험을 삭제한다.
	//시험관리-응시자조회
	public ArrayList<TeVO> selectTeList(String exam_lct) throws SQLException; //현재 강의에 대한 시험 응시현황을 불러온다.먼저 exam테이블에 강의고유번호로 시험고유번호를 구한뒤 te에서 시험고유번호로 검색한다.
	public ArrayList<EqVO> selectEqList(String exam_num) throws SQLException; //교수가 클릭한 시험에대한 문제정보들을 불러온다.
	public ArrayList<SaVO> selectSaList(String te_num) throws SQLException; //교수가 응시확인 화면에서 클릭한 해당항목에 대한 학생의 답안들을 불러온다.
	public int insertTe(TeVO teVO) throws SQLException; //교수가 학생이 응시한 시험에대해 채점을 한다.
	public int updateTe(TeVO teVO,String te_num) throws SQLException; //시험의 채점에 대해서 수정할수있다.
	//과제관리-과제조회	
	public ArrayList<AsgnVO> selectAsgnList() throws SQLException; //해당과목의 과제전체 리스트를 불러온다.
	public AsgnVO selectAsgn(String asgn_num) throws SQLException; //선택한 특정 과제의 상세정보를 가져온다.
	public int insertAsgn(AsgnVO asgnVO) throws SQLException; //과제를 신규등록한다.
	public int updateAsgn(AsgnVO asgnVO,String asgn_num) throws SQLException; //과제를 수정할수있다.
	public int deleteAsgn(String asgn_num) throws SQLException; //해당 과제를 삭제한다.
	//과제관리-제출확인
	public ArrayList<SubVO> selectSubList() throws SQLException; //먼저 강의번호로 해당 강의의 과제들을 검색해야하며 그 과제 고유번호로 제출/미제출한 모든 sub테이블 정보를 불러와야한다.
	public SubVO selectSub(String sub_num) throws SQLException; //선택한 특정 과제의 상세정보를 가져온다.
	public int updateSub(SubVO subVO,String sub_num) throws SQLException; //과제에 점수를 채점/수정할수있다.
	//학점등록
	public ArrayList<TlVO> selectTlList() throws SQLException; //해당 강의의 전체 학생들을 보여준다.
	public TlVO selectTl(String tl_num) throws SQLException; //특정 학생의 해당강의 학점정보를 가져온다.
	public int updateTl(TlVO tlVO,String tl_num) throws SQLException; //특정 학생의 학점을 수정,등록할수있다.
	//출결관리-출결화면
	public ArrayList<AtdcVO> selectAtdcList(Date atdc_date,String lct_num) throws SQLException; //해당 강의의 해당 날짜의 수강한 학생들의 출결현황을 표시한다.
	public int updateAtdc(AtdcVO atdcVO,Date atdc_date,String atdc_tl) throws SQLException; //특정 학생의 출결을 수정가능하다.
	//출결관리-이의신청
	public ArrayList<AcVO> selectAcList(String ac_atdc) throws SQLException; //해당 강의의 이의신청 목록을 보여준다.
	public AcVO selectAc(String ac_num) throws SQLException; //특정 이의신청의 상세정보를 가져온다.
	//수업자료실//질문게시판
	public ArrayList<BoardVO> selectBoardList() throws SQLException; //게시판 전체 리스트를 불러온다.
	public BoardVO selectBoard(String board_num ) throws SQLException; //검색한 특정 글을 불러온다.
	public int insertBoard(BoardVO boardVO) throws SQLException; //게시판 내용을 등록한다.
	public int updateBoard(BoardVO boardVO,String board_num) throws SQLException; //게시판 내용을 수정한다.
	
	//강의평가보기
	public ArrayList<LaVO> selectLaList() throws SQLException; //수강평가 전체 리스트를 불러온다.
	public LaVO selectLa(String la_num ) throws SQLException; //특정 수강평가를 조회한다.
}
