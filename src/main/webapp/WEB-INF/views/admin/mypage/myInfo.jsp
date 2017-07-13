<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>mypage</h1>

<div class="mypage">
<c:choose>
	<c:when test="${not empty admin}">
		사진:${admin.admin_pic}<br/>
		아이디:${admin.admin_id}<br/>
		이름:${admin.admin_nm}<br/>
		생년월일:${admin.admin_bir}<br/>
		이메일:${admin.admin_email}<br/>
		전화번호:${admin.admin_tel}<br/>
		휴대폰번호:${admin.admin_hp}<br/>
		직급:${admin.admin_post}<br/>
		은행명:${admin.admin_bank}<br/>
	</c:when>
	<c:otherwise>
		등록된 개인정보가 없습니다.
	</c:otherwise>
</c:choose>
</div>
<br/>
</body>
</html>