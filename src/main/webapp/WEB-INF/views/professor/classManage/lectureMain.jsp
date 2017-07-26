<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="col-md-2" id="commonLeftSide">
	<%@include file="../common/classManageLectureSideCategory.jsp"%>
</div>

<div class="col-md-10">
	<div class="panel panel-default">
		<div class="panel-heading"
			style="background-color: #666666; margin-top: 10px;">
			<h4 style="color: #fff; font-weight: bold; font-size: 20px;">과제상세페이지</h4>
		</div>
		<div class="panel-body">
			<button onclick="location.href='${pageContext.request.contextPath }/professor/classManage/lectureDetail'">상세페이지</button>
			<button onclick="location.href='${pageContext.request.contextPath }/professor/classManage/lectureExam'">시험관리</button>
		</div>
	</div>
</div>