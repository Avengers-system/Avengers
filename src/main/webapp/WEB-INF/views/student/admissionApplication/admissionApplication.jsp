<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
	<div class="row">
		<div class="col-sm-12" id="studentTopCategory">
			<input type="button" value="My Page"> 
			<input type="button" value="학적관리" onclick="location.href='schoolRegister.jsp'"> 
			<input type="button" value="수업관리" onclick="location.href='lecture.jsp'">
			<input type="button" value="수강신청" onclick="location.href='${pageContext.request.contextPath}/student/admissionApplication'">  
			<input type="button" value="등록/장학"	onclick="location.href='scholarshipRegister.jsp'"> 
			<input type="button" value="상담" onclick="location.href='consultGo.jsp'">
			<input type="button" value="Help Desk">
		</div>
	</div>
	<!-- 학생개인정보 -->
	<br> 개인정보
	<br> 이름 : ${studentInfo.stud_nm}
	<br> 학과:${dept.dept_nm }
	<br> 학년:${studentInfo.stud_grd}
	<br> 학적상태 :${studentInfo.stud_schreg_code}
	<br>
	<br>
	
	<!-- 포털소식,학교공지,학과공지,학사일정 -->
	<h6>포탈공지</h6>
	<c:choose>
		<c:when test="${not empty portalNoticeList}">
			<c:forEach var="portal" items="${portalNoticeList }">
				<tr>
					<td>번호:${portal.board_num}</td>
					<td>제목:${portal.board_title}</td>
					<td>내용:${portal.board_cont}</td>
					<td>날짜:${portal.board_date}</td>
				</tr>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<tr>
				<td colspan="5" style="text-align: center;">해당 내용이 없습니다.</td>
			</tr>
		</c:otherwise>
	</c:choose>
	<h6>학교공지</h6>
	<c:choose>
		<c:when test="${not empty schoolNoticeList}">
			<c:forEach var="school" items="${schoolNoticeList }">
				<tr>
					<td>번호:${school.board_num}</td>
					<td>제목:${school.board_title}</td>
					<td>내용:${school.board_cont}</td>
					<td>날짜:${school.board_date}</td>
				</tr>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<tr>
				<td colspan="5" style="text-align: center;">해당 내용이 없습니다.</td>
			</tr>
		</c:otherwise>
	</c:choose>
	<h6>학과공지</h6>
	<c:choose>
		<c:when test="${not empty departmentNoticeList}">
			<c:forEach var="department" items="${departmentNoticeList }">
				<tr>
					<td>번호:${department.board_num}</td>
					<td>제목:${department.board_title}</td>
					<td>내용:${department.board_cont}</td>
					<td>날짜:${department.board_date}</td>
				</tr>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<tr>
				<td colspan="5" style="text-align: center;">해당 내용이 없습니다.</td>
			</tr>
		</c:otherwise>
	</c:choose>
	<h6>학사일정</h6>
	<c:choose>
		<c:when test="${not empty schoolScheduleList}">
			<c:forEach var="schoolSchedule" items="${schoolScheduleList }">
				<tr>
					<td>번호:${schoolSchedule.board_num}</td>
					<td>제목:${schoolSchedule.board_title}</td>
					<td>내용:${schoolSchedule.board_cont}</td>
					<td>날짜:${schoolSchedule.board_date}</td>
				</tr>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<tr>
				<td colspan="5" style="text-align: center;">해당 내용이 없습니다.</td>
			</tr>
		</c:otherwise>
	</c:choose>

</body>
</html>