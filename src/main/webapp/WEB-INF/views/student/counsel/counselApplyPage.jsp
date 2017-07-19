<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<a href="${pageContext.request.contextPath}/student/counsel/counselList">상담목록</a>
<a href="${pageContext.request.contextPath}/student/counsel/counselApplyPage">상담신청</a>
</div>

<!--  Counsel Right Side -->
<div class="col-md-10">
상담페이지

<form action="${pageContext.request.contextPath}/student/counsel/counselApplyDetail">
<input type="text" name="cns_date" value="2017/07/01">

<input type="submit" value="달력클릭시">
</form>
</div>


