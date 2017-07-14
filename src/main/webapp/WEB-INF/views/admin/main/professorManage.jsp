<%@page import="com.avengers.db.dto.PrfsVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 

<h1>교수목록 리스트 </h1>
 
 <c:forEach var="professor" items="${professorList }">
	교수 이름 : ${professor.prfs_nm}<br/>
	교수 영문이름 : ${professor.prfs_eng_nm}<br/>
	학과번호 : ${professor.prfs_dept}<br/>
	생년월일 : ${professor.prfs_bir}<br/>
	주민등록번호 : ${professor.prfs_regno}<br/>
	성별 : ${professor.prfs_gen}<br/>
	휴대폰번호 : ${professor.prfs_hp}<br/>
 </c:forEach>

<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
 
 
 
