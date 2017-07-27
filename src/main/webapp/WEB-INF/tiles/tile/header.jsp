<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>


<script>

var iSecond ; //초단위로 환산
var timerchecker = null;
window.onload = function() {
	fncClearTime();
	initTimer();	
}

function fncClearTime() {	
	iSecond = 60*10
}

Lpad = function(str, len) {
	str = str + "";
	while (str.length < len) {
		str = "0" + str;
	}
	return str;
}

initTimer = function() {
	var timer = document.getElementById("timer");
	rHour = parseInt(iSecond / 3600);

	rMinute = parseInt(iSecond%3600/60);

	rSecond = parseInt(iSecond%3600%60); 	
 	
	if (iSecond > 0) {
		timer.innerHTML = "남은시간 :"+rMinute+"분"+rSecond+"초";
		iSecond--;
		timerchecker = setTimeout("initTimer()", 1000); // 1초 간격으로 체크
	} 
	else if(iSecond == 0){
        location.href="${pageContext.request.contextPath}/logout";
     } 
	
	else {
		logoutUser();
	}
}
function removeTimer(){
	clearInterval(timerchecker);
}
function refreshTimer() {
	var xhr = initAjax();
	xhr.open("POST", "/jsp_std/kor/util/window_reload2.jsp", false);
	xhr.send();
	fncClearTime();
}

function logoutUser() {
	clearTimeout(timerchecker);
	var xhr = initAjax();
	xhr.open("POST", "location.href='${pageContext.request.contextPath}/logout'", false);
	xhr.send();
	location.reload();
}

function initAjax() { // 브라우저에 따른 AjaxObject 인스턴스 분기 처리
	var xmlhttp;
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	return xmlhttp;
}

</script>

<!-- 비로그인시 보여주는 화면 -->
<sec:authorize access="isAnonymous()">
</sec:authorize>






<!-- 관리자 로그인시 보여주는 화면 -->
<sec:authorize access="hasAnyRole('ROLE_ADMIN')">
<nav class="navbar navbar-default header bg-white "	style="height: 100px; margin: 0;">
		<div class="col-md-12 nav-wrapper">
			<div class="col-md-2">
				<a href="${pageContext.request.contextPath}/main" style="color: #CC0000;">
				<b style="font-size: 80px; color: #CC0000;">A</b>&nbsp;&nbsp;UNIVERSITY</a>
			</div>
			<!-- Header -->
			<!--자동로그아웃-->
				
				<div class="col-md-10" style="margin-top: 30px; text-align: right;">
				<span class="label label-danger" id="timer"
					style="display: inline-block; font-size: 15px; height: 42px; text-align: center; padding-top: 11px;"></span>
					<button class="btn btn-outline btn-primary"  onclick="fncClearTime()">
						<div>
							<span>시간연장</span>
						</div>
					</button>
					<button class=" btn btn-outline btn-primary"
						onclick="removeTimer()">
						<div>
							<span>타이머중단</span>
						</div>
					</button>
					<button class="btn btn-outline btn-primary"
						onclick="location.href='${pageContext.request.contextPath}/logout'">
						<div>
							<span>로그아웃</span>
						</div>
					</button>
				</div>
		</div>
	</nav>

	<nav class="navbar navbar-default header bg-blue" style="height: 100%;  margin-top: 17px;">
		<div class="col-xs-12 nav-wrapper" style="background-color: #CC0000;">
			<div class="navbar-header">
				<ul class="nav nav-tabs nav-tabs-v1">
					<li role="presentation"><a href="${pageContext.request.contextPath}/admin/main/adminMain">Main</a></li>
					<li role="presentation"><a href="${pageContext.request.contextPath}/admin/mypage/">My Page</a></li>
					<li role="presentation"><a href="${pageContext.request.contextPath}/admin/professorManage">교수관리</a></li>
					<li role="presentation"><a href="${pageContext.request.contextPath}/admin/studentManage">학생관리</a></li>
					<li role="presentation"><a href="#">강의관리</a></li>
					<li role="presentation"><a href="${pageContext.request.contextPath}/admin/univSchd/univSchdedule">Help Desk</a></li>
				</ul>
			</div>
		</div>
	</nav>
</sec:authorize>



<!-- 교수 로그인시 보여주는 화면 -->
<sec:authorize access="hasAnyRole('ROLE_PROF')">

<nav class="navbar navbar-default header bg-white "	style="height: 100px; margin: 0;">
		<div class="col-md-12 nav-wrapper">
			<div class="col-md-2">
				<a href="${pageContext.request.contextPath}/main" style="color: #666666;">
				<b style="font-size: 80px; color: #666666;">A</b>&nbsp;&nbsp;UNIVERSITY</a>
			</div>
			<!-- Header -->
			<!--자동로그아웃-->
				
				<div class="col-md-10" style="margin-top: 30px; text-align: right;">
				<span class="label label-danger" id="timer"
					style="display: inline-block; font-size: 15px; height: 42px; text-align: center; padding-top: 11px;"></span>
					<button class="btn btn-outline btn-primary"  onclick="fncClearTime()">
						<div>
							<span>시간연장</span>
						</div>
					</button>
					<button class=" btn btn-outline btn-primary"
						onclick="removeTimer()">
						<div>
							<span>타이머중단</span>
						</div>
					</button>
					<button class="btn btn-outline btn-primary"
						onclick="location.href='${pageContext.request.contextPath}/logout'">
						<div>
							<span>로그아웃</span>
						</div>
					</button>
				</div>
		</div>
	</nav>
	<nav class="navbar navbar-default header bg-blue" style="height: 100%;  margin-top: 17px;">
		<div class="col-xs-12 nav-wrapper" style=" background-color: #666666;">
			<div class="navbar-header">
				<ul class="nav nav-tabs nav-tabs-v1">
					<li role="presentation"><a href="${pageContext.request.contextPath}/professor/main">Main</a></li>
					<li role="presentation"><a href="${pageContext.request.contextPath}/professor/mypage/myInfo">My Page</a></li>
					<li role="presentation"><a href="${pageContext.request.contextPath}/professor/classManage/classMain">수업관리</a></li>
					<li role="presentation"><a href="${pageContext.request.contextPath}/professor/studentManage/departmentList">학생관리</a></li>
					<li role="presentation"><a href="${pageContext.request.contextPath}/professor/counsel/counselList">상담</a></li>
					<li role="presentation"><a href="${pageContext.request.contextPath}/professor/helpDesk/univSchd/univSchdedule">Help Desk</a></li>
				</ul>
			</div>
		</div>
	</nav>
</sec:authorize>



<!-- 학생 로그인시 보여주는 화면 -->
<sec:authorize access="hasAnyRole('ROLE_STUD')">

<nav class="navbar navbar-default header bg-white "	style="height: 100px; margin: 0;">
		<div class="col-md-12 nav-wrapper">
			<div class="col-md-2">
				<a href="${pageContext.request.contextPath}/main">
				<b style="font-size: 80px;">A</b>&nbsp;&nbsp;UNIVERSITY</a>
			</div>
			<!-- Header -->
			<!--자동로그아웃-->
				
				<div class="col-md-10" style="margin-top: 30px; text-align: right;">
				<span class="label label-danger" id="timer"
					style="display: inline-block; font-size: 15px; height: 42px; text-align: center; padding-top: 11px;"></span>
					<button class="btn btn-outline btn-primary"  onclick="fncClearTime()">
						<div>
							<span>시간연장</span>
						</div>
					</button>
					<button class=" btn btn-outline btn-primary"
						onclick="removeTimer()">
						<div>
							<span>타이머중단</span>
						</div>
					</button>
					<button class="btn btn-outline btn-primary"
						onclick="location.href='${pageContext.request.contextPath}/logout'">
						<div>
							<span>로그아웃</span>
						</div>
					</button>
				</div>
		</div>
	</nav>
	<nav class="navbar navbar-default header bg-blue" style="height: 100%; margin-top: 17px;">
		<div class="col-xs-12 nav-wrapper">
			<div class="navbar-header">
				<ul class="nav nav-tabs nav-tabs-v1">
					<li role="presentation"><a href="${pageContext.request.contextPath}/student/studentMain">Main</a></li>
					<li role="presentation"><a href="${pageContext.request.contextPath}/student/mypage/myInfo">My Page</a></li>
					<li role="presentation"><a href="${pageContext.request.contextPath}/student/schoolRegister/certificate">학적</a></li>
					<li role="presentation"><a href="${pageContext.request.contextPath}/student/classManage/classMain">수업</a></li>
					<li role="presentation"><a href="${pageContext.request.contextPath}/student/admissionApplication">수강신청</a></li>
					<li role="presentation"><a href="${pageContext.request.contextPath}/student/studRes">등록&장학</a></li>
					<li role="presentation"><a href="${pageContext.request.contextPath}/student/counsel/counselList">상담</a></li>
					<li role="presentation"><a href="${pageContext.request.contextPath}/student/helpDesk/univSchd/univSchdedule">Help Desk</a></li>
				</ul>
			</div>
		</div>
	</nav>
</sec:authorize>
