<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Counsel Content -->
<!-- Counsel Left Side -->
<div class="col-md-2">
<a href="${pageContext.request.contextPath}/student/schoolRegister/certificate">증명서발급</a>
<a href="${pageContext.request.contextPath}/student/schoolRegister/leaveBackList">휴/복학 내역</a>
<a href="${pageContext.request.contextPath}/student/schoolRegister/leaveBackApplyPage">휴/복학 신청</a>
<a href="${pageContext.request.contextPath}/student/schoolRegister/dropOff">자퇴 신청</a>
</div>

<!--  Counsel Right Side -->
<div class="col-md-10">
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