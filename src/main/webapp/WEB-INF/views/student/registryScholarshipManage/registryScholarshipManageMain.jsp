<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<c:set var="myContextPath" value="${pageContext.request.contextPath}"/>
<body>
<h1>등록/장학금관리</h1>
<h3>장학이력/신청조회</h3>
<div class="resScholMain">
	<input type="button" value="장학이력/신청조회" onclick="location.href='${pageContext.request.contextPath}/student/registryScholarshipManage'"/> 
	<input type="button" value="장학금신청" onclick="location.href='${pageContext.request.contextPath}/student/admissionApplication'"/> 	
	<input type="button" value="등록금이력조회" onclick="location.href='${pageContext.request.contextPath}/student/admissionApplication'"/> 
	<input type="button" value="등록금관리" onclick="location.href='${pageContext.request.contextPath}/student/admissionApplication'"/> 	
	<input type="button" value="logout" onclick="logout_go()"/><br/>
</div>
년도:<input type="text" name="">


</body>
<script type="text/javascript">
	function logout_go(){
		location.href="${myContextPath}/common/logout";
	}
</script>
</html>