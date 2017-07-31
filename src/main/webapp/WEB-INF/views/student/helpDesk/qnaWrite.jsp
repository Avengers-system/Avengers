<%@page import="org.springframework.security.core.userdetails.User"%>
<%@page
	import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../common/studHelpDeskSide.jsp"%>

<div class="col-md-10">
	<div class="panel panel-default">
		<div class="panel-heading"
			style="background-color: #2196F3; margin-top: 0px;">
			<h4 style="color: #fff; font-weight: bold; font-size: 20px;">
				<!-- 제목 -->
				Q&A
			</h4>
		</div>
		<div class="panel-body" style="height: 800px; text-align: left;">
			<!-- 		내용 -->
			<form name="insertqnaBoard" action="qnaStudWrite">

				번호 :<input type="text" name="board_num" readonly
					value="${insertBoard.board_num}"><br> 제목 :<input
					type="text" name="board_title"><br> 내용 :<input
					type="text" name="board_cont"><br> 날짜 :<input
					type="text" name="board_date" readonly
					value="${insertBoard.board_date}"><br>
				<%
					User user = (User) SecurityContextHolder.getContext()
							.getAuthentication().getPrincipal();
				%>
				작성자 :<input type="text" name="board_writer" readonly
					value="<%=user.getUsername()%>"><br> 분류번호:<input
					type="text" name="board_bc" readonly value="Q&A"><br>
				조회수:<input type="text" name="board_count" readonly value="0"><br>

				<input type="submit" value="등록"> <input type="button"
					value="목록으로" onclick="history.go(-1)">

			</form>


		</div>

	</div>
</div>



