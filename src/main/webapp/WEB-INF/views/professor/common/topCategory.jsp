<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
#commonUserHeader{
	text-align: center;
}

</style>

<div class="col-md-12" id="commonUserHeader">
	<ul class="nav nav-tabs" >
		<li role="presentation"><a href="#">Main</a></li>
		<li role="presentation"><a href="#">My Page</a></li>
		<li role="presentation"><a href="${pageContext.request.contextPath}/professor/schoolRegister/certificate">학적</a></li>
		<li role="presentation"><a href="${pageContext.request.contextPath}/professor/classManage/classMain">수업</a></li>
		<li role="presentation"><a href="${pageContext.request.contextPath}/professor/admissionApplication">수강신청</a></li>
		<li role="presentation"><a href="#">등록&장학</a></li>
		<li role="presentation"  class="active"	><a href="${pageContext.request.contextPath}/professor/counsel/counselList">상담</a></li>
		<li role="presentation"><a href="${pageContext.request.contextPath}/professor/helpDesk/studentFAQList">Help Desk</a></li>
	</ul>
</div>

		