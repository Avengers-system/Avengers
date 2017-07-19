<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page trimDirectiveWhitespaces="true"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


	

<h1>Q&A 글 출력</h1>
 <form action="<%=request.getContextPath()%>/admin/qnaSearch?board_title=
      ${qnaSearch.board_title}">
      <input type="text" placeholder="글 제목을 입력해주세요" name="board_title">
      
      <input type="submit" value="검색">
  </form>
  
       <a href="<%=request.getContextPath()%>/admin/qnaWriteForm">글쓰기</a>
<c:choose>
      <c:when test="${not empty qnaNoticeList}">      
      <c:forEach var="qnaNoticeList" items="${qnaNoticeList }">
      <hr color="black">
         <tr>
            <td>게시판번호:${qnaNoticeList.board_num}</td><br/>
           <a href="${pageContext.request.contextPath}/admin/qnaDetail?board_num=${qnaNoticeList.board_num}&board_count=${qnaNoticeList.board_count}">
           <td>제목:${qnaNoticeList.board_title}</td></a><br/>
            <td>내용:${qnaNoticeList.board_cont}</td><br/>
            <td>날짜:${qnaNoticeList.board_date}</td><br/>
            <td>작성자:${qnaNoticeList.board_writer}</td><br/>
            <td>첨부파일:${qnaNoticeList.board_af}</td><br/>
            <td>게시판분류 고유번호:${qnaNoticeList.board_bc}</td><br/>
            <td>조회수:${qnaNoticeList.board_count}</td><br/>
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

