<%@page import="com.avengers.db.dto.PrfsVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 
<!-- Admin Header -->
<%@include file="../common/topCategory.jsp"%>

<!-- Content -->
<div class="col-md-2" id="commonLeftSide">
   <%@include file="../common/mainSideCategory.jsp" %>   
</div>
<div class="col-md-10" id="commonRightSide">

	<div class="col-md-12">
		<button class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/admin/professorInsert'">교수추가하기</button>
	</div>

<c:if test="${msg !=null}">
		<script>
		 alert('zz');
		</script>

</c:if> 
 
 <style>
	 table.professorListTable{
	 width: 600px;
	 }
 
 	table td.column1{
 	width:30%;
 	} 
 	table td.column2{
 	width:70%;
 	} 
 </style>

<h1>교수목록 리스트 </h1>
<br/>
 
 <table class="professorListTable">
 <c:forEach var="professor" items="${professorList }">
 	
 	<tr>
 		<td class="column1">교수 번호</td>
 		<td class="column2">${professor.prfs_num}</td>
 	</tr>
 	<tr>
 		<td class="column1">이름</td>
 		<td class="column2"><a href="professorManage/detail?prfs_num=${professor.prfs_num}">${professor.prfs_nm}</a></td>
 	</tr>
 	<tr>
 		<td class="column1">영문이름</td>
 		<td class="column2">${professor.prfs_eng_nm}</td>
 	</tr>
 	<tr>
 		<td class="column1">학과번호</td>
 		<td class="column2">${professor.prfs_dept}</td>
 	</tr>
 	<tr>
 		<td class="column1">생년월일</td>
 		<td class="column2">${professor.prfs_bir}</td>
 	</tr>
 	<tr>
 		<td class="column1">주민등록번호</td>
 		<td class="column2">${professor.prfs_regno}</td>
 	</tr>
 	<tr>
 		<td class="column1">성별</td>
 		<td class="column2">${professor.prfs_gen}</td>
 	</tr>
 	<tr>
 		<td class="column1">휴대폰번호</td>
 		<td class="column2">${professor.prfs_hp}</td>
 	</tr>
 
 </c:forEach>
</table>
<br/>
<br/>
 
 
</div>