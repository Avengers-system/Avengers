<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page trimDirectiveWhitespaces="true"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


	

<h1>학사일정 출력</h1>
 <form action="<%=request.getContextPath()%>/admin/collegeSearch?board_title=
      ${collegeSearch.board_title}">
      <input type="text" placeholder="글 제목을 입력해주세요" name="board_title">
      
      <input type="submit" value="검색">
  </form>
  
       <a href="<%=request.getContextPath()%>/admin/collegeWriteForm">글쓰기</a>
<c:choose>
      <c:when test="${not empty collegeNoticeList}">      
      <c:forEach var="collegeNoticeList" items="${collegeNoticeList }">
      <hr color="black">
         <tr>
            <td>게시판번호:${collegeNoticeList.board_num}</td><br/>
           <a href="${pageContext.request.contextPath}/admin/collegeDetail?board_num=${collegeNoticeList.board_num}&board_count=${collegeNoticeList.board_count}">
           <td>제목:${collegeNoticeList.board_title}</td></a><br/>
            <td>내용:${collegeNoticeList.board_cont}</td><br/>
            <td>날짜:${collegeNoticeList.board_date}</td><br/>
            <td>작성자:${collegeNoticeList.board_writer}</td><br/>
            <td>첨부파일:${collegeNoticeList.board_af}</td><br/>
            <td>게시판코드:${collegeNoticeList.board_bc}</td><br/>
            <td>조회수:${collegeNoticeList.board_count}</td><br/>
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

