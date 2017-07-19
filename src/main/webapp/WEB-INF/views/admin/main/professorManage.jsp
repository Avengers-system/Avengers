<%@page import="com.avengers.db.dto.PrfsVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 
<style>
	#professorTable,  #professorTable td{
		border : 2px solid black;
	}
</style>

<c:if test="${msg !=null}">
		<script>
		 alert('zz');
		</script>

</c:if> 
 
 
<button onclick="location.href='${pageContext.request.contextPath}/admin/professorInsert'">교수추가하기</button>

<h1>교수목록 리스트 </h1>
<br/>

 <table id="professorTable">
		 <c:forEach var="professor" items="${professorList }">
 			<tr>
	 		<td>교수 번호</td>
	 		<td>${professor.prfs_num}</td>
	 		</tr>
 			<tr>
	 		<td>교수 이름</td>
	 		<td><a href="professorManage/detail?prfs_num=${professor.prfs_num}">${professor.prfs_nm}</a></td>
	 		</tr>
 			<tr>
	 		<td>영문이름</td>
	 		<td>${professor.prfs_eng_nm}</td>
	 		</tr>
 			<tr>
	 		<td>학과번호</td>
	 		<td>${professor.prfs_dept}</td>
	 		</tr>
 			<tr>
	 		<td>생년월일</td>
	 		<td>${professor.prfs_bir}</td>
	 		</tr>
 			<tr>
	 		<td>주민등록번호</td>
	 		<td>${professor.prfs_regno}</td>
	 		</tr>
 			<tr>
	 		<td>성별</td>
	 		<c:choose>
					<c:when test="${professor.prfs_gen == '1'} ">
						<td>남자</td>
					</c:when>
					<c:otherwise>
						<td>여자</td>
				  	</c:otherwise>
			</c:choose>
	 		</tr>
 			<tr>
	 		<td>휴대폰번호</td>
	 		<td>${professor.prfs_hp}</td>
	 		</tr>
		 </c:forEach>
</table>

<br/>
<br/>
<br/>
<br/>
<br/>
 
 
 
