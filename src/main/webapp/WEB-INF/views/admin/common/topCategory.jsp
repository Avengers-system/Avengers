<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div class="col-md-12" id="commonUserHeader">    
		<button onclick="location.href='<%=request.getContextPath()%>/admin/main/adminMain'">관리자</button>
		<button onclick="location.href='${pageContext.request.contextPath}/professor/main'">교수</button>
		<button onclick="location.href='<%=request.getContextPath()%>/student/studentMain'">학생</button>
		<button onclick="location.href='<%=request.getContextPath()%>/admin/main/helpDeskMain'">helpDesk</button>
</div>