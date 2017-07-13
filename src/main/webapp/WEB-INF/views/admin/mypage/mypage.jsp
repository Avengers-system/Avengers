<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:set var="myContextPath" value="${pageContext.request.contextPath}"/>
<h1>mypage</h1>
<button onclick="myInfo_go()">개인정보</button><br/>
<button onclick="mySchedule_go()">개인일정관리</button><br/>
</body>
<script type="text/javascript">
function myInfo_go(){
	location.href="${myContextPath}/admin/mypage/myInfo";
}
function mySchedule_go(){
	location.href="${myContextPath}/admin/mypage/mySchedule";
}
</script>
</html>