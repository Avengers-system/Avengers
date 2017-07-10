package com.avengers.admin.mypage.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import com.avengers.db.dto.AdminVO;
import com.avengers.db.dto.PerschdVO;

public interface AdminMypageDao {
	public AdminVO selectAdmin()throws SQLException; //로그인한 관리자의 정보를가져온다.
	public int updateAdmin(AdminVO adminVO,String admin_id)throws SQLException;//관리자 정보수정
	
	public ArrayList<PerschdVO> selectPerschdList(String perschd_psc)throws SQLException;//일정 전체목록 읽어오기
	public PerschdVO selectPerschd(String perschd_num)throws SQLException;//일정 선택 읽어오기
	public int insertPerschd(PerschdVO perschdVO,String perschd_psc)throws SQLException;//일정 등록
	public int updatePerschd(PerschdVO perschdVO,String perschd_num)throws SQLException;//일정 수정
	public int deletePerschd(String perschd_num)throws SQLException;//일정 삭제
}
