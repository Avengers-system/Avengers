<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!-- Counsel Content -->
<!-- Counsel Left Side -->
<div class="col-md-2">
<a href="${pageContext.request.contextPath}/student/counsel/counselList">상담목록</a>
<a href="${pageContext.request.contextPath}/student/counsel/counselApplyPage">상담신청</a>
</div>

<!--  Counsel Right Side -->
<div class="col-md-10">
<from action="${pageContext.request.contextPath}/student/counsel/counselApply">

<select name="cns_prfs">
<c:forEach var="cnsList" items="${cnsList}">
<option>${cnsList.cns_prfs}</option>
</c:forEach> 
</select>

<input type="submit" value="신청">
</from>
</div>


