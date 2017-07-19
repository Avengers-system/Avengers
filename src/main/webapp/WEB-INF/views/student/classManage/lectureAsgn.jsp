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
	<c:forEach items="${asgnList}" var="asgn" varStatus="status">
		status = ${status.count }<br/>
		과제번호 : ${asgn.get("asgn_num") }<br/>
		과목명 : ${asgn.get("lct_nm") }<br/>
		분반 : ${asgn.get("lct_nm_class") }<br/>
		과제명 : ${asgn.get("asgn_nm")}<br/>
		제출시작일 : ${asgn.get("asgn_start_date") }<br/>
		제출마감일 : ${asgn.get("asgn_dl_date") }<br/>
		제출여부 : ${asgn.get("sub_check") }<br/>
		<button onclick="location.href='<%=request.getContextPath()%>/student/classManage/lectureAsgnDetail?asgn_num=${asgn.get('asgn_num') }'">상세페이지</button>
	</c:forEach>
</body>
</html>