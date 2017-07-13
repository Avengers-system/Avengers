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

교수 메인
<button onclick="location.href='<%=request.getContextPath()%>/admin/adminMain'">관리자</button>
<button onclick="location.href='${pageContext.request.contextPath}/professor/main'">교수</button>
<button onclick="location.href='<%=request.getContextPath()%>/student/studentMain'">학생</button>
<button onclick="location.href='<%=request.getContextPath()%>/common/logout'">로그아웃</button>
<br>
<h6>교수개인정보</h6>
<c:choose>
	<c:when test="${not empty prfs }">
		<p>이름:${prfs.prfs_nm }</p>
		<p>이메일:${prfs.prfs_email }</p>
	</c:when>
</c:choose>

<h6>개인일정</h6>
<c:choose>
      <c:when test="${not empty perschdList}">      
      <c:forEach var="perschd" items="${perschdList }">
         <tr>
            <td>제목:${perschd.perschd_title}</td>
            <td>내용:${perschd.perschd_cont}</td>
            <td>번호:${perschd.perschd_num}</td>
            <td>날짜:${perschd.perschd_date}</td>
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

<h6>강의정보</h6>
<c:choose>
      <c:when test="${not empty lctList}">      
      <c:forEach var="lct" items="${lctList }" >
         <tr>
            <td>강의번호:${lct.lct_num}</td>
            <td>강의시간:${lct.lr_num}</td>
            <td>강의날짜:${lct.lr_date}</td>
            <td>강의실번호:${lct.lr_lct}</td>
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

<h6>상담정보</h6>
<c:choose>
      <c:when test="${not empty cnsList}">      
      <c:forEach var="cns" items="${cnsList }">
         <tr>
            <td>상담번호:${cns.cns_num}</td>
            <td>상담종류:${cns.cns_kind}</td>
            <td>제목:${cns.cns_title}</td>
            <td>내용:${cns.cns_cont}</td>
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

<h6>포탈공지</h6>
<c:choose>
      <c:when test="${not empty portalNoticeList}">      
      <c:forEach var="portal" items="${portalNoticeList }">
         <tr>
            <td>번호:${portal.board_num}</td>
            <td>제목:${portal.board_title}</td>
            <td>내용:${portal.board_cont}</td>
            <td>날짜:${portal.board_date}</td>
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
<h6>학교공지</h6>
<c:choose>
      <c:when test="${not empty schoolNoticeList}">      
      <c:forEach var="school" items="${schoolNoticeList }">
         <tr>
            <td>번호:${school.board_num}</td>
            <td>제목:${school.board_title}</td>
            <td>내용:${school.board_cont}</td>
            <td>날짜:${school.board_date}</td>
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
<h6>학과공지</h6>
<c:choose>
      <c:when test="${not empty departmentNoticeList}">      
      <c:forEach var="department" items="${departmentNoticeList }">
         <tr>
            <td>번호:${department.board_num}</td>
            <td>제목:${department.board_title}</td>
            <td>내용:${department.board_cont}</td>
            <td>날짜:${department.board_date}</td>
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
<h6>학사일정</h6>
<c:choose>
      <c:when test="${not empty schoolScheduleList}">      
      <c:forEach var="schoolSchedule" items="${schoolScheduleList }">
         <tr>
            <td>번호:${schoolSchedule.board_num}</td>
            <td>제목:${schoolSchedule.board_title}</td>
            <td>내용:${schoolSchedule.board_cont}</td>
            <td>날짜:${schoolSchedule.board_date}</td>
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


</body>
</html>