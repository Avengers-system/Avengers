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
			<!--자동로그아웃-->
			<sec:authorize access="isAuthenticated()">
				<div id="commonLoginInformation">
					<div class="logout">
						남남은 시간 : 00 분 00초 
						<input type="button" value="연장" 	class="btn btn-info" id="button1" /> 
						<input type="button" value="로그아웃"	onclick="location.href='${pageContext.request.contextPath}/logout'"	class="btn btn-info" id="button1" />
					</div>
				</div>
			</sec:authorize>
		</div>
	</header>
</div>

