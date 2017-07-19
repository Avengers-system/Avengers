<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="col-md-12" id="commonUserHeader">
	<ul class="nav nav-tabs">
		<li role="presentation" class="active"><a href="#">Main</a></li>
		<li role="presentation"><a href="#">My Page</a></li>
		<li role="presentation"><a href="#">수업</a></li>
		<li role="presentation"><a href="${pageContext.request.contextPath}/professor/studentManage/departmentList">학생</a></li>
		<li role="presentation"><a href="${pageContext.request.contextPath}/professor/counsel/counselList">상담</a></li>
		<li role="presentation"><a href="#">Help Desk</a></li>
	</ul>
</div>