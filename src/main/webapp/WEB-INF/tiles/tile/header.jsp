<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<style>
#commonLoginInformation {
	/* 	padding-top: 5px; */
	text-align: right;
}
</style>



<sec:authorize access="isAuthenticated()">
	<nav class="navbar navbar-default header bg-white "
		style="width: 100%; height: 60px; margin: 0;">
		<div class="col-md-12 nav-wrapper" style="width: 100%; height: 60px;">
			<div class="navbar-header" style="width: 100%; height: 60px;">

				<div class="col-md-2">
					<a href="${pageContext.request.contextPath}/main"><img
						class="logo" style="height: 60px; width: 130px;"
						src="${pageContext.request.contextPath}/resources/images/LOGO.png"></a>
				</div>
				<!-- Header -->
				<div id="header-wrapper " class="nav navbar-nav navbar-right">
					<div class="text-right">
						<!--자동로그아웃-->
						<sec:authorize access="isAuthenticated()">
							<div id="commonLoginInformation">
								<div class="logout">
									남은 시간 : 00 분 00초 <input type="button" value="연장"
										class="btn btn-info" id="button1" /> <input type="button"
										value="로그아웃"
										onclick="location.href='${pageContext.request.contextPath}/logout'"
										class="btn btn-info" id="button1" />
								</div>
							</div>
						</sec:authorize>
					</div>
				</div>
			</div>
		</div>
	</nav>
</sec:authorize>

