<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<%@include file="../common/classManageLectureSideCategory.jsp"%>

<div class="col-md-10">
	<div class="panel panel-default">
		<div class="panel-heading" style="background-color: #666666; margin-top: 10px;">
			<h4 style="color: #fff; font-weight: bold; font-size: 20px;">시험등록</h4>
		</div>
		<div class="panel-body">
<!-- 	<fieldset style="width:800px;height:200px"> -->
<!-- 		<legend >주의사항</legend> -->
<!-- 		1.시험유형은 중간고사, 기말고사 두가지로 나뉩니다.<br/> -->
<!-- 		2.등록은 해당 강의에 대한 시험등록입니다.<br/> -->
<!-- 		3.시험일은 시험이 시작되는 날짜를 입력해줍니다.<br/> -->
<!-- 		4.시험의 시작시간과 종료시간은 숫자로만 이루어집니다.<br/> -->
<!-- 		5.시간은 00~24시, 분은 00~59분으로 입력이 가능합니다.<br/> -->
<!-- 	</fieldset> -->
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
				<input type="text" name="endMi" style="width:20px"/>분<br/>
				<input type="submit" value="등록"/>
				<input type="button" onclick="location.href='${pageContext.request.contextPath }/professor/classManage/lectureExam'" value="뒤로가기"/>
			</form>
		</div>
	</div>
</div>