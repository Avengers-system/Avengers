<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<h1>mySchdule</h1>
<div class="mySchdule">
	<c:choose>
		<c:when test="${not empty perschdList}">
			<c:forEach var="perschd" items="${perschdList}">
				<tr>
					<td>번호:${perschd.perschd_num}</td>
					<td>제목:${perschd.perschd_title}</td>
					<td>내용:${perschd.perschd_cont}</td>
					<td>작성자:${perschd.perschd_writer}</td>
					<td>작성일:${perschd.perschd_date}</td>
					<td>시작일:${perschd.perschd_start_date}</td>
					<td>종료일:${perschd.perschd_end_date}</td>
				</tr>
				<br/>
			</c:forEach>
		</c:when>
		<c:otherwise>
			등록된 일정이 없습니다.
		</c:otherwise>
	</c:choose>
</div>
<br/>
</body>
</html>

