<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--side Category-->
<%@include file="../common/classManageLectureSideCategory.jsp" %>
<div class="col-md-10">
	<div class="panel panel-default">
		<div class="panel-heading" style="background-color: #2196F3;  margin-top: 10px;">
			<h4 style="color: #fff; font-weight: bold; font-size: 20px;">Main</h4>
		</div>
		<div class="panel-body" style="height: 580px; text-align: center;" >
			<button onclick="location.href='<%=request.getContextPath()%>/student/classManage/lectureDetail">강의계획서</button>
			<button onclick="location.href='<%=request.getContextPath()%>/student/classManage/lectureExam">시험</button>
			<button onclick="location.href='<%=request.getContextPath()%>/student/classManage/lectureAsgn">과제</button>
		</div>
	</div>
</div>
