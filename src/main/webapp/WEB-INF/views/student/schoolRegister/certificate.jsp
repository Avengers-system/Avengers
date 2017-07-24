<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- Counsel Content -->
<!-- Counsel Left Side -->
<%@include file="../common/certificateSide.jsp" %>
<!--  Counsel Right Side -->
<div class="col-md-10">
	<div class="panel panel-default">
		<div class="panel-heading" style="background-color: #2196F3;  margin-top: 10px;">
			<h4 style="color: #fff; font-weight: bold; font-size: 20px;">증명서</h4>
		</div>
		<div class="panel-body" style="height: 580px;">
			약관 관련한 설명 쓰고 테이블로 아래 3개 넣자.
			발급일자(오늘날짜) / 발급증명서 ( [학부]성적증명서 ) / 비고 (발급버튼)
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
 