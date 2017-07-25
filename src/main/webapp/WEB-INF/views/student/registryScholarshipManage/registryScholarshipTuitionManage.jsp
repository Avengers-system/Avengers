<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>




<!--side Category-->
	<%@include file="../common/resSchSideCategory.jsp" %>
<div class="col-md-10">
	<div class="panel panel-default">
		<div class="panel-heading" style="background-color: #2196F3;  margin-top: 10px;">
			<h4 style="color: #fff; font-weight: bold; font-size: 20px;">성적증명서</h4>
		</div>
		<div class="panel-body" style="height: 580px; text-align: center;" >
			<iframe src="${pageContext.request.contextPath}/resources/upload/tuition.pdf" style="width:100%; height:100%; display: inline-block;" frameborder="0"></iframe>
		</div>
	</div>
</div>