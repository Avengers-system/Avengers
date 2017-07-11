<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>권한 없음</title>
</head>
<body>
요청한 페이지에 접근 권한이 없습니다.
<br/>
<a href="<c:url value='/main'/>">메인화면으로</a>
</body>
</html>  