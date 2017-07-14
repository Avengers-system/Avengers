<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<button onclick="location.href='<%=request.getContextPath()%>/student/classManage/lectureDetail?lct_num=${lct_num}'">강의계획서</button>
<button onclick="location.href='<%=request.getContextPath()%>/student/classManage/lectureExam?lct_num=${lct_num}'">시험</button>
</body>
</html>