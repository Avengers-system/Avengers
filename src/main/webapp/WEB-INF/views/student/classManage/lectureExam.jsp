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
	<c:forEach items="${examList }" var="exam" varStatus="status">
		과목명 : ${exam.get("sjt_nm") }<br/>
		분반 : ${exam.get("lct_nm") }<br/>
		시험유형 : ${exam.get("exam_type") }<br/>
		시험일 : ${exam.get("exam_date") }<br/>
		시작시간 : ${exam.get("exam_start_date") }<br/>
		종료시간 : ${exam.get("exam_end_date") }<br/>
		응시여부 : ${exam.get("te_check") }<br/>
		응시고유번호 : ${exam.get("te_num") }<br/>
		시험고유번호 : ${exam.get("exam_num") }<br/>
		<button onclick="location.href='<%=request.getContextPath()%>/student/classManage/lectureTakeExam?exam_num=${exam.get('exam_num') }'">응시</button>
	</c:forEach>
</body>
</html>