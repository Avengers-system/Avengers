<%@page import="com.avengers.db.dto.PrfsVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 

<h1>학생목록 리스트 </h1>
 
 <c:forEach var="student" items="${studentList}"> <br/>
	학번 : ${student.stud_num } <br/>
	이름 : <a href="studentManage/detail?stud_num=${student.stud_num}">${student.stud_nm}</a> <br/>
	학과 : ${student.stud_dept } <br/>
	학기 : ${student.stud_qtr }<br/>
	성별 : ${student.stud_gen }<br/>
	생년월일 : ${student.stud_bir}<br/>
	휴대폰번호 : ${student.stud_hp }<br/>
	주민등록번호 : ${student.stud_regno}<br/>
	주소 : ${student.stud_addr}<br/>
	<hr/>
 </c:forEach>

<br/>
<br/>
<br/>
<br/>
<button onclick="location.href='<%=request.getContextPath()%>/admin/professorInsert'">교수추가하기</button>
<br/>
<br/>
 
 
 
