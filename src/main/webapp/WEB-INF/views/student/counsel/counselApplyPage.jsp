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
상담페이지

<form action="${pageContext.request.contextPath}/student/counsel/counselApplyDetail">
<input type="text" name="cns_date" value="2017/07/01">

<input type="submit" value="달력클릭시">
</form>
</div>


