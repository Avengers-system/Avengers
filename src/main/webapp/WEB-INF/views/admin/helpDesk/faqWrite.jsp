<%@page import="org.springframework.security.core.userdetails.User"%>
<%@page
	import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../common/helpDesk_leftSide.jsp"%>


<div class="col-md-10">
	<div class="panel panel-default">
		<!--  메뉴제목 -->
		<div class="panel-heading"
			style="background-color: #2196F3; margin-top: 10px;">
			<h4 style="color: #fff; font-weight: bold; font-size: 20px;">

				학생FAQ글쓰기</h4>
		</div>
		<!-- 내용시작 -->	
<div class="panel-body" style="height: 580px; text-align: left;">

<form name="insertfaqBoard" action="faqWrite">

	게시판번호 :<input type="text" name="board_num" readonly
		value="${insertBoard.board_num}"><br> 제목 :<input
		type="text" name="board_title"><br> 내용 :<input
		type="text" name="board_cont"><br> 날짜 :<input type="text"
		name="board_date" readonly value="${insertBoard.board_date}"><br>
	<%User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal(); %>
	작성자 :<input type="text" name="board_writer" readonly
		value="<%=user.getUsername()%>"><br> 첨부일 :<input
		type="text" name="board_af"><br> 분류번호:<input type="text"
		name="board_bc" readonly value="FAQ"><br> 조회수:<input
		type="text" name="board_count" readonly value="0"><br> <input
		type="submit" value="등록">


</form>



</div>
		
		
		
		
	</div>
</div>

