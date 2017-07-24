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
 

<body>
헬프데스크메인<br><hr color="orange">
<button onclick="location.href='<%=request.getContextPath()%>/professor/helpDesk/univProfNoticeList'">학교공지</button>
<button onclick="location.href='<%=request.getContextPath()%>/professor/helpDesk/deptProfNoticeList'">학과공지</button>
<button onclick="location.href='<%=request.getContextPath()%>/professor/helpDesk/univProfSchdNoticeList'">학사일정</button>
<button onclick="location.href='<%=request.getContextPath()%>/professor/helpDesk/portalProfNoticeList'">포털소식</button>
<button onclick="location.href='<%=request.getContextPath()%>/professor/helpDesk/faqProfNoticeList'">FAQ</button>
<button onclick="location.href='<%=request.getContextPath()%>/professor/helpDesk/qnaProfNoticeList'">Q&A</button>

<br/>

 <a href="${pageContext.request.contextPath}/professor/helpDesk/deptProfNoticeList"><h1>학과게시판</h1></a>
<div>
<hr border="2px gray dotted">
<c:choose>
      <c:when test="${not empty deptNoticeList}">      
      <c:forEach var="deptNoticeList" items="${deptNoticeList }" >
         <tr>
             <td>번호:${deptNoticeList.board_num}</td>
             <td><a href="<%=request.getContextPath()%>/professor/helpDesk/deptProfNoticeList">제목:${deptNoticeList.board_title}</a></td>
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


<a href="${pageContext.request.contextPath}/professor/helpDesk/portalProfNoticeList"><h1>포털게시판</h1></a>
<div>
<hr border="2px gray dotted">
<c:choose>
      <c:when test="${not empty portalNoticeList}">      
      <c:forEach var="portalNoticeList" items="${portalNoticeList }" >
         <tr>
            <td>번호:${portalNoticeList.board_num}</td>
            <td><a href="<%=request.getContextPath()%>/professor/helpDesk/portalProfNoticeList">제목:${portalNoticeList.board_title}</a></td>
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
<a href="${pageContext.request.contextPath}/professor/helpDesk/univProfSchdNoticeList"><h1>학부게시판</h1></a>
<div>
<hr border="2px gray dotted">
<c:choose>
      <c:when test="${not empty univSchdNoticeList}">      
      <c:forEach var="collegeNoticeList" items="${univSchdNoticeList }" >
         <tr>
            <td>번호:${collegeNoticeList.board_num}</td>
             <td><a href="<%=request.getContextPath()%>/professor/helpDesk/univProfSchdNoticeList">제목:${collegeNoticeList.board_title}</a></td>
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


<a href="${pageContext.request.contextPath}/professor/helpDesk/univProfNoticeList"><h1>학교게시판</h1></a>
<div>
<hr border="2px gray dotted">
<c:choose>
      <c:when test="${not empty univNoticeList}">      
      <c:forEach var="univNoticeList" items="${univNoticeList }" >
         <tr>
            <td>번호:${univNoticeList.board_num}</td>
           <td><a href="<%=request.getContextPath()%>/professor/helpDesk/univProfNoticeList">제목:${univNoticeList.board_title}</a></td>
            <td>내용:${univNoticeList.board_cont}</td>
            <td>작성일:${univNoticeList.board_date}</td>
            <td>작성자:${univNoticeList.board_writer}</td><br>
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
<a href="${pageContext.request.contextPath}/professor/helpDesk/faqProfNoticeList"><h1>FAQ</h1></a>
<div>
<hr border="2px gray dotted">
<c:choose>
      <c:when test="${not empty faqProfNoticeList}">      
      <c:forEach var="faqProfNoticeList" items="${faqProfNoticeList }" >
         <tr>
            <td>번호:${faqProfNoticeList.board_num}</td>
            <td><a href="<%=request.getContextPath()%>/professor/helpDesk/faqProfNoticeList">제목:${faqProfNoticeList.board_title}</a></td>
            <td>내용:${faqProfNoticeList.board_cont}</td>
            <td>작성일:${faqProfNoticeList.board_date}</td>
            <td>작성자:${faqProfNoticeList.board_writer}</td><br>
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
<a href="${pageContext.request.contextPath}/professor/helpDesk/qnaProfNoticeList"><h1>Q&A</h1></a>
<div>
<hr border="2px gray dotted">
<c:choose>
      <c:when test="${not empty qnaProfNoticeList}">      
      <c:forEach var="qnaProfNoticeList" items="${qnaProfNoticeList }" >
         <tr>
            <td>번호:${qnaProfNoticeList.board_num}</td>
            <td><a href="<%=request.getContextPath()%>/professor/helpDesk/qnaProfNoticeList">제목:${qnaProfNoticeList.board_title}</a></td>
            <td>내용:${qnaProfNoticeList.board_cont}</td>
            <td>작성일:${qnaProfNoticeList.board_date}</td>
            <td>작성자:${qnaProfNoticeList.board_writer}</td><br>
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