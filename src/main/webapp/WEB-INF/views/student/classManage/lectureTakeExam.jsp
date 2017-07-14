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
<!--1.주관식 2.객관식 -->
<form>
	<c:forEach items="${eqList}" var="eq1" varStatus="status">
		시험문제고유번호 : ${eq1.getEq_num() }<br/>
		${eq1.getEq_qtna() }.
		${eq1.getEq_qtn() }<br/>
		<c:choose>
			<c:when test="${eq1.getEq_qtn_type() eq 1}">
				①${eq1.getEq_exmp_one() }<br/>
				②${eq1.getEq_exmp_two() }<br/>
				③${eq1.getEq_exmp_three() }<br/>
				④${eq1.getEq_exmp_four() }<br/><br/>
			</c:when>
			<c:otherwise>
				<textarea cols="100" rows="10"></textarea><br/><br/>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<button onclick="location.href='<%=request.getContextPath()%>/student/classManage/lectureTakeExam?exam_num=${exam.get('exam_num') }'">제출</button>
</form>
제출버튼을 누르면 학생답안 테이블에 학생의 정답정보를 저장해주어야됨
</body>
</html>