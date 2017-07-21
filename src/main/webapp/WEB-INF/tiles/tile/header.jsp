<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<style>
#commonUserHeader{
	margin: 0 auto;
}
</style>

<!-- 비로그인시 보여주는 화면 -->
<sec:authorize access="isAnonymous()">
</sec:authorize>
<!--  로그인시 보여주는 화면 -->
<sec:authorize access="isAuthenticated()">


<input type="button" value="로그아웃" onclick="location.href='${pageContext.request.contextPath}/logout'">

</sec:authorize>
<!-- 관리자 로그인시 보여주는 화면 -->
<sec:authorize access="hasAnyRole('ROLE_ADMIN')">

</sec:authorize>
<!-- 교수 로그인시 보여주는 화면 -->
<sec:authorize access="hasAnyRole('ROLE_PROF')">
<div class="col-xs-12" >
		<ul class="nav nav-tabs nav-tabs-v1 " style="padding-top: 0" id="commonUserHeader">
			<li role="presentation"><a href="${pageContext.request.contextPath}/professor/main">Main</a></li>
			<li role="presentation"><a href="#">My Page</a></li>
			<li role="presentation"><a href="#">수업관리</a></li>
			<li role="presentation"><a href="${pageContext.request.contextPath}/professor/studentManage/departmentList">학생관리</a></li>
			<li role="presentation"><a href="${pageContext.request.contextPath}/professor/counsel/counselList">상담</a></li>
			<li role="presentation"><a href="#">Help Desk</a></li>
		</ul>
</div>
</sec:authorize>
<!-- 학생 로그인시 보여주는 화면 -->
<sec:authorize access="hasAnyRole('ROLE_STUD')">
<div class="col-xs-12" id="commonUserHeader">
	<ul class="nav nav-tabs nav-tabs-v1 " style="padding-top: 0" >
		<li role="presentation"><a href="${pageContext.request.contextPath}/student/studentMain">Main</a></li>
		<li role="presentation"><a href="#">My Page</a></li>
		<li role="presentation"><a href="${pageContext.request.contextPath}/student/schoolRegister/certificate">학적</a></li>
		<li role="presentation"><a href="${pageContext.request.contextPath}/student/classManage/classMain">수업</a></li>
		<li role="presentation"><a href="${pageContext.request.contextPath}/student/admissionApplication">수강신청</a></li>
		<li role="presentation"><a href="#">등록&장학</a></li>
		<li role="presentation"><a href="${pageContext.request.contextPath}/student/counsel/counselList">상담</a></li>
		<li role="presentation"><a href="${pageContext.request.contextPath}/student/helpDesk/studentFAQList">Help Desk</a></li>
	</ul>
</div>
</sec:authorize>