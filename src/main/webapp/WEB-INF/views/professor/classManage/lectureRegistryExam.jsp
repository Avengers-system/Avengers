<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<script>
$(function() {
  $( "#datepicker" ).datepicker({
    dateFormat: 'yy-mm-dd',
    prevText: '이전 달',
    nextText: '다음 달',
    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
    dayNames: ['일','월','화','수','목','금','토'],
    dayNamesShort: ['일','월','화','수','목','금','토'],
    dayNamesMin: ['일','월','화','수','목','금','토'],
    showMonthAfterYear: true,
    changeMonth: true,
    changeYear: true,
    yearSuffix: '년'
  });
});
</script>
</head>
<body>
	시험등록화면<br/>
	<form name="exam" method="post" action="${pageContext.request.contextPath}/professor/classManage/registryExam">
		시험유형 : <select name="exam_type">
					<option value="1">중간고사</option>
					<option value="2">기말고사</option>
				</select>
				<br/>
		시험일  : <input type="text" name="exam_date" id="datepicker"/><br/>
		시험시작시간<br/> 
		<input type="text" name="startHour" style="width:20px"/>시:
		<input type="text" name="startMi" style="width:20px"/>분
		<br/>
		시험종료시간
		<br/> 
		<input type="text" name="endHour" style="width:20px"/>시:
		<input type="text" name="endMi" style="width:20px"/>분
		<input type="submit" value="등록"/>
		<button onclick="location.href='${pageContext.request.contextPath }/professor/classManage/lectureExam'">뒤로가기</button>
	</form>
</body>
</html>