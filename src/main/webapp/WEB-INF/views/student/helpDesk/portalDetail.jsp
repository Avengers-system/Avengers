<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page trimDirectiveWhitespaces="true"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

	

<h1>포털소식 상세보기 출력</h1>
<c:set var="myContextPath" value="${pageContext.request.contextPath}"/>
<c:choose>
      <c:when test="${not empty portalNoticeList}">
      <form name="updatePortalBoard" action="portalStudUpdate"
       method="post" enctype="multipart/form-data">
         
          숫자:<input type="text" name="board_num" value="${portalNoticeList.board_num}" readonly><br>
          제목:<input type="text" name="board_title" value="${portalNoticeList.board_title}"><br>
          내용:<input type="text" name="board_cont" value="${portalNoticeList.board_cont}"><br>
          작성자:<input type="text" name="board_writer" value="${portalNoticeList.board_writer}" readonly><br>
          
            첨부파일다운:<a href="<%=request.getContextPath()%>/student/helpDesk/main/download?fileName=${portalNoticeList.board_af}&board_num=${board_num}" style="text-decoration: underline;">
					${portalNoticeList.board_af}
					</a><br>

          <sec:authorize access="hasRole('ROLE_WSS')">
          첨부할파일:<input type="file" name="boardtoa" value="${portalNoticeList.board_af}"><br></sec:authorize>
          게시판분류고유번호:<input type="text" name="board_bc" value="${portalNoticeList.board_bc}" readonly><br>
         <sec:authorize access="hasRole('ROLE_WSS')">
        <input type="submit" value="수정"> 
		<a href="portalStudDelete?board_num=${portalNoticeList.board_num}"><input type="button" value="삭제"></a>
		</sec:authorize>
		<input type="button" value="목록으로" onclick="history.go(-1)">
      </form>      
         
         
         </c:when>
         <c:otherwise>
            <tr>
               <td colspan="5" style="text-align:center;">
                  해당 내용이 없습니다.
               </td>
            </tr>
         </c:otherwise>
</c:choose>

