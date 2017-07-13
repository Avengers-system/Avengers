<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page trimDirectiveWhitespaces="true"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


	
<h1>포털 검색</h1>
<h1>포털 글쓰기</h1>

<form name="insertPortalBoard">
	제목<input type="text" name="board_title">
	내용<input type="text" name="board_cont">
	작성자<input type="text" name="board_writer">
	분류번호<input type="text" name="board_bc">
	등록<input type="submit">
</form>

<h1>포털 소식 출력</h1>
<c:choose>
      <c:when test="${not empty portalNoticeList}">      
      <c:forEach var="portalNoticeList" items="${portalNoticeList }">
         <tr>
            <td>번호:${portalNoticeList.board_num}</td>
            <td>제목:${portalNoticeList.board_title}</td>
            <td>내용:${portalNoticeList.board_cont}</td>
            <td>날짜:${portalNoticeList.board_date}</td>
            <td>작성자:${portalNoticeList.board_writer}</td>
            <td>첨부일:${portalNoticeList.board_af}</td>
            <td>게시판분류 고유번호:${portalNoticeList.board_bc}</td>
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

