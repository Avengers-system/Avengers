<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/studHelpDeskSide.jsp"%>
  

<div class="col-md-10">
	<div class="panel panel-default">
		<div class="panel-heading"
			style="background-color: #2196F3; margin-top: 0px;">
			<h4 style="color: #fff; font-weight: bold; font-size: 20px;">
<!-- 제목 -->
				FAQ</h4>
		</div>
		<div class="panel-body" style="height: 800px; text-align: left;">
<!-- 		내용 -->
FAQ 글쓰기 페이지
<form action="${pageContext.request.contextPath}/student/helpDesk/studentFAQWrite" method="post" enctype="multipart/form-data">
	제목 :<input type="text" name="board_title"><br>
	내용 :<input type="text" name="board_cont"><br>
	파일 :<input type="file" name="file"><br>
	<input type="submit" value="글쓰기">
</form>

<form action="${pageContext.request.contextPath}/student/helpDesk/studentFAQList" method="post">
	<input type="submit" value="목록">
	<input type="hidden" name="pageNo" value="${pageNo}">
</form>

		</div>
		
	</div>
</div>
