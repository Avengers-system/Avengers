<%@page import="org.springframework.security.core.userdetails.User"%>
<%@page
	import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="col-md-10">
	<div class="col-md-12 panel">
		<div class="col-md-12 panel-heading">
			<h1>학과글쓰기</h1>
		</div>


		<div class="col-md-12 panel-body" style="padding-bottom: 30px; margin-left: 70px;">
			<c:set var="myContextPath" value="${pageContext.request.contextPath}" />

			<form
				action="${myContextPath}/student/helpDesk/deptStudWrite" method="post"
				enctype="multipart/form-data">
				
				
				
					
						게시판번호
						 <input type="text" name="board_num" readonly
							value="${insertBoard.board_num}"> <br>				

					
						제목<input type="text" name="board_title"><br>


						내용
						 <input type="text" name="board_cont"
							> <br>

						날짜  <input type="text"
							name="board_date" 
							value="${insertBoard.board_date}" readonly><br>
					<%
						User user = (User) SecurityContextHolder.getContext()
								.getAuthentication().getPrincipal();
					%>


						작성자 <input type="text" name="board_writer"
							class="form-text" 
							 value="<%=user.getUsername()%>"><br>


						첨부파일
					 <input type="file" name="boardaf" ><br>

					
					
					게시판코드
						<input type="text" name="board_bc" readonly
							
							value="${insertBoard.board_bc}" ><br>

					조회수
					<input type="text" name="board_count" readonly value="0" ><br>
					
					<input type="submit" value="등록" >
					</form>
					
		</div>
	</div>
</div>



