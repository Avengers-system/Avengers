 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container">
	<form class="form-signin" action="<c:url value='/loginForm'/>" method="post">
		<div class="panel periodic-login">
			<span class="atomic-number">&copy;Avengers</span>
			<div class="panel-body text-center">
				<h1 class="atomic-symbol">A</h1>
				<p class="atomic-mass">학사관리시스템</p>
				<p class="element-name">UNIVERSITY</p>
				<i class="icons icon-arrow-down"></i>
				<div class="form-group form-animate-text"
					style="margin-top: 40px !important;">
					<input type="text" name ="id" class="form-text" required>
					<span class="bar"></span>
					<label>Username</label>
				</div>
				<div class="form-group form-animate-text"
					style="margin-top: 40px !important;">
					<input type="password" name="pwd" class="form-text" required>
					 <span class="bar"></span> <label>Password</label>
				</div>
				<input type="submit" class="btn col-md-12" value="SignIn"/>
			</div>
			<div class="text-center" style="padding: 5px;">
				<a href="${pageContext.request.contextPath}/forgotUsername">Forgot Username</a>
				<a href="${pageContext.request.contextPath}/forgotPassword">| Password</a>
			</div>
		</div>
	</form>
</div>
