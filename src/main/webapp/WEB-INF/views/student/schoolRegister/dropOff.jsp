<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!-- 자퇴신청 -->
 <!-- Counsel Content -->
<!-- Counsel Left Side -->
<%@include file="../common/certificateSide.jsp" %>
<!--  Counsel Right Side -->
<div class="col-md-10">
	<div class="panel panel-default">
		<div class="panel-heading" style="background-color: #2196F3;  margin-top: 10px;">
			<h4 style="color: #fff; font-weight: bold; font-size: 20px;">자퇴 신청</h4>
		</div>
		<div class="panel-body" style="height: 580px; text-align: center;" >
			<c:forEach var="dropList" items="${dropOffList}">
	자퇴번호 ${dropList.ls_num}<br>	

</c:forEach>
<p>자퇴신청</p>
<form action="${pageContext.request.contextPath}/student/schoolRegister/dropOffApply">
		<input type="text" name="ls_num" placeholder="자퇴고유번호">
		<input type="text" name="ls_appl_date" placeholder="자퇴신청일">
		<input type="text" name="ls_appr_date" placeholder="관리자승인일">
		<input type="text" name="ls_appr_check" placeholder="관리자승인여부">
		<input type="text" name="ls_ftf_cont" placeholder="면담내용">
		<input type="text" name="ls_admin" placeholder="관리자아이디">
		<input type="submit" value="자퇴신청">
	</form>
			


		</div>
	</div>
</div>



