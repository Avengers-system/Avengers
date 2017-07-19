<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Site info -->      
    <title>학사관리시스템</title>
    <meta name="description" content="학사관리시스템">
    <meta name="author" content="Avengers">  
    <meta name="designer" content="Avengers">        
    <meta name="dcterms.rightsHolder" content="(c)Copyright_Avengers">
    <meta name="keywords" content="학사관리시스템">
<!-- Icons -->
	<!-- PC 주소줄 아이콘 -->
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/ico/avengers_favicon.ico">
	<link rel="icon" href="${pageContext.request.contextPath}/resources/ico/avengers_thumbnail.png">
	<!-- 썸네일 -->
	<meta property="og:title" content="Avengers_학사관리시스템"/>
	<meta property="og:description" content="204호 1조 Avengers <br> 최종프로젝트 학사관리시스템"/>
	<meta property="og:image" content="${pageContext.request.contextPath}/resources/ico/avengers_thumbnail.png" />
	
<!-- Style -->
	<!-- CSS Reset -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/normalize.css">
	<!-- Bootstrap -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap-theme.min.css">
	<!-- User Custom -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/custom.css"> 
</head>

<style>
#commonHeader{
	background-color: #F8F8F8;
	border-radius: 20px; 
	min-height: 80px;
}
#commonContent{
	background-color: lightgray; 
	min-height:960px;
}
#commonFooter{
 	background-color: red; 
	min-height: 60px;
}
#commonUserHeader{
 	background-color: orange; 
	min-height: 80px;
}
#commonLeftSide{
 	background-color: blue; 
	min-height: 900px;
}
#commonRightSide{
 	background-color: lightblue; 
	min-height: 900px;
}

#commonUserHeader>ul>li{
	font-size: 28px;
}
#commonHeaderSort{
	padding-top: 10px;
}
</style>

<body>
<!-- Common Header -->
<div class="container-fluid">
    <div class="row" id="commonHeader">
    	<div id="commonHeaderSort">
			<tiles:insertAttribute name="header"/>
		</div>
    </div>
</div>

<!-- Common Content -->
<div class="container-fluid">
	<div class="row" id="commonContent">
		<tiles:insertAttribute name="content" />
    </div>
</div>

<!-- Common Footer -->
<div class="container-fluid" class="footer">
    <div class="row" id="commonFooter">
		<tiles:insertAttribute name="footer" />
    </div>
</div>	
<!-- Main Scripts -->
	<!-- jQuery-->
	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
	<!-- Bootstrap -->
	<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<!-- User Custom -->
	<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
</body>
</html>