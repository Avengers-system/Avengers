package com.avengers.student.classManage.daoImpl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.avengers.db.dto.AcVO;
import com.avengers.db.dto.AsgnVO;
import com.avengers.db.dto.BoardVO;
import com.avengers.db.dto.EqVO;
import com.avengers.db.dto.ExamVO;
import com.avengers.db.dto.LaVO;
import com.avengers.db.dto.LctVO;
import com.avengers.db.dto.SubVO;
import com.avengers.student.classManage.dao.StudentClassManageDao;



/**
 * 수업관리
 *StudentClassManageDaoImpl
 * @author 조영훈
 * 2017.07.11
 */
@Repository
public class StudentClassManageDaoImpl implements StudentClassManageDao{

	@Autowired
	protected SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public ArrayList<Map<String, String>> selectClassList(String searchKey,
			int firstRow, int endRow) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Map<String, String>> selectClassList(int firstRow,
			int endRow) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public LctVO selectLct(String lct_nm) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<ExamVO> selectExamList(String lct_nm, String searchKey,
			int firstRow, int endRow) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<ExamVO> selectExamList(int firstRow, int endRow)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<EqVO> selectExamList(String eq_exam) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<AsgnVO> selectAsgnList(String searchKey, int firstRow,
			int endRow) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<AsgnVO> selectAsgnList(int firstRow, int endRow)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public AsgnVO selectAsgn(String asgn_nm, String asgn_num)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertAsgn(AsgnVO asgn) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateAsgn(AsgnVO asgn) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Map<String, Integer> selectStudInfo(String stud_num)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, String> selectAtdc(Date date, String lct_num)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateAc(String stud_num, AcVO ac) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<BoardVO> selectTeachingMaterialList(String searchKey,
			int firsRow, int endRow) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<BoardVO> selectTeachingMaterialList(int firstRow,
			int endRow) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BoardVO selectTeachingMaterial(String board_num) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<BoardVO> selectQuestionList() throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<BoardVO> selectQuestionList(String searchKey)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BoardVO selectQuestion(String board_num) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertQuestion(BoardVO board) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Map<String, String> asessMentofLectureList() throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, String> asessMentofLectureList(String searchKey)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertAsessMentofLecture(LaVO la) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	
	//배현상 강의계획서
	@Override
	public Map<String, String> selectDetailLct(String lct_num)
			throws SQLException {
		Map<String, String> detailLct = (Map<String, String>) sqlSession.selectOne("lct.selectDetailLecture", lct_num);
		return detailLct;
	}
	//배현상 시험리스트
	@Override
	public ArrayList<Map<String, String>> selectExamList(Map<String, String> key)
			throws SQLException {
		ArrayList<Map<String,String>> examList = (ArrayList<Map<String, String>>) sqlSession.selectList("exam.selectExamList", key);
		return examList;
	}

	//배현상
	//시험화면에서 응시버튼을 눌렀을 경우 화면에 뿌려줄 시험문제리스트
	@Override
	public ArrayList<EqVO> selectEqList(String exam_num) throws SQLException {
		ArrayList<EqVO> eqList = (ArrayList<EqVO>) sqlSession.selectList("eq.selectEqList", exam_num);
		return eqList;
	}

	//배현상
	//학생이 시험제출버튼을 눌렀을 때 학생답안을 저장
	@Override
	public int insertSa(ArrayList<Map<String, String>> saList)
			throws SQLException {
		int result = 0;
		for(int i=0; i<saList.size(); i++){
			result += sqlSession.insert("sa.insertSa", saList.get(i));
		}
		return result;
	}
	
	//배현상
	//학생의 응시테이블 응시여부 '응시'로 업데이트
	@Override
	public int updateTeCheck(String te_num)
			throws SQLException {
		int result = 0;
		result = sqlSession.update("te.updateTeCheck", te_num);
		return result;
	}

	//배현상
	//과목화면에 뿌릴 리스트
	@Override
	public ArrayList<Map<String, String>> selectAsgnList(Map<String, String> key)
			throws SQLException {
		
		ArrayList<Map<String, String>> asgnList = (ArrayList<Map<String, String>>) sqlSession.selectList("asgn.selectAsgnInfoList", key);
		return asgnList;
	}

	@Override
	public Map<String, String> selectAsgnInfo(Map<String, String> key)
			throws SQLException {
		Map<String, String> asgnInfo = (Map<String, String>) sqlSession.selectOne("asgn.selectAsgnInfo", key);
		return asgnInfo;
	}

	//배현상
	//학생이 과목제출버튼을 누른 경우
	@Override
	public int updateSubmissionCheck(SubVO subVO) throws SQLException {
		int result = sqlSession.update("submission.updateSubmissionCheck", subVO);
		return result;
	}

	@Override
	public Map<String, String> selectExamTimeInfo(String exam_num)
			throws SQLException {
		Map<String, String> examTimeInfo = (Map<String, String>) sqlSession.selectOne("exam.selectExamTimeInfo", exam_num);
		return examTimeInfo;
	}

	@Override
	public ArrayList<Map<String, String>> checkTlPoint(String stud_num)
			throws SQLException {
		ArrayList<Map<String, String>> lctNumList = (ArrayList<Map<String, String>>) sqlSession.selectList("tl.selectLctNumList",stud_num);
		return lctNumList;
	}

	@Override
	public void updateLectureResultPoint(ArrayList<String> lctNumList,
			String stud_num) throws SQLException {
		Map<String, String> lctNum = new HashMap<String, String>();
		//1.중간고사 2.기말고사 3.과제점수
		ArrayList<ArrayList<String>> scoreTotalList = new ArrayList<ArrayList<String>>();
		lctNum.put("stud_num", stud_num);
		for(int i=0; i<lctNumList.size(); i++){
			lctNum.put("lct_num", lctNumList.get(i));
			String meScore = (String) sqlSession.selectOne("te.selectTeMeScore", lctNum);
			String feScore = (String) sqlSession.selectOne("te.selectTeFeScore", lctNum);
			String asgnScore = (String) sqlSession.selectOne("asgn.selectAsgnScore", lctNum);
			if(meScore != null && !meScore.equals("-1") 
					&& feScore != null && !feScore.equals("-1")
					&& asgnScore != null && !asgnScore.equals("-1")){
				ArrayList<String> scoreList = new ArrayList<String>();
				scoreList.add(meScore);
				scoreList.add(feScore);
				scoreList.add(asgnScore);
				scoreList.add(lctNumList.get(i));
				scoreTotalList.add(scoreList);
			}
		}
		
		//자 위에 점수 다 가지고 왔다. 이제 합산해서 tl테이블에 넣자.
		Map<String, String> updateTotalPoint = new HashMap<String, String>();
		for(int scoreTotalIndex=0; scoreTotalIndex<scoreTotalList.size(); scoreTotalIndex++){
			int tl_point = 0;
			String tl_lev = "";
			String tl_mark = "";
			for(int scoreIndex=0; scoreIndex < scoreTotalList.get(scoreTotalIndex).size()-1; scoreIndex++){
				System.out.println(scoreTotalList.get(scoreTotalIndex).get(scoreIndex));
				tl_point += Integer.valueOf(scoreTotalList.get(scoreTotalIndex).get(scoreIndex));
			}
			if(91<=tl_point && tl_point<=100){
				tl_lev = "A+";
				tl_mark = "4.5";
			} else if(81<=tl_point && tl_point<=90){
				if(tl_point == 81){
					tl_lev = "A-";
					tl_mark = "4.0";
				}else{
					tl_lev = "A0";
					tl_mark = "4.3";
				}
			} else if(71<=tl_point && tl_point<=80){
				tl_lev = "B+";
				tl_mark = "3.5";
			} else if(61<=tl_point && tl_point<=70){
				if(tl_point == 61){
					tl_lev = "B-";
					tl_mark = "3.0";
				}else{
					tl_lev = "B0";
					tl_mark = "3.3";
				}
			} else if(51<=tl_point && tl_point<=60){
				tl_lev = "C+";
				tl_mark = "2.5";
			} else if(41<=tl_point && tl_point<=50){
				if(tl_point == 41){
					tl_lev = "C-";
					tl_mark = "2.0";
				} else{
					tl_lev = "C0";
					tl_mark = "2.3";
				}
			} else if(31<=tl_point && tl_point<=40){
				tl_lev = "D+";
				tl_mark = "1.5";
			} else if(21<=tl_point && tl_point<=30){
				if(tl_point == 21){
					tl_lev = "D-";
					tl_mark = "1.0";
				}else{
					tl_lev = "D0";
					tl_mark = "1.3";
				}
			} else{
				tl_lev = "F";
				tl_mark = "0";
			}
			updateTotalPoint.put("tl_point", String.valueOf(tl_point));
			updateTotalPoint.put("tl_lev", tl_lev);
			updateTotalPoint.put("tl_mark", tl_mark);
			updateTotalPoint.put("stud_num", stud_num);
			updateTotalPoint.put("lct_num", scoreTotalList.get(scoreTotalIndex).get(scoreTotalList.get(scoreTotalIndex).size()-1));
			System.out.println(updateTotalPoint);
			sqlSession.update("tl.updateTlScore", updateTotalPoint);
		}
	}

	@Override
	public ArrayList<Map<String, String>> selectResultScore(String stud_num)
			throws SQLException {
		ArrayList<Map<String, String>> resultScoreList = (ArrayList<Map<String, String>>) sqlSession.selectList("tl.selectResultScore", stud_num);
		return resultScoreList;
	}


}
