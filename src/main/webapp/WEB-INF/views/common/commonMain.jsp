<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.core.Authentication" %>



<sec:authorize access="hasRole('ROLE_ADMIN')" >
<script>location.href="${pageContext.request.contextPath}/admin/main/adminMain"</script>
</sec:authorize>
<sec:authorize access="hasRole('ROLE_PROF')">
<script>location.href="${pageContext.request.contextPath}/professor/main"</script>
</sec:authorize>
<sec:authorize access="hasAnyRole('ROLE_STUD,ROLE_WSS')">
<script>location.href="${pageContext.request.contextPath}/student/studentMain"</script>
</sec:authorize>
