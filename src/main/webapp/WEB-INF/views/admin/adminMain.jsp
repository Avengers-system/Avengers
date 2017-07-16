<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page trimDirectiveWhitespaces="true"%>


<h1>관리자메인</h1>


<button id="adminMain" onclick="adminMain_go()">관리자</button>
<button id="logout" onclick="logout_go()">로그아웃</button><br/>
<button id="myInfo" onclick="myInfo_go()">개인정보</button><br/>
<button id="mySchedule" onclick="mySchedule_go()">개인일정관리</button><br/>

<script type="text/javascript">
	function adminMain_go(){
		location.href="${myContextPath}/admin/adminMain";
	}
	function logout_go(){
		location.href="${myContextPath}/common/logout";
	}
	function myInfo_go(){
		location.href="${myContextPath}/admin/mypage/myInfo";
	}
	function mySchedule_go(){
		location.href="${myContextPath}/admin/mypage/mySchedule";
	}

</script>
