<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  

<!-- Content -->
<!-- Counsel Left Side -->
<div class="col-md-2">

</div>

<!--  Counsel Right Side -->
<div class="col-md-10"> 
FAQ 글쓰기 페이지
<form action="${pageContext.request.contextPath}" method="post">
	제목 :<input type="text" name="board_title"><br>
	내용 :<input type="text" name="board_cont"><br>
	<input type="submit" value="글쓰기">
</form>

<form action="${pageContext.request.contextPath}/student/helpDesk/studentFAQList" method="post">
	<input type="submit" value="목록">
	<input type="hidden" name="pageNo" value="${pageNo}">
</form>


</div>