<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page trimDirectiveWhitespaces="true"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	
<h1>학과공지 검색</h1>
<form action="<%=request.getContextPath()%>/admin/deptSearch?board_title=
      ${deptSearch.board_title}">
      <input type="text" placeholder="글 제목을 입력해주세요" name="board_title">
      
      <input type="submit" value="검색">
  </form>

	   <a href="<%=request.getContextPath()%>/admin/deptWriteForm">글쓰기</a>
<h1>학과 정보 출력</h1>
<c:choose>
      <c:when test="${not empty deptNoticeList}">      
      <c:forEach var="deptNoticeList" items="${deptNoticeList }" >
      <hr color="black">
         <tr>
            <td>게시판번호:${deptNoticeList.board_num}</td><br>
             <a href="${pageContext.request.contextPath}/admin/deptDetail?board_num=${deptNoticeList.board_num}
             &board_count=${deptNoticeList.board_count}">
            <td>제목:${deptNoticeList.board_title}</td></a><br>
            <td>내용:${deptNoticeList.board_cont}</td><br>
            <td>작성일:${deptNoticeList.board_date}</td><br>
            <td>작성자:${deptNoticeList.board_writer}</td><br>
            <td>첨부파일:${deptNoticeList.board_af}</td><br>
            <td>게시판분류코드:${deptNoticeList.board_bc}</td><br>
            <td>조회수:${deptNoticeList.board_count}</td><br>
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
