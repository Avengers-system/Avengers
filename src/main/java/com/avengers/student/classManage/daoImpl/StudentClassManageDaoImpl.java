package com.avengers.student.classManage.daoImpl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
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

}
