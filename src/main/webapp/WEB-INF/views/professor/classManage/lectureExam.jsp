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
	<c:choose>
		<c:when test="${prfsExamList eq null}">
			시험이 존재하지 않습니다.
		</c:when>
		<c:otherwise>
			<c:forEach items="${prfsExamList}" var="prfsExam" varStatus="status">
				시험번호 : ${prfsExam.get("exam_num") }<br/>
				년도 : ${prfsExam.get("lct_yr") }<br/>
				학기 : ${prfsExam.get("lct_qtr") }<br/>
				강의명 : ${prfsExam.get("lct_nm") }<br/>
				분반 : ${prfsExam.get("lct_nm_class") }<br/>
				유형 : ${prfsExam.get("exam_type") }<br/>
				시험일 : ${prfsExam.get("exam_date") }<br/>
				시험시간 : ${prfsExam.get("exam_start_date") } ~ ${prfsExam.get("exam_end_date") }<br/>
				<button onclick="location.href='${pageContext.request.contextPath}/professor/classManage/lectureExamQn?exam_num='${prfsExam.get('exam_num')}">시험문제보러가기</button>
				<hr color="red"/>
			</c:forEach>
		</c:otherwise>
	</c:choose>
	<button onclick="location.href='${pageContext.request.contextPath }/professor/classManage/lectureRegistryExam'">시험등록</button>
</body>
</html>