<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page trimDirectiveWhitespaces="true"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


	

<h1>대학 소식 출력</h1>
 <form action="<%=request.getContextPath()%>/admin/univSearch?board_title=
      ${univSearch.board_title}">
      <input type="text" placeholder="글 제목을 입력해주세요" name="board_title">
      
      <input type="submit" value="검색">
  </form>
  
       <a href="<%=request.getContextPath()%>/admin/univWriteForm">글쓰기</a>
<c:choose>
      <c:when test="${not empty univNoticeList}">      
      <c:forEach var="univNoticeList" items="${univNoticeList }">
      <hr color="black">
         <tr>
            <td>게시판번호:${univNoticeList.board_num}</td><br/>
           <a href="${pageContext.request.contextPath}/admin/univDetail?board_num=${univNoticeList.board_num}&board_count=${univNoticeList.board_count}">
           <td>제목:${univNoticeList.board_title}</td></a><br/>
            <td>내용:${univNoticeList.board_cont}</td><br/>
            <td>날짜:${univNoticeList.board_date}</td><br/>
            <td>작성자:${univNoticeList.board_writer}</td><br/>
            <td>첨부파일:${univNoticeList.board_af}</td><br/>
            <td>게시판코드:${univNoticeList.board_bc}</td><br/>
            <td>조회수:${univNoticeList.board_count}</td><br/>
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

