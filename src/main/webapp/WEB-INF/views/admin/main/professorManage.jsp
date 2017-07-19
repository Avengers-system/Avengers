<%@page import="com.avengers.db.dto.PrfsVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 


<c:if test="${msg !=null}">
		<script>
		 alert('zz');
		</script>

</c:if> 
 
 
<button onclick="location.href='${pageContext.request.contextPath}/admin/professorInsert'">교수추가하기</button>

<h1>교수목록 리스트 </h1>
<br/>
 
 <c:forEach var="professor" items="${professorList }">
	교수 번호 : ${professor.prfs_num}<br/>
	교수 이름 : <a href="professorManage/detail?prfs_num=${professor.prfs_num}">${professor.prfs_nm}</a><br/>
	교수 영문이름 : ${professor.prfs_eng_nm}<br/>
	학과번호 : ${professor.prfs_dept}<br/>
	생년월일 : ${professor.prfs_bir}<br/>
	주민등록번호 : ${professor.prfs_regno}<br/>
	성별 : ${professor.prfs_gen}<br/>
	휴대폰번호 : ${professor.prfs_hp}<br/>
	 <hr/>
 </c:forEach>

<br/>
<br/>
<br/>
<br/>
<br/>
 
 
 
