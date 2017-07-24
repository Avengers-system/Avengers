<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>


<!-- 비로그인시 보여주는 화면 -->
<sec:authorize access="isAnonymous()">

</sec:authorize>
<!--  로그인시 보여주는 화면 -->
<sec:authorize access="isAuthenticated()">


	<div class="row">
		<div class="col-xs-12">
			<div class="panel-body"  style="background-color: #2196F3; height: 60px; border-radius: 5px; color: #fff; text-align: center; padding-top: 13px;">
			&copy; Copyright : DDIT 204. 1Team. <b>Avengers.</b><br>
			 배진, 배현상, 이보라, 이진영, 조영훈, 표혜진.
			</div>
		</div>
	</div>
</sec:authorize>