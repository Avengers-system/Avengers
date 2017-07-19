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
<sec:authorize access="hasRole('ROLE_STUD')">
<script>location.href="${pageContext.request.contextPath}/student/studentMain"</script>
</sec:authorize>

<button onclick="location.href='${pageContext.request.contextPath}/admin/main/adminMain'">관리자</button>
<button onclick="location.href='${pageContext.request.contextPath}/professor/main'">교수</button>
 
 

<button onclick="location.href='${pageContext.request.contextPath}/student/studentMain'">학생</button>
<button onclick="location.href='${pageContext.request.contextPath}/logout'">로그아웃</button>

