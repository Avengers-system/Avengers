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

<!-- Content -->
<!-- Counsel Left Side -->
<div class="col-md-2">

</div>

<!--  Counsel Right Side -->
<div class="col-md-10">
FAQ 디테일

제목 : ${detail.board_title}<br>
내용 : ${detail.board_cont}<br>


<form action="${pageContext.request.contextPath}/student/helpDesk/studentFAQList" method="post">
<input type="submit" value="목록">
<input type="hidden" name="pageNo" value="${pageNo}">
</form>

<br>



</div>