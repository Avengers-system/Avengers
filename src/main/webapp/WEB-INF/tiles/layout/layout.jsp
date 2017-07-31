<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
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

<!-- start: Css -->
   <link rel="stylesheet" type="text/css"   href="${pageContext.request.contextPath}/resources/asset/css/bootstrap.min.css">
   <link rel="stylesheet" type="text/css"   href="${pageContext.request.contextPath}/resources/css/morris.css">

<!-- plugins -->
   <link rel="stylesheet" type="text/css"   href="${pageContext.request.contextPath}/resources/asset/css/plugins/font-awesome.min.css" />
   <link rel="stylesheet" type="text/css"   href="${pageContext.request.contextPath}/resources/asset/css/plugins/simple-line-icons.css" />
   <link rel="stylesheet" type="text/css"   href="${pageContext.request.contextPath}/resources/asset/css/plugins/animate.min.css" />
   <link rel="stylesheet" type="text/css"   href="${pageContext.request.contextPath}/resources/asset/css/plugins/icheck/skins/flat/aero.css" />
   <link href="${pageContext.request.contextPath}/resources/asset/css/style.css" rel="stylesheet">
   
<!-- 풀캘린더 -->
   <link href='${pageContext.request.contextPath}/resources/css/full_calender/base.css' rel='stylesheet' />
   <link rel='stylesheet' href='${pageContext.request.contextPath}/resources/css/full_calender/fullcalendar.min.css' />
   <script src='${pageContext.request.contextPath}/resources/js/full_calender/jquery.min.js'></script>
   
<!-- end: Css -->

</head>

<sec:authorize access="isAuthenticated()">
<body >
</sec:authorize>
<sec:authorize access="isAnonymous()">
<body class="dashboard form-signin-wrapper">
</sec:authorize>

<!-- Common Header -->
<div class="container-fluid">
   <tiles:insertAttribute name="header"/>
</div>



<!-- Common Content -->
<sec:authorize access="isAnonymous()">
<div class="container-fluid">
   <tiles:insertAttribute name="content" />
</div>
</sec:authorize>
<sec:authorize access="isAuthenticated()">
   <div class="container-fluid">
      <div class="row">
         <div class="col-xs-12">
            <div class="panel" style="height: 690px; overflow: scroll;">
               <tiles:insertAttribute name="content" /> 
            </div>
         </div>
      </div>
   </div>
</sec:authorize>

<!-- Common Footer -->
<div class="container-fluid">
   <tiles:insertAttribute name="footer" />
</div>   
<!-- start: Javascript -->
   <script   src="${pageContext.request.contextPath}/resources/asset/js/jquery.min.js"></script>
   <script   src="${pageContext.request.contextPath}/resources/asset/js/jquery.ui.min.js"></script>
   <script   src="${pageContext.request.contextPath}/resources/asset/js/bootstrap.min.js"></script>
<!-- plugins -->
   <script   src="${pageContext.request.contextPath}/resources/asset/js/plugins/moment.min.js"></script>
   <script   src="${pageContext.request.contextPath}/resources/asset/js/plugins/morris.min.js"></script>
   <script   src="${pageContext.request.contextPath}/resources/asset/js/plugins/raphael.min.js"></script>
   <script   src="${pageContext.request.contextPath}/resources/asset/js/plugins/jquery.nicescroll.js"></script>
   <script   src="${pageContext.request.contextPath}/resources/asset/js/plugins/icheck.min.js"></script>
   
<!-- Full calender -->
   <script   src='${pageContext.request.contextPath}/resources/js/full_calender/moment.min.js'></script>
   <script   src='${pageContext.request.contextPath}/resources/js/full_calender/jquery-ui.min.js'></script>
   <script   src='${pageContext.request.contextPath}/resources/js/full_calender/fullcalendar.min.js'></script>
   <script   src='${pageContext.request.contextPath}/resources/js/full_calender/ko.js'></script>
<!-- morris -->
   <script   src='${pageContext.request.contextPath}/resources/asset/js/main.js'></script>


<!-- RSA 암호화 JS -->
     <script type="text/javascript" src="${pageContext.request.contextPath}/resources/rsa/jsbn.js"></script>
     <script type="text/javascript" src="${pageContext.request.contextPath}/resources/rsa/rsa.js"></script>
     <script type="text/javascript" src="${pageContext.request.contextPath}/resources/rsa/prng4.js"></script>
     <script type="text/javascript" src="${pageContext.request.contextPath}/resources/rsa/rng.js"></script>
     <script type="text/javascript" src="${pageContext.request.contextPath}/resources/rsa/login.js"></script>



</body>
</html>