<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib  prefix="sec" uri="http://www.springframework.org/security/tags"%>
<style>
	#commonLoginInformation{
		padding-top: 5px;
		text-align: right;
	}
</style>

<div class="col-md-7">
	<img src="http://placehold.it/180x60" />
</div>
<div class="col-md-4">
	<!--자동로그아웃-->
	<sec:authorize access="isAuthenticated()">
		<div id="commonLoginInformation">
			<input  class="btn btn-lg btn-danger" type="button" onclick="logout();" style="text-align: right;" value="로그아웃"/>
		</div>
	</sec:authorize>
</div>
<div class="col-md-1"></div>
<script>
 function logout(){
	 location.href="${pageContext.request.contextPath}/logout";
 }
</script>

<title>AVENGERS 학사관리 시스템</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="assets/css/main.css" />
<!-- Header -->
<div id="header-wrapper">
	<header id="header" class="">
		<div class="row">

			<div class="logout">
				남은 시간 : 00 분 00초 
				<input type="button" value="연장"	class="btn btn-info" id="button1" /> 
				<input type="button" value="로그아웃" onclick="location.href='${pageContext.request.contextPath}/logout'" class="btn btn-info" id="button1" />
			</div>

			<div class="12u" style="margin: 0 auto; float: left; width: 100%;">
				<!-- Nav -->
				<nav id="nav">
					<a href="#">마이페이지</a> 
					<a href="#">학적관리</a> 
					<a href="#">수업관리</a> 
					<a href="#">수강신청</a> <a href="#">등록/장학</a> 
					<a href="#">상담</a> 
					<a href="#">헬프데스크</a>
				</nav>

			</div>
		</div>
	</header>


<<<<<<< HEAD
헤더입니다
<button onclick="location.href='<%=request.getContextPath()%>/logout'">로그아웃</button>
=======
</div>
>>>>>>> refs/remotes/origin/master
