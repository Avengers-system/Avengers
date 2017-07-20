<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Student Header -->
<%@include file="../common/topCategory.jsp" %>

<!-- Content -->
<div class="col-md-2" id="commonLeftSide">
<%@include file="../common/classManageLectureSideCategory.jsp" %>
</div>
<div class="col-md-10" id="commonRightSide">
	<button onclick="location.href='<%=request.getContextPath()%>/student/classManage/lectureDetail">강의계획서</button>
	<button onclick="location.href='<%=request.getContextPath()%>/student/classManage/lectureExam">시험</button>
	<button onclick="location.href='<%=request.getContextPath()%>/student/classManage/lectureAsgn">과제</button>
</div>