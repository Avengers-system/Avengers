<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page trimDirectiveWhitespaces="true"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- <!DOCTYPE html> -->
<!-- <html> -->
<!-- <head> -->
<!-- <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> -->
<!-- <title></title> -->
<!-- </head> -->
<!-- <body> -->

	
<h1>학과공지 검색</h1>



<h1>학과 정보 출력</h1>
<c:choose>
      <c:when test="${not empty deptNoticeList}">      
      <c:forEach var="deptNoticeList" items="${deptNoticeList }" >
         <tr>
            <td>번호:${deptNoticeList.board_num}</td><br>
            <td>제목:${deptNoticeList.board_title}</td><br>
            <td>내용:${deptNoticeList.board_cont}</td><br>
            <td>작성일:${deptNoticeList.board_date}</td><br>
            <td>작성자:${deptNoticeList.board_writer}</td><br>
            <td>첨부파일:${deptNoticeList.board_af}</td><br>
            <td>게시판분류코드:${deptNoticeList.board_bc}</td><br>
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
<!-- </body> -->
<!-- </html> -->
