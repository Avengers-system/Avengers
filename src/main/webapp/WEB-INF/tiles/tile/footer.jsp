<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>


<!-- 비로그인시 보여주는 화면 -->
<sec:authorize access="isAnonymous()">

</sec:authorize>
<!--  관리자 로그인시 보여주는 화면 -->
<sec:authorize access="hasAnyRole('ROLE_ADMIN')">

	<div class="row">
		<div class="col-xs-12">
			<div class="panel-body"  style="background-color: #CC0000;  height: 60px; border-radius: 5px; color: #fff; text-align: center; padding-top: 13px;">
			&copy; Copyright : DDIT 204. 1Team. <b>Avengers.</b><br>
			 배진, 배현상, 이보라, 이진영, 조영훈, 표혜진.
			</div>
		</div>
	</div>
</sec:authorize>
<!--  교수 로그인시 보여주는 화면 -->
<sec:authorize access="hasAnyRole('ROLE_PROF')">

	<div class="row">
		<div class="col-xs-12">
			<div class="panel-body"  style="background-color: #666666; height: 60px; border-radius: 5px; color: #fff; text-align: center; padding-top: 13px;">
			&copy; Copyright : DDIT 204. 1Team. <b>Avengers.</b><br>
			 배진, 배현상, 이보라, 이진영, 조영훈, 표혜진.
			</div>
		</div>
	</div>
</sec:authorize>
<!--  학생 로그인시 보여주는 화면 -->
<sec:authorize access="hasAnyRole('ROLE_STUD')">

	<div class="row">
		<div class="col-xs-12">
			<div class="panel-body"  style="background-color: #2196F3; height: 60px; border-radius: 5px; color: #fff; text-align: center; padding-top: 13px;">
			&copy; Copyright : DDIT 204. 1Team. <b>Avengers.</b><br>
			 배진, 배현상, 이보라, 이진영, 조영훈, 표혜진.
			</div>
		</div>
	</div>
</sec:authorize>