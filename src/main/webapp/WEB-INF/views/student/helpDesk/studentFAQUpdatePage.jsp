<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
 
<!-- Student Header -->
<%@include file="../common/topCategory.jsp" %>

<!-- Content -->
<!-- Counsel Left Side -->
<div class="col-md-2">

</div>

<!--  Counsel Right Side -->
<div class="col-md-10">   
 <form action="${pageContext.request.contextPath}/student/helpDesk/studentFAQUpdate" method="post">
 FAQ 수정페이지
 글번호 : ${detail.board_num}<input type="hidden" name="board_num" value="${detail.board_num}"><br>
 작성자 : ${detail.board_writer}<br>
 제목 : <input type="text" name="board_title" value="${detail.board_title}"><br>
 내용 : <input type="text" name="board_cont"value="${detail.board_cont}"><br>
 
	<input type="submit" value="수정">
	<input type="hidden" name="pageNo" value="${pageNo}">
	<input type="hidden" name="board_num" value="${detail.board_num}">
</form>

<form action="${pageContext.request.contextPath}/student/helpDesk/studentFAQDetail" method="post">
	<input type="submit" value="취소">
	<input type="hidden" name="pageNo" value="${pageNo}">
	<input type="hidden" name="board_num" value="${detail.board_num}">
</form>
  
</div>