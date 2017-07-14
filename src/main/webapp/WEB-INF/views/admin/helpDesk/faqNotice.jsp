<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page trimDirectiveWhitespaces="true"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


	
<h1>faq 검색</h1>

<h1>faq 정보 출력</h1>
<c:choose>
      <c:when test="${not empty faqNotice}">      
      <c:forEach var="faqNoticeList" items="${faqNoticeList }">
         <tr>
            <td>번호:${faqNoticeList.board_num}</td><br>
            <td>제목:${faqNoticeList.board_title}</td><br>
            <td>내용:${faqNoticeList.board_cont}</td><br>
            <td>날짜:${faqNoticeList.board_date}</td><br>
            <td>작성자:${faqNoticeList.board_writer}</td><br>
            <td>첨부일:${faqNoticeList.board_af}</td><br>
            <td>게시판분류 고유번호:${faqNoticeList.board_bc}</td><br>
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

