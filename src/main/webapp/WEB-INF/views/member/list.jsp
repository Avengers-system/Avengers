<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Member List</title>
</head>
<body>
	<c:forEach items="${memberList }" var="member">
		${member.id } ------------ ${member.pwd } <br>
	</c:forEach>
	
	
	<sec:authorize access="hasAuthority('ROLE_ADMIN')">	
	admin<br>
	<form action="member/list" method="post">
		<button>memberList</button>
	</form>
		
	</sec:authorize>
	
</body>
</html>