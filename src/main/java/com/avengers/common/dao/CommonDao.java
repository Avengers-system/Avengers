package com.avengers.common.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import com.avengers.db.dto.AdminVO;
import com.avengers.db.dto.BoardVO;

/**
 * 공통화면(로그인 화면) 관리
 * Common dao interface
 * @author 조영훈
 * 최조작성 2017.07.10
 */
@Repository
public interface CommonDao {
	
	//로그인 확인
	//입력한 아이디,비밀번호가 db와 일치하는지 확인
	public int loginConfirm(String id,String pw) throws SQLException;
	
	//공지사항 가져오기
	//bc_num 게시판 분류번호로 구분하여,원하는 게시판을 조회한다.
	//첫 열과 마지막 열을 넣어 조회한다.
	public ArrayList<BoardVO> selectBoard(String bc_num,int firstRow,int endRow) throws SQLException;
	
	//아이디 찾기(생년월일,이메일,이름)
	//kinds는 학생,교수,관리자 구분 ,ex)1 학생,2 교수,3 관리자
	//가입된 이메일로 아이디 전송
	public String selectId(String subject, String text, String from, String to,String name) throws SQLException;
	
	//비밀번호 찾기
	public String selectPw(String subject, String text, String from, String to,String id,String pwd,String role) throws SQLException;
	
	public AdminVO findInfo(AdminVO adminVO);
	
	public String findRole(AdminVO adminVO);
}
