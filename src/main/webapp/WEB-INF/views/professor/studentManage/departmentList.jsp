<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


학과생 목록


<c:forEach var="studentList" items="${departmentStudentList}">
	학번 : <a href="${pageContext.request.contextPath}/professor/studentManage/departmentDetail?stud_num=${studentList.stud_num}">${studentList.stud_num}</a>
	<br>
	
	이름 : ${studentList.stud_nm}<br>
	학년 : ${studentList.stud_grd}

</c:forEach>
