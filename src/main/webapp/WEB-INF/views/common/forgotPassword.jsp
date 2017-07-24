<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="container">
	<form class="form-signin">
		<div class="panel periodic-login">
			<span class="atomic-number">&copy;Avengers</span>
			<div class="panel-body text-center">
				<h1 class="atomic-symbol">A</h1>
				<p class="atomic-mass">비밀번호 찾기</p>
				<p class="element-name">UNIVERSITY</p>
				<i class="icons icon-arrow-down"></i>
				<div class="form-group form-animate-text"
					style="margin-top: 40px !important;">
					<input type="text" class="form-text" required> <span
						class="bar"></span> <label>사용자아이디</label>
					<p>Input your email to reset your password</p>
				</div>
				<div class="form-group form-animate-text"
					style="margin-top: 40px !important;">
					<input type="password" class="form-text" required> <span
						class="bar"></span> <label>이메일</label>
					<p>Input your email to reset your password</p>
				</div>
				<input type="submit" class="btn col-md-12" value="찾기" />
			</div>
			<div class="text-center" style="padding: 5px;">
				<a href="${pageContext.request.contextPath}/login">메인화면으로 돌아가기</a><a href="${pageContext.request.contextPath}/forgotUsername"> | 아이디 찾기</a>
			</div>
		</div>
	</form>
</div>