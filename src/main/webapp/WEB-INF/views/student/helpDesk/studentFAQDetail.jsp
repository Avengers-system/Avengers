<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<!-- Content -->
<!-- Counsel Left Side -->
<div class="col-md-2">

</div>

<!--  Counsel Right Side -->
<div class="col-md-10">
FAQ 디테일

글번호 : ${detail.board_num}<br>
제목 : ${detail.board_title}<br>
내용 : ${detail.board_cont}<br>
작성자 : ${detail.board_writer}<br>
<form action="${pageContext.request.contextPath}/download" method="post">
<sec:authorize access="hasRole('ROLE_WSS')">
첨부파일 : ${detail.board_aff} <input type="submit" value="다운"></sec:authorize>
<input type="hidden" name="board_af" value="${detail.board_af}" >
</form>

<sec:authorize access="hasRole('ROLE_WSS')">
<form action="${pageContext.request.contextPath}/student/helpDesk/studentFAQUpdatePage" method="post">
	<input type="submit" value="수정">
	<input type="hidden" name="pageNo" value="${pageNo}">
	<input type="hidden" name="board_num" value="${detail.board_num}">
</form>
<form action="${pageContext.request.contextPath}/student/helpDesk/studentFAQDelete" method="post">
	<input type="submit" value="삭제">
	<input type="hidden" name="board_num" value="${detail.board_num}">
</form></sec:authorize>

<form action="${pageContext.request.contextPath}/student/helpDesk/studentFAQList" method="post">
	<input type="submit" value="목록">
	<input type="hidden" name="pageNo" value="${pageNo}">
</form>

<br>



</div>
