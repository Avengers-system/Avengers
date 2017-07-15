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
<c:choose>
		<c:when test="${not empty perschd}">
				<form name="scheduleMod">
					번호:<input type="text" name="perschd_num" value="${perschd.perschd_num}"/><br/>
					제목:<input type="text" name="perschd_title" value="${perschd.perschd_title}"/><br/>
					내용:<textarea rows="5" cols="10" name="perschd_cont"></textarea><br/>
					작성자:<input type="text" name="perschd_writer" value="${perschd.perschd_writer}"/><br/>
					시작일:<input type="text" name="perschd_start_date" value="${perschd.perschd_start_date}">
					종료일 <input type="text" name="perschd_end_date" value="${perschd.perschd_end_date}"/><br/>
				<input type="button" onclick="scheduleMod_go()" value="수정"/>
				<input type="button" onclick="scheduleDel_go()" value="삭제"/>
				</form>
		</c:when>
	</c:choose>
</div>
</body>
<script type="text/javascript">
function scheduleMod_go(){
	var mySchedule = document.scheduleMod;
	mySchedule.method="post"
	mySchedule.action="/admin/mypage/myScheduleUpdate"
	mySchedule.submit();
}
function scheduleDel_go(){
	
}
</script>
</html>