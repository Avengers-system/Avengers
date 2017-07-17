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
		<li role="presentation"><a href="#">Help Desk</a></li>
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
<c:forEach var="cnsList" items="${cnsList}">
	제목 : ${cnsList.cns_title}<br>
	상담여부 : ${cnsList.cns_check}<br>
</c:forEach>

</div>




