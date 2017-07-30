<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.core.Authentication" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<sec:authorize access="isAnonymous()">
<script>
window.onload=function(){
	document.form1.btn1.click();
}
</script>
	<form name="form1"  action="<c:url value='/loginForm'/>" method="post" >
		<input type="hidden" name="id" value="${username}">
		<input type="hidden" name="pwd" value="${password}">
		<input type="submit" value="" id="btn1" style="border:0; background-color: #2196F3;">
	</form>
</sec:authorize>


<sec:authorize access="hasRole('ROLE_ADMIN')" >
<script>location.href="${pageContext.request.contextPath}/admin/main/adminMain"</script>
</sec:authorize>
<sec:authorize access="hasRole('ROLE_PROF')">
<script>location.href="${pageContext.request.contextPath}/professor/main"</script>
</sec:authorize>
<sec:authorize access="hasAnyRole('ROLE_STUD,ROLE_WSS')">
<script>location.href="${pageContext.request.contextPath}/student/studentMain"</script>
</sec:authorize>
