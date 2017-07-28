<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page trimDirectiveWhitespaces="true"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	

<h1>학과 소식 출력</h1>
<c:set var="myContextPath" value="${pageContext.request.contextPath}"/>
<c:choose>
      <c:when test="${not empty deptNoticeList}">
      <form name="updateDeptBoard" action="deptProfUpdate"
       method="post" enctype="multipart/form-data">
         
          숫자:<input type="text" name="board_num" value="${deptNoticeList.board_num}" readonly><br>
          제목:<input type="text" name="board_title" value="${deptNoticeList.board_title}"><br>
          내용:<input type="text" name="board_cont" value="${deptNoticeList.board_cont}"><br>
<%--           날짜:<input type="text" name="board_date" value="${portalNoticeList.board_date}" readonly> --%>
          작성자:<input type="text" name="board_writer" value="${deptNoticeList.board_writer}" readonly><br>
          
          
         첨부파일다운:<a href="<%=request.getContextPath()%>/professor/helpDesk/main/download?fileName=

${deptNoticeList.board_af}&board_num=${board_num}" style="text-decoration: underline;">
					${deptNoticeList.board_af}
					</a><br>

          
          
    <sec:authorize access="hasRole('ROLE_WSS')">      
          첨부할파일:<input type="file" name="boardtoa" value="${deptNoticeList.board_af}"><br>
    </sec:authorize>
          게시판분류고유번호:<input type="text" name="board_bc" value="${deptNoticeList.board_bc}" readonly><br>
         
        <input type="submit" value="수정"> 
		<a href="${pageContext.request.contextPath}/professor/helpDesk/deptProfDelete?board_num=${deptNoticeList.board_num}"><input type="button" value="삭제"></a>
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

