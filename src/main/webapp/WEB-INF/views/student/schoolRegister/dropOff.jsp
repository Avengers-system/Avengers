<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
자퇴신청현황

<c:forEach var="dropList" items="${dropOffList}">
	자퇴번호 ${dropList.ls_num}<br>	

</c:forEach>
<p>자퇴신청</p>
<form action="${pageContext.request.contextPath}/student/schoolRegister/dropOffApply">
		<input type="text" name="ls_num" placeholder="자퇴고유번호">
		<input type="text" name="ls_appl_date" placeholder="자퇴신청일">
		<input type="text" name="ls_appr_date" placeholder="관리자승인일">
		<input type="text" name="ls_appr_check" placeholder="관리자승인여부">
		<input type="text" name="ls_ftf_cont" placeholder="면담내용">
		<input type="text" name="ls_admin" placeholder="관리자아이디">
		<input type="submit" value="자퇴신청">
	</form>

</div>