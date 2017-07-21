<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<style>
#commonUserHeader{
	margin: 0 auto;
}

#commonLoginInformation {
	/* 	padding-top: 5px; */
	text-align: right;
}
</style>

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
        alert('세션이 만료되었습니다');
        location.href="logout";
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
<!--  로그인시 보여주는 화면 -->
<sec:authorize access="isAuthenticated()">
<nav class="navbar navbar-default header bg-white " style=" height: 60px; margin:0; ">
          <div class="col-md-12 nav-wrapper" style="height: 60px; padding:0; ">
				<div class="col-md-2" style="width:50%;">
					<a href="${pageContext.request.contextPath}/main"><img
						class="logo" style="height: 60px; width: 130px;"
						src="${pageContext.request.contextPath}/resources/images/LOGO.png"></a>
	
				</div>
				<!-- Header -->
						<!--자동로그아웃-->
						<sec:authorize access="isAuthenticated()">									
									<div class="col-md-3" style="height: 60px;width:20%; padding:0; ">																	
									<span class="label label-danger" id="timer" style="display:inline-block; ;font-size:20px;height: 60px; width:100%; text-align:center; padding-top:20px; ">
									</span>
									</div>
								<div class="col-md-2" style="height: 60px;width:10% ; padding:0;">
                                   <button class="btn ripple btn-gradient btn-info" onclick="fncClearTime()">
                                    <div>
                                      <span>시간연장</span>
                                    </div>
                                  </button>
                                </div>	
								<div class="col-md-2" style="height: 60px;width:10% ; padding:0;">
                                   <button class="btn ripple btn-gradient btn-info" onclick="removeTimer()">
                                    <div>
                                      <span>타이머중단</span>
                                    </div>
                                  </button>
                                </div>	
								<div class="col-md-2" style="height: 60px;width:10%; padding:0;">
                                   <button class="btn ripple btn-gradient btn-info" onclick="location.href='${pageContext.request.contextPath}/logout'">
                                    <div>
                                      <span>로그아웃</span>
                                    </div>
                                  </button>
                                </div>	
						</sec:authorize>
					</div>
	</nav>
</sec:authorize>
<!-- 관리자 로그인시 보여주는 화면 -->
<sec:authorize access="hasAnyRole('ROLE_ADMIN')">

</sec:authorize>
<!-- 교수 로그인시 보여주는 화면 -->
<sec:authorize access="hasAnyRole('ROLE_PROF')">
<div class="col-xs-12" >
		<ul class="nav nav-tabs nav-tabs-v1 " style="padding-top: 0" id="commonUserHeader">
			<li role="presentation"><a href="${pageContext.request.contextPath}/professor/main">Main</a></li>
			<li role="presentation"><a href="#">My Page</a></li>
			<li role="presentation"><a href="#">수업관리</a></li>
			<li role="presentation"><a href="${pageContext.request.contextPath}/professor/studentManage/departmentList">학생관리</a></li>
			<li role="presentation"><a href="${pageContext.request.contextPath}/professor/counsel/counselList">상담</a></li>
			<li role="presentation"><a href="#">Help Desk</a></li>
		</ul>
</div>
</sec:authorize>
<!-- 학생 로그인시 보여주는 화면 -->
<sec:authorize access="hasAnyRole('ROLE_STUD')">
<nav class="navbar navbar-default header bg-dark-blue-grey " style="width:100%; ">
          <div class="col-md-12 nav-wrapper" style="width:100%; ">
		<div class="navbar-header" style="width:100%; ">
<div class="col-md-10" id="commonUserHeader">
	<ul class="nav nav-tabs nav-tabs-v1 " style="padding-top: 0" >
		<li role="presentation"><a href="#">My Page</a></li>
		<li role="presentation"><a href="${pageContext.request.contextPath}/student/schoolRegister/certificate">학적</a></li>
		<li role="presentation"><a href="${pageContext.request.contextPath}/student/classManage/classMain">수업</a></li>
		<li role="presentation"><a href="${pageContext.request.contextPath}/student/admissionApplication">수강신청</a></li>
		<li role="presentation"><a href="${pageContext.request.contextPath}/student/resSchManage/studRes">등록&장학</a></li>
		<li role="presentation"><a href="${pageContext.request.contextPath}/student/counsel/counselList">상담</a></li>
		<li role="presentation"><a href="${pageContext.request.contextPath}/student/helpDesk/studentFAQList">Help Desk</a></li>
	</ul>
</div>


		</div>
	</div>
</nav>

</sec:authorize>
