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
	교수 수업관리
	<c:forEach items="${prfsLctList }" var="prfsLct" varStatus="status">
		<br/>
		강의번호 : ${prfsLct.get("lct_num") }<br/>
		년도 : ${ prfsLct.get("lct_yr")}<br/>
		학기 : ${ prfsLct.get("lct_qtr")}<br/>
		강의명 : ${ prfsLct.get("lct_nm")}<br/>
		분반 : ${ prfsLct.get("lct_nm_class")}<br/>
		강의시간 : ${ prfsLct.get("lr_date")}<br/>
		강의실 : ${ prfsLct.get("lr_lrc")}
		<button onclick="location.href='${pageContext.request.contextPath }/professor/classManage/lectureMain?lct_num=${prfsLct.get('lct_num')}'">강의홈이동</button>
	</c:forEach>
</body>
</html>