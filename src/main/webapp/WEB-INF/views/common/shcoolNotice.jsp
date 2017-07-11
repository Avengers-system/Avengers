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
<title>메인화면</title>
<!-- css초기화 -->
<link href="../resources/css/normalize.css" rel="stylesheet">
<!-- 부트스트랩 -->
<link href="../resources/css/bootstrap.min.css" rel="stylesheet">
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

#helpTop{
	width: 1024px;
	height: 60px;
	background-color: green;
}
#helpLeft{
	width: 170.7px;
	height: 588px;
	background-color: red;
}
#helpRight{
	width: 853.3px;
	height: 588px;
	background-color: pink;
}
#helpRightUp{
	width: 853.3px;
	height: 294px;
	background-color: blue;
}
#helpRightDown{
	width: 853.3px;
	height: 294px;
	background-color: purple;
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
				<input type="button"value="로그아웃" onclick="location.href='../main.jsp'">
			</div>
			<!-- Content -->
			<div class="col-xs-12" id="content">

				<div class="row">
					<div class="col-xs-12" id="helpTop">
						<input type="button" value="MyPage">
						<input type="button" value="교수관리">
						<input type="button" value="학생관리">
						<input type="button" value="HelpDesk">
					</div>
					<div class="col-md-2" id="helpLeft">학교공지, 학과공지, 포털소식, 학사일정 Q&A, FAQ</div>
					<div class="col-md-10" id="helpRight">
						<div class="row">
							<div class="col-xs-12" id="helpRightUp">
								학교공지 <select>제목
								</select>
								<button>검색</button>
								<button>글쓰기</button>
							</div>
							<div class="col-xs-12" id="helpRightDown">글목록 1,2,3,4페이징처리</div>

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
	<script src="../resources/js/jquery-3.2.1.min.js"></script>
	<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
	<script src="../resources/js/bootstrap.min.js"></script>
</body>
</html>