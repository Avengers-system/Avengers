<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<title>학생-등록/장학금관리-장학금신청</title>
<!-- css초기화 -->
<link href="resources/css/normalize.css" rel="stylesheet">
<!-- 부트스트랩 -->
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
</head>
<style>
#topMenu {
	height: 30px;
	width: 1000px;
}

#topMenu ul li {
	list-style: none;
	color: white;
	background-color: #2d2d2d;
	float: left;
	line-height: 30px;
	vertical-align: middle;
	text-align: center;
}

#topMenu .menuLink {
	text-decoration: none;
	color: white;
	display: block;
	width: 120px;
	font-size: 12px;
	font-weight: bold;
	font-family: "Trebuchet MS", Dotum, Arial;
}

#topMenu .menuLink:hover {
	color: red;
	background-color: #4d4d4d;
}
</style>
<body>
	<div class="container">
		<div class="row">
			<!-- 공통 Header -->
			<div class="col-xs-12">
				<img src="http://placehold.it/60x60" /> ~~님 자동로그아웃까지 남은시간30분 00초 <input
					type="button" value="연장"> <input type="button" value="로그아웃">
			</div>
			<!-- Content -->
			<div class="col-xs-12">
				<div class="container">
					<div class="row">
						<div class="col-sm-12">
							<nav id="topMenu">
								<ul>
									<li><a class="menuLink" href="#">DDIT Uiv.</a></li>
									<li><a class="menuLink" href="#">My Page</a></li>
									<li><a class="menuLink" href="#">학적관리</a></li>
									<li><a class="menuLink" href="#">수업관리</a></li>
									<li><a class="menuLink" href="#">수강신청</a></li>
									<li><a class="menuLink" href="#">등록/장학금관리</a></li>
									<li><a class="menuLink" href="#">상담</a></li>
									<li><a class="menuLink" href="#">HelpDesk</a></li>
								</ul>
							</nav>
						</div>
						<div class="col-md-2">
							<ul>
								<li><h3>강의명</h3></li>
								<li>강의계획서</li>
								<li>시험관리</li>
								<li>과제관리</li>
								<li>학점확인</li>
								<li>출결관리</li>
								<li>수업자료실</li>
								<li>질문게시판</li>
								<li>수강평가</li>
							</ul>
						</div>
						<div class="col-md-10">
							<div class="row">
								<div class="col-xs-12">
								장학금명(셀렉트박스)와 성적/학과/학년/학번/주소/생년월일을 입력할수있는 인풋태그들 
								</div>
								<div class="col-xs-12">
								신청버튼 (빈간이있다면 경고창표시)
								</div>								
							</div>
						</div>
					</div>
				</div>



			</div>
			<!-- Footer -->
			<div class="col-xs-12">(c)Copyriget Avengers</div>
		</div>
	</div>
	<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
	<script src="resources/js/jquery-3.2.1.min.js"></script>
	<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
	<script src="resources/js/bootstrap.min.js"></script>
</body>
</html>