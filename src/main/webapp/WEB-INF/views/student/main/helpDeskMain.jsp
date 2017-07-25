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
<!-- Student Header -->
헬프데스크메인<br><hr color="orange">
<button onclick="location.href='<%=request.getContextPath()%>/student/helpDesk/univStudNoticeList'">학교공지</button>
<button onclick="location.href='<%=request.getContextPath()%>/student/helpDesk/deptStudNoticeList'">학과공지</button>
<button onclick="location.href='<%=request.getContextPath()%>/student/helpDesk/univSchdStudNoticeList'">학사일정</button>
<button onclick="location.href='<%=request.getContextPath()%>/student/helpDesk/portalStudNoticeList'">포털소식</button>
<button onclick="location.href='<%=request.getContextPath()%>/student/helpDesk/studentFAQList'">FAQ</button>
<button onclick="location.href='<%=request.getContextPath()%>/student/helpDesk/qnaStudNoticeList'">Q&A</button>

<br/>

 <a href="${pageContext.request.contextPath}/student/helpDesk/deptStudNoticeList"><h1>학과게시판</h1></a>
<div>
<hr border="2px gray dotted">
<c:choose>
      <c:when test="${not empty deptNoticeList}">      
      <c:forEach var="deptNoticeList" items="${deptNoticeList }" >
         <tr>
             <td>번호:${deptNoticeList.board_num}</td>
             <td><a href="<%=request.getContextPath()%>/student/helpDesk/deptStudNoticeList">제목:${deptNoticeList.board_title}</a></td>
              <td>작성일:${deptNoticeList.board_date}</td>
             <td>작성자:${deptNoticeList.board_writer}</td>
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


<a href="${pageContext.request.contextPath}/student/helpDesk/portalStudNoticeList"><h1>포털게시판</h1></a>
<div>
<hr border="2px gray dotted">
<c:choose>
      <c:when test="${not empty portalNoticeList}">      
      <c:forEach var="portalNoticeList" items="${portalNoticeList }" >
         <tr>
            <td>번호:${portalNoticeList.board_num}</td>
            <td><a href="<%=request.getContextPath()%>/student/helpDesk/portalStudNoticeList">제목:${portalNoticeList.board_title}</a></td>
            <td>작성일:${portalNoticeList.board_date}</td>
            <td>작성자:${portalNoticeList.board_writer}</td><br>
           
         </tr>
      </c:forEach>
         </c:when>
         <c:otherwise>
            <tr>
               <td colspan="4" style="text-align:center;">
                  해당 내용이 없습니다.
               </td>
            </tr>
         </c:otherwise>
         
        
         
</c:choose>

</div>
<a href="${pageContext.request.contextPath}/student/helpDesk/collegeStudNoticeList"><h1>학부게시판</h1></a>
<div>
<hr border="2px gray dotted">
<c:choose>
      <c:when test="${not empty collegeNoticeList}">      
      <c:forEach var="collegeNoticeList" items="${collegeNoticeList }" >
         <tr>
            <td>번호:${collegeNoticeList.board_num}</td>
             <td><a href="<%=request.getContextPath()%>/student/helpDesk/collegeStudNoticeList">제목:${collegeNoticeList.board_title}</a></td>
            <td>내용:${collegeNoticeList.board_cont}</td>
            <td>작성일:${collegeNoticeList.board_date}</td>
            <td>작성자:${collegeNoticeList.board_writer}</td><br>
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


<a href="${pageContext.request.contextPath}/student/helpDesk/univStudNoticeList"><h1>학교게시판</h1></a>
<div>
<hr border="2px gray dotted">
<c:choose>
      <c:when test="${not empty schoolNoticeList}">      
      <c:forEach var="schoolNoticeList" items="${schoolNoticeList }" >
         <tr>
            <td>번호:${schoolNoticeList.board_num}</td>
           <td><a href="<%=request.getContextPath()%>/student/helpDesk/schoolNoticeList">제목:${schoolNoticeList.board_title}</a></td>
            <td>내용:${schoolNoticeList.board_cont}</td>
            <td>작성일:${schoolNoticeList.board_date}</td>
            <td>작성자:${schoolNoticeList.board_writer}</td><br>
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
<a href="${pageContext.request.contextPath}/student/helpDesk/studentFAQList"><h1>FAQ</h1></a>
<div>
<hr border="2px gray dotted">
<c:choose>
      <c:when test="${not empty faqNoticeList}">      
      <c:forEach var="faqNoticeList" items="${faqNoticeList }" >
         <tr>
            <td>번호:${faqNoticeList.board_num}</td>
            <td><a href="<%=request.getContextPath()%>/student/helpDesk/studentFAQList">제목:${faqNoticeList.board_title}</a></td>
            <td>내용:${faqNoticeList.board_cont}</td>
            <td>작성일:${faqNoticeList.board_date}</td>
            <td>작성자:${faqNoticeList.board_writer}</td><br>
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
<a href="${pageContext.request.contextPath}/student/helpDesk/qnaStudNoticeList"><h1>Q&A</h1></a>
<div>
<hr border="2px gray dotted">
<c:choose>
      <c:when test="${not empty qnaNoticeList}">      
      <c:forEach var="qnaNoticeList" items="${qnaNoticeList }" >
         <tr>
            <td>번호:${qnaNoticeList.board_num}</td>
            <td><a href="<%=request.getContextPath()%>/student/helpDesk/qnaStudNoticeList">제목:${qnaNoticeList.board_title}</a></td>
            <td>내용:${qnaNoticeList.board_cont}</td>
            <td>작성일:${qnaNoticeList.board_date}</td>
            <td>작성자:${qnaNoticeList.board_writer}</td><br>
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