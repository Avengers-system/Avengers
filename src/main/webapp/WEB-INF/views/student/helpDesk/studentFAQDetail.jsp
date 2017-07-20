<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



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


<form action="${pageContext.request.contextPath}/student/helpDesk/studentFAQUpdatePage" method="post">
	<input type="submit" value="수정">
	<input type="hidden" name="pageNo" value="${pageNo}">
	<input type="hidden" name="board_num" value="${detail.board_num}">
</form>
<form action="${pageContext.request.contextPath}/student/helpDesk/studentFAQDelete" method="post">
	<input type="submit" value="삭제">
	<input type="hidden" name="board_num" value="${detail.board_num}">
</form>

<form action="${pageContext.request.contextPath}/student/helpDesk/studentFAQList" method="post">
	<input type="submit" value="목록">
	<input type="hidden" name="pageNo" value="${pageNo}">
</form>

<br>



</div>