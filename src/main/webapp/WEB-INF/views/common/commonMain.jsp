<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
공통 메인

<button onclick="location.href='<%=request.getContextPath()%>/admin/adminMain'">관리자</button>
<button onclick="location.href='${pageContext.request.contextPath}/professor/main'">교수</button>
<button onclick="location.href='<%=request.getContextPath()%>/student/studentMain'">학생</button>
<button onclick="location.href='<%=request.getContextPath()%>/common/logout'">로그아웃</button>

</body>
</html>