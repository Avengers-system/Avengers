<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page trimDirectiveWhitespaces="true"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


	

<h1>학과공지 글쓰기</h1>

<form name="insertDeptBoard2" action="/insertDeptBoard2" >

	숫자    :<input type="text" name="board_num"><br>
	제목    :<input type="text" name="board_title"><br>
	내용    :<input type="text" name="board_cont"><br>
	날짜    :<input type="text" name="board_date"><br>
	작성자  :<input type="text" name="board_writer"><br>
	첨부일  :<input type="text" name="board_af"><br>
	분류번호:<input type="text" name="board_bc"><br>
	등록<input type="submit"> <input type="button" value="수정"> <input type="button" value="삭제">
	
</form>



