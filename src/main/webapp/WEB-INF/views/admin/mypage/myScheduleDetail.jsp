<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>개인일정</h1>
<div class="myScheduleDetail">
<c:set var="alertPerschd" value="${message}"/>
<c:set var="myContextPath" value="${pageContext.request.contextPath}"/>
<c:choose>
		<c:when test="${not empty perschd}">
				<form name="scheduleDetail" id="scheduleDetail">
					번호:<input type="text" name="perschd_num" value="${perschd.perschd_num}" readonly="readonly"/><br/>
					제목:<input type="text" name="perschd_title" value="${perschd.perschd_title}"/><br/>
					내용:<textarea rows="5" cols="10" name="perschd_cont" >${perschd.perschd_cont}</textarea><br/>
					작성자:<input type="text" name="perschd_writer" value="${perschd.perschd_writer}" readonly="readonly"/><br/>
					시작일:<input type="text" name="perschd_start_date" value="${perschd.perschd_start_date}">
					종료일 <input type="text" name="perschd_end_date" value="${perschd.perschd_end_date}"/><br/>
				<input type="button" id="scheduleMod" value="수정"/>
				<input type="button" id="scheduleDel" value="삭제"/>
				</form>
		</c:when>
	</c:choose>
</div>
</body>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#scheduleMod").click(function(){
			var formData = $("#scheduleDetail").serialize();
			
			$.ajax({
				type : "post",
				url :"${myContextPath}/admin/mypage/myScheduleUpdate",
				cache : false,
				data :  formData,
				success: onModSuccess()
			});
		});
	});
	function onModSuccess(){
		location.href="${myContextPath}/admin/mypage/mySchedule";
	}
	$(document).ready(function(){
		$("#scheduleDel").click(function(){
			var formData = $("#scheduleDetail").serialize();
				$.ajax({
					type : "post",
					url :"${myContextPath}/admin/mypage/myScheduleDelete",
					cache : false,
					data :  formData,
					success: onDelSuccess()
				});
		});
	});
	function onDelSuccess(){
		location.href="${myContextPath}/admin/mypage/mySchedule";
	}
</script>
</html>