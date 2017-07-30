<%@page import="org.springframework.security.core.userdetails.User"%>
<%@page
	import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="col-md-10">
	<div class="panel panel-default">
		<!--  메뉴제목 -->
		<div class="panel-heading"
			style="background-color: #2196F3; margin-top: 10px;">
			<h4 style="color: #fff; font-weight: bold; font-size: 20px;">

				학과소식글쓰기</h4>
		</div>
		<div class="panel-body" style="height: 580px; text-align: left;">

			<c:set var="myContextPath" value="${pageContext.request.contextPath}" />
			<form name="insertdeptBoard"
				action="${myContextPath}/professor/helpDesk/deptProfWrite" method="post"
				enctype="multipart/form-data">


				게시판번호 <input type="text" name="board_num" readonly
					value="${insertBoard.board_num}"><br> 제목<input
					type="text" name="board_title"><br> 내용<input
					type="text" name="board_cont"><br>

				<%
					User user = (User) SecurityContextHolder.getContext()
							.getAuthentication().getPrincipal();
				%>

				작성자 <input type="text" name="board_writer" readonly
					value="<%=user.getUsername()%>"><br> 첨부파일 <input
					type="file" name="boardaf"><br> 게시판코드 <input
					type="text" name="board_bc" readonly value="${insertBoard.board_bc}"><br>


				조회수 <input type="text" name="board_count" readonly value="0">
				<br> <input type="submit" value="등록">


			</form>






		</div>

	</div>
</div>


