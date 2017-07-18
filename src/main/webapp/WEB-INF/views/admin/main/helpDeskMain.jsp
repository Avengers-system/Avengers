<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>

<style>



</style>

<body>
헬프데스크메인<br><hr color="orange">
<button onclick="location.href='<%=request.getContextPath()%>/admin/deptNoticeList'">학교공지</button>
<button onclick="location.href='<%=request.getContextPath()%>/admin/deptNoticeList'">학과공지</button>
<button onclick="location.href='<%=request.getContextPath()%>/admin/deptNoticeList'">학사일정</button>
<button onclick="location.href='<%=request.getContextPath()%>/admin/portalNoticeList'">포털소식</button>
<button onclick="location.href='<%=request.getContextPath()%>/admin/faqNoticeList'">FAQ</button>
<button onclick="location.href='<%=request.getContextPath()%>/admin/deptNoticeList'">Q&A</button>

<br/>
<h1>학부 정보 출력</h1>
<div>
<c:choose>
      <c:when test="${not empty collegeNoticeList}">      
      <c:forEach var="collegeNoticeList" items="${collegeNoticeList }" >
<hr color="violet">
         <tr>
            <td>번호:${collegeNoticeList.board_num}</td><br>
            <td>제목:${collegeNoticeList.board_title}</td><br>
            <td>내용:${collegeNoticeList.board_cont}</td><br>
            <td>작성일:${collegeNoticeList.board_date}</td><br>
            <td>작성자:${collegeNoticeList.board_writer}</td><br>
            <td>첨부파일:${collegeNoticeList.board_af}</td><br>
            <td>게시판분류코드:${collegeNoticeList.board_bc}</td><br>
         </tr>
      </c:forEach>
         </c:when>
         <c:otherwise>
            <tr>
               <td colspan="2" style="text-align:center;">
                  해당 내용이 없습니다.
               </td>
            </tr>
         </c:otherwise>
         
        
         
</c:choose>

</div>

<h1>포털 정보 출력</h1>
<div>
<hr border="2px gray dotted">
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
               <td colspan="2" style="text-align:center;">
                  해당 내용이 없습니다.
               </td>
            </tr>
         </c:otherwise>
         
        
         
</c:choose>

</div>
<h1>faq 정보 출력</h1>
<div>
<hr border="2px gray dotted">
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
               <td colspan="2" style="text-align:center;">
                  해당 내용이 없습니다.
               </td>
            </tr>
         </c:otherwise>
         
        
         
</c:choose>

</div>
<h1>qna 정보 출력</h1>
<div>
<hr border="2px gray dotted">
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
               <td colspan="2" style="text-align:center;">
                  해당 내용이 없습니다.
               </td>
            </tr>
         </c:otherwise>
         
        
         
</c:choose>

</div>
<h1>학교 정보 출력</h1>
<div>
<hr border="2px gray dotted">
<c:choose>
      <c:when test="${not empty schoolNoticeList}">      
      <c:forEach var="schoolNoticeList" items="${schoolNoticeList }" >
         <tr>
            <td>번호:${schoolNoticeList.board_num}</td><br>
            <td>제목:${schoolNoticeList.board_title}</td><br>
            <td>내용:${schoolNoticeList.board_cont}</td><br>
            <td>작성일:${schoolNoticeList.board_date}</td><br>
            <td>작성자:${schoolNoticeList.board_writer}</td><br>
            <td>첨부파일:${schoolNoticeList.board_af}</td><br>
            <td>게시판분류코드:${schoolNoticeList.board_bc}</td><br>
         </tr>
      </c:forEach>
         </c:when>
         <c:otherwise>
            <tr>
               <td colspan="2" style="text-align:center;">
                  해당 내용이 없습니다.
               </td>
            </tr>
         </c:otherwise>
         
        
         
</c:choose>

</div>
<h1>학부 정보 출력</h1>
<div>
<hr border="2px gray dotted">
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
               <td colspan="2" style="text-align:center;">
                  해당 내용이 없습니다.
               </td>
            </tr>
         </c:otherwise>
         
        
         
</c:choose>

</div>

</body>
</html>