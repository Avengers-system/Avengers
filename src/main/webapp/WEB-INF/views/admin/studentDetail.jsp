<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
     <form enctype="multipart/form-data" action="updateStudent">  
    <h1>학생 상세정보 보기</h1>
  <form enctype="multipart/form-data">
	학번 : <input type='text' name='stud_num' value='${student.stud_num}' disabled="disabled"><br/>
	이름 : <input type='text' name='stud_nm' value='${student.stud_nm}'><br/>
	영문이름 : <input type='text' name='stud_eng_nm' value='${student.stud_eng_nm}'><br/>
	성별 : <input type='text' name='stud_gen' value='${student.stud_gen}'><br/>
	학적상태 : <input type='text' name='stud_schreg_code' value='${student.stud_schreg_code}'><br/>
	학과번호 : <input type='text' name='stud_dept' value='${student.stud_dept}'><br/>
	현재학년 :<input type='text' name='stud_grd' value='${student.stud_grd}'> <br/>
	현재학기 : <input type='text' name='stud_qtr' value='${student.stud_qtr}'><br/>
	생년월일 : <input type='text' name='stud_bir' value='${student.stud_bir}'><br/>
	주민등록번호 : <input type='text' name='stud_regno' value='${student.stud_regno}'><br/>
	주소 : <input type='text' name='stud_addr' value='${student.stud_addr}'><br/>
	휴대폰번호 : <input type='text' name='stud_hp' value='${student.stud_hp}'><br/>
	 <hr/>
 
 <input type="submit" value="수정하기" >
</form>
<br/>
<br/>
<br/>
<br/>
<button onclick="location.href='<%=request.getContextPath()%>/admin/deleteStudent?stud_num=${student.stud_num}'">삭제하기</button>
<br/>
<br/>