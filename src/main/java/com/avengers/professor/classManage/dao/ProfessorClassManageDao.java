package com.avengers.professor.classManage.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Map;

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
	//배현상--------------------------------------------------------------------------
	//강의리스트
	public ArrayList<Map<String, String>> selectPrfsLecture(String prfs_num) throws SQLException;
	//강의계획서
	public Map<String, String> selectDetailLct(String lct_num) throws SQLException;
	//강의계획서 업데이트
	public int updateLct(LctVO lctVO) throws SQLException; //강의계획서에 보여줄 내용을 수정한다.
	//교수의 한 강의에 대한 시험리스트 출력
	public ArrayList<Map<String, String>> selectPrfsExamList(Map<String, String> key) throws SQLException;
	//강의의 년도와 학기 가져오기
	public LctVO selectLctYearQtr(String lct_num) throws SQLException;
	//시험등록
	public int insertExam(ExamVO examVO) throws SQLException;
	//등록한 시험에 대해 학생들을 자동으로 응시테이블에 insert하기 위해 방금 등록한 시험의 기본키를 가져오자
	public ArrayList<String> selectExamPk(String exam_lct) throws SQLException;
	//응시테이블에 학생을 등록하자
	public int insertStudTe(Map<String, String> key) throws SQLException;
	//응시테이블에 학생등록을 완료한 시험은 exam_check를 1로 업데이트해준다.
	public int updateExamCheck(String exam_num) throws SQLException;
	//시험문제보러가기를 눌렀을 때 화면에 뿌려줄 시험문제
	public ArrayList<EqVO> selectEqList(String exam_num) throws SQLException;
	//시험문제삭제
	public int deleteEqInfo(String eq_num) throws SQLException;
	//시험기본키를 가지고 시험문제기본키가져오기
	//왜가져오냐고?? 등록, 수정, 삭제할려고
	public ArrayList<String> selectEqPkList(String exam_num) throws SQLException;
	//모든걸 다할꺼야, 인서트, 딜리트, 업데이트, 왜냐고 내맘
	public int allFunctionEq(ArrayList<EqVO> eqList) throws SQLException;
	//자 만약에 EqPkList의 값이 널이거나 비어있으면 원래 등록된 시험문제가 존재하지 않는 거니까 인서트만 해주면 된다... 뿌아자
	public int insertEq(ArrayList<EqVO> eqList) throws SQLException;
	//응시자 가져오기
	public ArrayList<Map<String, String>> selectStudTeList(String exam_num) throws SQLException;
	//소속,학과,학생정보 가져오기
	public Map<String,String> selectStudColDeptInfo(String stud_num) throws SQLException;
	//학생답안가져오기
	public ArrayList<Map<String,String>> selectSaInfoList(Map<String, String> key) throws SQLException;
	//학생답안 채점결과 업데이트
	public int updateSa(ArrayList<Map<String, String>> saList) throws SQLException;
	//학생점수 가져오기
	public int selectScoreSum(String te_num) throws SQLException;
	//학생점수 TE테이블에 저장
	public int updateExamPoint(String te_num) throws SQLException;
	//교수의 한 과목에 해당하는 과제목록 가져오기
	public ArrayList<Map<String, String>> selectLctAsgnInfo(String lct_num) throws SQLException;
	//과제 등록하기
	public int insertAsgn(AsgnVO asgnVO) throws SQLException;
	//방금 등록한 과제의 기본키를 가져오자
	public String selectAsgnPk(String lct_num) throws SQLException;
	//이제 submission테이블에 학생들을 자동으로 입력시키자
	public int insertStudSub(Map<String, String> key) throws SQLException;
	//submission테이블에 학생등록이 완료된 과제는 asgn_check를 1로 업데이트
	public int updateAsgnCheck(String asgn_num) throws SQLException;
	//과제 상세페이지
	public Map<String, String> selectAsgnInfo(String asgn_num) throws SQLException;
	//과제에 대한 학생리스트 가져오기
	public ArrayList<Map<String, String>> selectAsgnOfStudList(String asgn_num) throws SQLException;
	//과제를 제출한 학생의 제출정보 가져오기
	public Map<String, String> selectSubDetail(String sub_num) throws SQLException;
	//과제점수 업데이트
	public int updateSubSjtPoint(Map<String, String> key) throws SQLException;
	//과제 업데이트
	public int updateAsgn(AsgnVO asgnVO) throws SQLException;
	//과목명과 분반가져오기
	public Map<String, String> selectLctNmInfo(String lct_num) throws SQLException;
}
