<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page trimDirectiveWhitespaces="true"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


	
<h1>학교공지 검색</h1>
<h1>학교공지 글쓰기</h1>

<form name="insertSchoolBoard">
	제목<input type="text" name="board_title">
	내용<input type="text" name="board_cont">
	작성자<input type="text" name="board_writer">
	분류번호<input type="text" name="board_bc">
	등록<input type="submit">
</form>

<h1>학사일정 정보 출력</h1>
<c:choose>
      <c:when test="${not empty schoolNoticeList}">      
      <c:forEach var="schoolNoticeList" items="${schoolNoticeList }">
         <tr>
            <td>번호:${schoolNoticeList.board_num}</td>
            <td>제목:${schoolNoticeList.board_title}</td>
            <td>내용:${schoolNoticeList.board_cont}</td>
            <td>날짜:${schoolNoticeList.board_date}</td>
            <td>작성자:${schoolNoticeList.board_writer}</td>
            <td>첨부일:${schoolNoticeList.board_af}</td>
            <td>게시판분류 고유번호:${schoolNoticeList.board_bc}</td>
         </tr>
      </c:forEach>
         </c:when>
         <c:otherwise>
            <tr>
               <td colspan="5" style="text-align:center;">
                  해당 내용이 없습니다.
               </td>
            </tr>
         </c:otherwise>
</c:choose>

