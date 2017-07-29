package com.avengers.admin.studentManage.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.avengers.db.dto.LoaVO;
import com.avengers.db.dto.RtsVO;
import com.avengers.db.dto.StudVO;

public interface AdminStudentManageDao {
   public ArrayList<StudVO> selectStudList(String key,int firstRow,int lastRow)throws SQLException;//전체 학생 목록 가져오기
   public StudVO selectStud(String stud_num)throws SQLException;//학생 상세정보 읽어오기
   public int insertStud(StudVO studVO)throws SQLException;//학생 등록
   public int updateStud(StudVO studVO)throws SQLException;//학생 수정
   public int deleteStud(String stud_num)throws SQLException;//학생 삭제
   public ArrayList<StudVO> selectStudList() throws SQLException;//학생 전체목록
   public String selectStudNum()throws SQLException; //학생번호(최근)
   public int insertSecurity(StudVO studVO); //시큐리티등록
   public ArrayList<StudVO> selectStudbyKeyword(String keyword);
   public int getEmpListCount(StudVO studVO)throws SQLException;
   public ArrayList<StudVO> getEmpList(StudVO studVO)throws SQLException;
   /** 휴학리스트 검색
    *  2017.07.27일자 추가 -배진 
    *  
    */
   public List<HashMap<String,String>> selectLoaList(LoaVO loaVO)throws SQLException;
   /** 복학리스트 검색
    *  2017.07.27일자 추가 -배진 
    *  
    */
   public List<HashMap<String,String>> selectRtsList(RtsVO rtsVO)throws SQLException;
   /** 휴학리스트 업데이트
    *  2017.07.27일자 추가 -배진 
    *  
    */
   public int updateLoaList(LoaVO loaVO)throws SQLException;
   /** 복학리스트 업데이트
    *  2017.07.27일자 추가 -배진 
    */
   public int updateRtsList(RtsVO rtsVO)throws SQLException;

}