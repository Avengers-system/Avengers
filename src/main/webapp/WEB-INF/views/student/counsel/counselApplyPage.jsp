<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 상담 목록 -->

<!-- Counsel Content -->
<!-- Counsel Left Side -->
<%@include file="../common/counselSide.jsp" %>
<!-- 상담신청페이지 -->
<!--  Counsel Right Side -->
<div class="col-md-10">
	<div class="panel panel-default">
		<div class="panel-heading" style="background-color: #2196F3;  margin-top: 10px;">
			<h4 style="color: #fff; font-weight: bold; font-size: 20px;">상담 신청</h4>
		</div>
		<div class="panel-body" style="height: 580px; text-align: center;" >

<form action="${pageContext.request.contextPath}/student/counsel/counselApplyDetail">
<input type="text" name="cns_date" value="2017/07/01">

<input type="submit" value="달력클릭시">
</form>



		</div>
	</div>
</div>






