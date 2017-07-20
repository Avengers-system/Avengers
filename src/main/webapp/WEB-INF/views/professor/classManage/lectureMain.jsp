<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/topCategory.jsp"%>

<!-- Content -->
<div class="col-md-2" id="commonLeftSide">
<%@include file="../common/classManageLectureSideCategory.jsp" %>
</div>

<button onclick="location.href='${pageContext.request.contextPath }/professor/classManage/lectureDetail'">상세페이지</button>
<button onclick="location.href='${pageContext.request.contextPath }/professor/classManage/lectureExam'">시험관리</button>
