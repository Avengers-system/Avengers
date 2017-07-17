<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page trimDirectiveWhitespaces="true"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


	
<h1>포털 검색</h1>




<h1>포털 소식 출력</h1>
 <form action="<%=request.getContextPath()%>/admin/portalSearch?board_title=
      ${portalSearch.board_title}">
      <input type="text" placeholder="글 제목을 입력해주세요" name="board_title">
      
      <input type="submit" value="검색">
  </form>
  
       <a href="<%=request.getContextPath()%>/admin/portalWriteForm">글쓰기</a>
<c:choose>
      <c:when test="${not empty portalNoticeList}">      
      <c:forEach var="portalNoticeList" items="${portalNoticeList }">
      <hr color="black">
         <tr>
            <td>게시판번호:${portalNoticeList.board_num}</td><br>
           <a href="${pageContext.request.contextPath}/admin/portalDetail?board_num=${portalNoticeList.board_num}&board_count=${portalNoticeList.board_count}">
           <td>제목:${portalNoticeList.board_title}</td></a><br>
            <td>내용:${portalNoticeList.board_cont}</td><br>
            <td>날짜:${portalNoticeList.board_date}</td><br>
            <td>작성자:${portalNoticeList.board_writer}</td><br>
            <td>첨부일:${portalNoticeList.board_af}</td><br>
            <td>게시판분류 고유번호:${portalNoticeList.board_bc}</td><br>
            <td>조회수:${portalNoticeList.board_count}</td><br>
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

