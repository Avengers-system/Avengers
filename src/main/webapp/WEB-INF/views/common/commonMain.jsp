<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>


공통 메인


<button onclick="location.href='${pageContext.request.contextPath}/admin/main/adminMain'">관리자</button>
<button onclick="location.href='${pageContext.request.contextPath}/professor/main'">교수</button>
 
 

<button onclick="location.href='${pageContext.request.contextPath}/student/studentMain'">학생</button>
<button onclick="location.href='${pageContext.request.contextPath}/logout'">로그아웃</button>

