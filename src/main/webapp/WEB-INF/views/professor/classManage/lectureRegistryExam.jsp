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
		<div class="panel-heading" style="background-color: #666666;c margin-top: 10px;">
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
			<form name="exam" method="post" action="${pageContext.request.contextPath}/professor/classManage/registryExam" class="form-horizontal">
				<div class="form-group">
					<label class="control-label col-sm-1" for="exam_type">시험유형</label>
					<div class="col-sm-2">
						<select name="exam_type" class="form-control">
							<option value="1">중간고사</option>
							<option value="2">기말고사</option>
						</select>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-1" for="exam_date">시험일</label>
					<div class="col-sm-2">
						<input type="date" placeholder="시험일" class="form-control" name="exam_date" value="">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-1" for="startHour">시작시간</label>
					<div class="col-sm-3">
						<input type="text" name="startHour" class="form-control" style="width:50px;display:inline-block;text-align:center"/>시
						<input type="text" name="startMi" class="form-control" style="width:50px;display:inline-block;text-align:center"/>분
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-1" for="endHour">종료시간</label>
					<div class="col-sm-3">
						<input type="text" name="endHour" class="form-control" style="width:50px;display:inline-block;text-align:center"/>시
						<input type="text" name="endMi" class="form-control" style="width:50px;display:inline-block;text-align:center"/>분
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-1" for=""></label>
					<div class="col-sm-3">
						<input type="submit" class="btn btn-outline btn-primary" value="등록"/>
						<input type="button" class="btn btn-outline btn-primary" onclick="location.href='${pageContext.request.contextPath }/professor/classManage/lectureExam'" value="뒤로가기"/>
						
					</div>
				</div>
			</form>
		</div>
	</div>
</div>