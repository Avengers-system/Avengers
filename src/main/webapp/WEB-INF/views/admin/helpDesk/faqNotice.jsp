<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page trimDirectiveWhitespaces="true"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


	

<h1>FAQ게시판 글 출력</h1>
 <form action="<%=request.getContextPath()%>/admin/faqSearch?board_title=
      ${faqSearch.board_title}">
      <input type="text" placeholder="글 제목을 입력해주세요" name="board_title">
      
      <input type="submit" value="검색">
  </form>
  
       <a href="<%=request.getContextPath()%>/admin/faqWriteForm">글쓰기</a>
<c:choose>
      <c:when test="${not empty faqNoticeList}">      
      <c:forEach var="faqNoticeList" items="${faqNoticeList }">
      <hr color="black">
         <tr>
            <td>게시판번호:${faqNoticeList.board_num}</td><br/>
           <a href="${pageContext.request.contextPath}/admin/faqDetail?board_num=${faqNoticeList.board_num}
           &board_count=${faqNoticeList.board_count}">
           <td>제목:${faqNoticeList.board_title}</td></a><br/>
            <td>내용:${faqNoticeList.board_cont}</td><br/>
            <td>날짜:${faqNoticeList.board_date}</td><br/>
            <td>작성자:${faqNoticeList.board_writer}</td><br/>
            <td>첨부파일:${faqNoticeList.board_af}</td><br/>
            <td>게시판분류 고유번호:${faqNoticeList.board_bc}</td><br/>
            <td>조회수:${faqNoticeList.board_count}</td><br/>
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

