package com.avengers.student.classManage.serviceImpl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.avengers.db.dto.AcVO;
import com.avengers.db.dto.AsgnVO;
import com.avengers.db.dto.BoardVO;
import com.avengers.db.dto.EqVO;
import com.avengers.db.dto.ExamVO;
import com.avengers.db.dto.LaVO;
import com.avengers.db.dto.LctVO;
import com.avengers.db.dto.SubVO;
import com.avengers.db.dto.TeVO;
import com.avengers.student.classManage.dao.StudentClassManageDao;
import com.avengers.student.classManage.service.StudentClassManageService;

/**
 * 수업관리
 *StudentClassManageServiceImpl
 * @author 조영훈
 * 2017.07.11
 */
@Service
public class StudentClassManageServiceImpl implements StudentClassManageService {

	@Autowired
	private StudentClassManageDao stuClassDAO;
	
	public void setStuClassDAO(StudentClassManageDao stuClassDAO) {
		this.stuClassDAO = stuClassDAO;
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
	
	
	//배현상
	//강의계획서
	@Override
	public Map<String, String> selectDetailLct(String lct_num)
			throws SQLException {
		Map<String, String> detailLct = stuClassDAO.selectDetailLct(lct_num);
		return detailLct;
	}
	//배현상
	//시험리스트 불러오기
	@Override
	public ArrayList<Map<String, String>> selectExamList(Map<String, String> key)
			throws SQLException {
		ArrayList<Map<String, String>> examList = stuClassDAO.selectExamList(key);
		return examList;
	}

	//배현상
	//시험화면에서 응시버튼을 누를 경우 화면에 뿌려질 시험문제 리스트
	@Override
	public ArrayList<EqVO> selectEqList(String exam_num) throws SQLException {
		ArrayList<EqVO> teList = stuClassDAO.selectEqList(exam_num);
		return teList;
	}
	
	//배현상
	//학생이 시험제출버튼을 눌렀을 때 학생답안을 저장
	@Override
	public int insertSa(ArrayList<Map<String, String>> saList)
			throws SQLException {
		int result = stuClassDAO.insertSa(saList);
		return result;
	}

	@Override
	public int updateTeCheck(String te_num)
			throws SQLException {
		int result = stuClassDAO.updateTeCheck(te_num);
		return result;
	}
	
	//배현상
	//과목화면에 뿌려질 리스트
	@Override
	public ArrayList<Map<String, String>> selectAsgnList(Map<String, String> key)
			throws SQLException {
		ArrayList<Map<String, String>> asgnList = stuClassDAO.selectAsgnList(key);

		return asgnList;
	}

	@Override
	public Map<String, String> selectAsgnInfo(Map<String, String> key)
			throws SQLException {
		Map<String, String> asgnInfo = stuClassDAO.selectAsgnInfo(key);
		return asgnInfo;
	}

	@Override
	public int updateSubmissionCheck(SubVO subVO) throws SQLException {
		int result = stuClassDAO.updateSubmissionCheck(subVO);
		return result;
	}

}
