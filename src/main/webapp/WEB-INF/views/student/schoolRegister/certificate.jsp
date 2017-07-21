<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- Counsel Content -->
<!-- Counsel Left Side -->
<div class="col-md-2">
	<a href="${pageContext.request.contextPath}/student/schoolRegister/certificate">증명서발급</a><br>
	<a href="${pageContext.request.contextPath}/student/schoolRegister/leaveBackList">휴/복학 내역</a><br>
	<a href="${pageContext.request.contextPath}/student/schoolRegister/leaveBackApplyPage">휴/복학 신청</a><br>
	<a href="${pageContext.request.contextPath}/student/schoolRegister/dropOff">자퇴 신청</a>
</div>

<!--  Counsel Right Side -->
<div class="col-md-10">
	<div class="panel panel-default">
		<div class="panel-heading">
			<h4>증명서</h4>
		</div>
		<div class="panel-body">
			<form action="${pageContext.request.contextPath}/student/schoolRegister/gradeCertificate">
				성적증명서<input type="submit" value="발급">
			</form>
			<form action="${pageContext.request.contextPath}/student/schoolRegister/enrollmentCertificate">
				재학증명서<input type="submit" value="발급">
			</form>
			<form action="${pageContext.request.contextPath}/student/schoolRegister/graduatedCertificate">
				졸업증명서<input type="submit" value="발급">
			</form>
		</div>
	</div>
</div>
 