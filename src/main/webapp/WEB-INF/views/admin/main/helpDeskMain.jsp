<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- Admin Header -->
<%-- <%@include file="../common/topCategory.jsp"%> --%>

<!-- Content -->
<div class="col-md-2" id="commonLeftSide">
   <!-- 테스트용 사이드 -->
<%-- <%@include file="../helpDesk/helpDesk_leftSide.jsp" %>    --%>
</div>
<div class="col-md-10" id="commonRightSide">
 
 
헬프데스크메인<br><hr color="orange">
<button onclick="location.href='<%=request.getContextPath()%>/admin/univNoticeList'">학교공지</button>
<button onclick="location.href='<%=request.getContextPath()%>/admin/deptNoticeList'">학과공지</button>
<button onclick="location.href='<%=request.getContextPath()%>/admin/collegeNoticeList'">학사일정</button>
<button onclick="location.href='<%=request.getContextPath()%>/admin/portalNoticeList'">포털소식</button>
<button onclick="location.href='<%=request.getContextPath()%>/admin/faqNoticeList'">FAQ</button>
<button onclick="location.href='<%=request.getContextPath()%>/admin/qnaNoticeList'">Q&A</button>

<br/>

