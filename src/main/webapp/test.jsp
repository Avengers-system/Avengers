<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<title>메인화면</title>
<!-- css초기화 -->
<link href="resources/css/normalize.css" rel="stylesheet">
<!-- 부트스트랩 -->
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
</head>

<style>

#bodyWrap{
	width: 1024px;
	background-color: lightgray;
}
#commonHeader{
	width: 1024px;
	height : 60px;
	background-color: gray;
}
#content{
	width:1024px;
	height: 648px;
}

#commonFooter{
	width: 1024px;
	height : 60px;
	background-color: orange;
}

#mainTopLeft{
	width : 512px;
	height: 388.8px;
	background-color: red;
}
#mainTopRight{
	width : 512px;
	height: 388.8px;
	background-color: blue;
}
#mainBoardLeft{
	width : 512px;
	height: 259.2px;
	background-color: yellow;
}
#mainBoardRight{
	width : 512px;
	height: 259.2px;
	background-color: lightblue;
}


#loginForm{
	text-align: center;
	background-color: yellow;
}



</style>

<body>
	<div class="container" id="bodyWrap">
		<div class="row">
			<!-- 공통 Header -->
			<div class="col-xs-12" id="commonHeader">
				<img src="http://placehold.it/60x60" />
				~~님 자동로그아웃까지 남은시간30분 00초
				<input type="button" value="연장">
				<input type="button"value="로그아웃">
			</div>
			<!-- Content -->
			<div class="col-xs-12" id="content">
			
					<div class="row">
						<div class="col-xs-12">
							<div class="row">
								<div class="col-md-6" id="mainTopLeft"></div>
								<div class="col-md-6" id="mainTopRight">
									<div id="loginForm">
										학사관리시스템
										<input type="text" placeholder="아이디">
										<input type="password" placeholder="비밀번호">
										<input type="button" value="Test용 학생 로그인" onclick="location.href='student/studentMain.jsp'">
										<input type="button" value="Test용 교수 로그인" onclick="location.href='professor/professorMain.jsp'">
										<input type="button" value="Test용 관리자 로그인" onclick="location.href='admin/adminMain.jsp'">
										<input type="button" value="아이디찾기">
										<input type="button" value="비밀번호찾기">
									</div>
								</div>
							</div>
						</div>
						<div class="col-xs-12">
							<div class="row">
								<div class="col-md-6" id="mainBoardLeft">
									<table border="1">
										<tr>
											<td>학교공지사항</td>
											<td></td>
										</tr>
										<tr>
											<td>첫번째 글제목</td>
											<td>글 작성 날짜</td>
										</tr>
										<tr>
											<td>두번째 글제목</td>
											<td>글 작성 날짜</td>
										</tr>
										<tr>
											<td>세번째 글제목</td>
											<td>글 작성 날짜</td>
										</tr>
										<tr>
											<td>네번째 글제목</td>
											<td>글 작성 날짜</td>
										</tr>
										<tr>
											<td>다섯번째 글제목</td>
											<td>글 작성 날짜</td>
										</tr>
									</table>
								</div>
								<div class="col-md-6" id="mainBoardRight">
									<table border="1">
										<tr>
											<td>포털소식</td>
											<td></td>
										</tr>
										<tr>
											<td>첫번째 글제목</td>
											<td>글 작성 날짜</td>
										</tr>
										<tr>
											<td>두번째 글제목</td>
											<td>글 작성 날짜</td>
										</tr>
										<tr>
											<td>세번째 글제목</td>
											<td>글 작성 날짜</td>
										</tr>
										<tr>
											<td>네번째 글제목</td>
											<td>글 작성 날짜</td>
										</tr>
										<tr>
											<td>다섯번째 글제목</td>
											<td>글 작성 날짜</td>
										</tr>
									</table>
							</div>
							</div>
						</div>
					</div>

			</div>
			<!-- Footer -->
			<div class="col-xs-12" id="commonFooter">
				(c)Copyriget Avengers
			</div>
		</div>
	</div>
	<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
	<script src="resources/js/jquery-3.2.1.min.js"></script>
	<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
	<script src="resources/js/bootstrap.min.js"></script>
</body>
</html>