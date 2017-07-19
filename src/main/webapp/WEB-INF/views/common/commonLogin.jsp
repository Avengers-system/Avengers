<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<title>메인화면</title>
<!-- css초기화 -->
<link href="${pageContext.request.contextPath}/resources/css/normalize.css" rel="stylesheet">
<!-- 부트스트랩 -->
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

 <!-- Compiled and minified CSS -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.99.0/css/materialize.min.css">

  <!-- Compiled and minified JavaScript -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.99.0/js/materialize.min.js"></script>
</head>


<style>
.row .col {
    float: left;
    box-sizing: border-box;
    min-height: 1px;
}

.container .row {
     margin-left: 0px; 
     margin-right: 0px; 
}

#bodyWrap {
/* 	width: 1024px; */
	width: 100%; 
/* 	background-color: #293458; */
	margin: 0 auto;
}

#commonHeader {
    /* width: 1024px; */
    /* width: 100%; */
    height: 60px;
/*     background-color: #293458; */
    margin-top: 10px;
    margin-bottom: 30px;
    text-align: left;
}

#commonHeader>.logo{
	margin-left : 30px;
	width : 150px;
}

#text{
	text-align: center;

}

#commonFooter {
/* 	width: 1024px; */
	height: 60px;
	background-color: #6A6D65;
	position: relative;
	opacity: 0.5;
	margin-bottom:0px;
	text-align: center;
}
 

 
</style>

<!-- table용 스타일 -->
<style>

.waves-effect{
	opacity: 0.6;
	width: 130px;
}

.table {
	width: 10px;
}

#red {
	width: 500px;
	height: 300px;
}
</style>


<style type="text/css">
* {
	box-sizing: border-box;
}

 
.video-foreground, .video-background iframe {  
	position: absolute;
	top: 0;
	left: 0;
	
	width: 100%;
	height: 100%;
	pointer-events: none;
	margin-top: 50px;
	margin-bottom: 50px;
}

.video-foreground iframe {
	border: 1px red dotted;
}

@media ( min-aspect-ratio : 16/9) {
	.video-foreground {
		height: 300%;
		top: -100%;
	}
}

@media ( max-aspect-ratio : 16/9) {
	.video-foreground {
		width: 300%;
		left: -100%;
		border-bottom: 200%
	}
}

h1 {
	color: white;
}
</style>

<style>
h4{
text-align : center;

}
 

</style>

<!-- 비디오 스타일 -->
<style>
#video {
	position: fixed;
	top: 0;
	left: 0;
	min-width: 100%;
	min-height: 100%;
	width: auto;
	height: auto;
	z-index: -1;
}

 

.btn, .btn-large {
    text-decoration: none;
    color: #fff;
    background-color: #B22049;
    text-align: center;
    letter-spacing: .5px;
    transition: .2s ease-out;
    cursor: pointer;
    padding-top: 40px;
}

#body {
	margin: 0;
	padding: 0;
	background: url(https://www.nxworld.net/example/css-fullscreen-background-video/img.jpg) center center fixed no-repeat;
}

#mylogin {
	width: 75%;
	margin: 1em auto;
	padding: 3em 4em;
	background-color: rgba(0,0,0,.5);
	color: #fff;
	text-align: center;
}

 

#text h1{
margin-top:0px;
}
 
</style>


<body id="body">
			<!-- 공통 Header -->
		<div class="row">
			<div class="col m12" id="commonHeader">
				
			</div>
		</div>
		
		
	<div class="container">
		<div class="row">
			<!-- Content -->
				<div class="row">
					<div class="col m12" id="content">
									        <video id="video" autoplay="" loop="" poster="http://www.nxworld.net/codepen/css-fullscreen-background-video/img.jpg">
	<source src="${pageContext.request.contextPath}/resources/video/Florida State University- Campus Life.mp4" type="video/mp4">

</video>
					</div>
				</div>
				<!-- login -->
				<div class="row" id="mylogin">
				 
					<div class="col m12">
					
						<div class="input-field col m5" id="text">
							<h1>Welcome to </h1>
							<br>
							<h3>HANVARD</h3>
							<h3>UNIVERSITY!</h3>
						</div>


				
						<div class="input-field col m7 style=" id="text">
						<form action="<c:url value='/loginForm'/>" method="post">	
						<div class="input-field col m4" style="margin-right:40px;">
						
							<div class="row">
								<div class="input-field ">
						          <input id="first_name" type="text" class="validate" name="id">
						          <label for="ID">아이디</label>
								</div>
							</div>
							
							<div class="row">
								<div class="input-field">
								 <input id="password" type="password" class="validate" name="pwd">
						         <label for="password">비밀번호</label>
								</div>
							</div>
							
						</div>
					
					<!-- 로그인버튼 -->
						<div class="input-field col m2" id="btn" style=" padding-left : 0px; padding-top:35px; margin-top : 10px;">
							<input class="waves-effect waves-light btn-large" style="height:130px; text-decoration: none; padding-top:35px; margin-left:0px;" type = "submit" value="로그인">
						</div>				
						</form> 	 
	</div>
				
					
	
					<div class="row">
				 		<div class="input-field col m6">				 		
					 		<div class="input-field col m2" style=" padding-left : 0px; padding-top:35px; margin-top : 10px;">
								<button  class="waves-effect waves-light btn-large"  style="height:50px;text-decoration: none;" value = "아이디찾기" >아이디찾기</button>
	 						</div>
					 	
					 		<div class="input-field col m2" style=" padding-left : 0px; padding-top:35px; margin-top : 10px;" >
								<button class="waves-effect waves-light btn-large"  style="height:50px; text-decoration: none; margin-left:100px; "  value = "비밀번호찾기" >비밀번호찾기</button>		
	 						</div>
 						
 						</div>
 					</div>
					

					</div>		
					

 						
			</div>
				<!-- 학교소식 -->
<!-- 				 <div class="row" style="background-color: #F0F0F0;"> -->
<!-- 				 <div class="row"> -->
<!-- 				      <div class="col m6" style="background-color:#FFFFFF;"> -->
<!-- 						 <div class="row"><h4>학교 소식</h4> -->
<!-- 						 <a class="btn-floating btn-small waves-effect waves-light red"><i class="material-icons">+</i></a> -->
<!-- 						 </div> -->
<!-- 					      <table> -->
<!-- 							        <thead> -->
<!-- 							          <tr> -->
<!-- 							              <th>Name</th> -->
<!-- 							              <th>Item Name</th> -->
<!-- 							              <th>Item Price</th> -->
<!-- 							          </tr> -->
<!-- 							        </thead> -->
							
<!-- 							        <tbody> -->
<!-- 							          <tr> -->
<!-- 							            <td>Alvin</td> -->
<!-- 							            <td>Eclair</td> -->
<!-- 							            <td>$0.87</td> -->
<!-- 							          </tr> -->
<!-- 							          <tr> -->
<!-- 							            <td>Alan</td> -->
<!-- 							            <td>Jellybean</td> -->
<!-- 							            <td>$3.76</td> -->
<!-- 							          </tr> -->
<!-- 							          <tr> -->
<!-- 							            <td>Jonathan</td> -->
<!-- 							            <td>Lollipop</td> -->
<!-- 							            <td>$7.00</td> -->
<!-- 							          </tr> -->
<!-- 							        </tbody> -->
<!-- 							      </table>  -->
<!-- 				      </div> -->
				      
<!-- 				      <div class="col m6" style="background-color:#FFFFFF;">  -->
<!-- 						 <div class="row"> -->
<!-- 								 <h4>포탈 소식</h4> -->
<!-- 								<a class="btn-floating btn-small waves-effect waves-light red"> -->
<!-- 								<i class="material-icons">+</i></a> -->
<!-- 						 </div> -->
<!-- 				     		 <table> -->
<!-- 							        <thead> -->
<!-- 							          <tr> -->
<!-- 							              <th>Name</th> -->
<!-- 							              <th>Item Name</th> -->
<!-- 							              <th>Item Price</th> -->
<!-- 							          </tr> -->
<!-- 							        </thead> -->
							
<!-- 							        <tbody> -->
<!-- 							          <tr> -->
<!-- 							            <td>Alvin</td> -->
<!-- 							            <td>Eclair</td> -->
<!-- 							            <td>$0.87</td> -->
<!-- 							          </tr> -->
<!-- 							          <tr> -->
<!-- 							            <td>Alan</td> -->
<!-- 							            <td>Jellybean</td> -->
<!-- 							            <td>$3.76</td> -->
<!-- 							          </tr> -->
<!-- 							          <tr> -->
<!-- 							            <td>Jonathan</td> -->
<!-- 							            <td>Lollipop</td> -->
<!-- 							            <td>$7.00</td> -->
<!-- 							          </tr> -->
<!-- 							        </tbody> -->
<!-- 							      </table>  -->
<!-- 				      </div> -->
				    </div>
				</div>
				
			

<!-- 		<!-- footer --> --&gt;
<!-- 		<div class="col m12" id="commonFooter">(c)Copyriget Avengers</div> -->
			<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
			<script src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
			<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
		<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>

<div class="hiddendiv common"></div></body>
</html>
