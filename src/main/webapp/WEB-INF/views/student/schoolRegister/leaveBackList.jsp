<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!-- 휴복학내역 -->
 <!-- Counsel Content -->
<!-- Counsel Left Side -->
<%@include file="../common/certificateSide.jsp" %>
<!--  Counsel Right Side -->
<div class="col-md-10">
	<div class="panel panel-default">
		<div class="panel-heading" style="background-color: #2196F3;  margin-top: 10px;">
			<h4 style="color: #fff; font-weight: bold; font-size: 20px;">휴/복학 내역</h4>
		</div>
		<div class="panel-body" style="height: 580px; text-align: center;" >
			
휴복학리스트
휴학 내역
<c:forEach var="leaveList" items="${leaveList}">
	휴학 시작일 : ${leaveList.loa_start_date}
	휴학사유 : ${leaveList.loa_cause}
</c:forEach>
<c:forEach var="backList" items="${backList}">
	복학 일 : ${backList.rts_date}
	복학사유? : ${backList.rts_cause}
</c:forEach>

		</div>
	</div>
</div>





