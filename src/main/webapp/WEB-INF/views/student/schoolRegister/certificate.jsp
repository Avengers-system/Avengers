<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- UserHeader -->
<div class="col-md-12" id="commonUserHeader">
	<ul class="nav nav-tabs">
		<li role="presentation" class="active"><a href="#">Main</a></li>
		<li role="presentation"><a href="#">My Page</a></li>
		<li role="presentation"><a href="${pageContext.request.contextPath}/student/schoolRegister/certificate">학적</a></li>
		<li role="presentation"><a href="#">수업</a></li>
		<li role="presentation"><a href="#">수강신청</a></li>
		<li role="presentation"><a href="#">등록&장학</a></li>
		<li role="presentation"><a href="${pageContext.request.contextPath}/student/counsel/counselList">상담</a></li>
		<li role="presentation"><a href="${pageContext.request.contextPath}/student/helpDesk/studentFAQList">Help Desk</a></li>
	</ul>
</div>
<!-- Counsel Content -->
<!-- Counsel Left Side -->
<div class="col-md-2">
<a href="${pageContext.request.contextPath}/student/schoolRegister/certificate">증명서발급</a>
<a href="${pageContext.request.contextPath}/student/schoolRegister/leaveBackList">휴/복학 내역</a>
<a href="${pageContext.request.contextPath}/student/schoolRegister/leaveBackApplyPage">휴/복학 신청</a>
<a href="${pageContext.request.contextPath}/student/schoolRegister/dropOff">자퇴 신청</a>
</div>

<!--  Counsel Right Side -->
<div class="col-md-10">
증명서 
<select>
	<option>성적증명서</option>
	<option>재학증명서</option>
	<option>졸업예정증명서</option>
	<option>졸업증명서</option>
</select>

 <button onclick="location.href='${pageContext.request.contextPath}/student/schoolRegister/gradeCertificate'">발급</button>
</div>
 