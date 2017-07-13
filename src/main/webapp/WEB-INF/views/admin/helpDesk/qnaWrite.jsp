<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page trimDirectiveWhitespaces="true"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


	
<h1>Q&A 검색</h1>
<h1>Q&A 글쓰기</h1>

<form name="insertQnaBoard">
	제목<input type="text" name="board_title">
	내용<input type="text" name="board_cont">
	작성자<input type="text" name="board_writer">
	분류번호<input type="text" name="board_bc">
	등록<input type="submit">
</form>

