<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>수업관리</title>
</head>
<body>
<h1>수업관리화면</h1>


<%-- <button onclick="location.href='<%=request.getContextPath()%>/student/classManage/lecture'">강의목록</button> --%>
	<c:forEach items="${classList}" var="classList" varStatus="status">
		번호 : ${status.count }<br/>
		강의번호 : ${classList.get("lct_num")}<br/>
		강의명 : ${classList.get("lct_nm") }<br/>
		분반 : ${classList.get("lct_nm_class") }<br/>
		교수명 : ${classList.get("prfs_nm") }<br/>
		강의요일 : ${classList.get("lr_date") }<br/>
		강의실 : ${classList.get("lr_lrc") }<br/>
		<button onclick="location.href='<%=request.getContextPath()%>/student/classManage/lectureMain?lct_num=${classList.get('lct_num')}'">상세페이지</button>
		<hr/>
	</c:forEach>

</body>
</html>