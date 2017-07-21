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
	&copy;CopyRight_Avengers
</sec:authorize>