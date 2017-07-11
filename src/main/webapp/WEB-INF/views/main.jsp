<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="org.springframework.security.core.userdetails.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<%
		User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	%>
	<%=user.getUsername() %>님 환영....<br>
	<a href="<c:url value='/logout'/>">로그아웃</a>
	<sec:authorize access="hasAuthority('ROLE_ADMIN')">	
	admin<br>
	<form action="member/list" method="post">
		<button>memberList</button>
	</form>
		
	</sec:authorize>
	
	<form action="member/list" method="post">
		<button>memberList</button>
	</form>
	


</body>
</html>