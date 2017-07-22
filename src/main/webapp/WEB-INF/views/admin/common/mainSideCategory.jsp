<%@page import="com.avengers.db.dto.PerschdVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

 <!-- start: Css -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	
 <!-- plugins -->
  <link rel="stylesheet" type="text/css" href="asset/css/plugins/font-awesome.min.css"/>
  <link rel="stylesheet" type="text/css" href="asset/css/plugins/animate.min.css"/>
  <link href="asset/css/style.css" rel="stylesheet">	
  
<!-- jQuery library -->
<script
	src='${pageContext.request.contextPath}/resources/js/full_calender/jquery.min.js'></script>
<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<link rel="apple-touch-icon" sizes="57x57"
	href="https://fullcalendar.io/apple-touch-icon-57x57.png">
<link rel="apple-touch-icon" sizes="114x114"
	href="https://fullcalendar.io/apple-touch-icon-114x114.png">
<link rel="apple-touch-icon" sizes="72x72"
	href="https://fullcalendar.io/apple-touch-icon-72x72.png">
<link rel="apple-touch-icon" sizes="144x144"
	href="https://fullcalendar.io/apple-touch-icon-144x144.png">
<link rel="apple-touch-icon" sizes="60x60"
	href="https://fullcalendar.io/apple-touch-icon-60x60.png">
<link rel="apple-touch-icon" sizes="120x120"
	href="https://fullcalendar.io/apple-touch-icon-120x120.png">
<link rel="apple-touch-icon" sizes="76x76"
	href="https://fullcalendar.io/apple-touch-icon-76x76.png">
<link rel="apple-touch-icon" sizes="152x152"
	href="https://fullcalendar.io/apple-touch-icon-152x152.png">
<link rel="apple-touch-icon" sizes="180x180"
	href="https://fullcalendar.io/apple-touch-icon-180x180.png">
<link rel="icon" type="image/png"
	href="https://fullcalendar.io/favicon-192x192.png" sizes="192x192">
<link rel="icon" type="image/png"
	href="https://fullcalendar.io/favicon-160x160.png" sizes="160x160">
<link rel="icon" type="image/png"
	href="https://fullcalendar.io/favicon-96x96.png" sizes="96x96">
<link rel="icon" type="image/png"
	href="https://fullcalendar.io/favicon-16x16.png" sizes="16x16">
<link rel="icon" type="image/png"
	href="https://fullcalendar.io/favicon-32x32.png" sizes="32x32">

<script>
 
	$(function() {
	
		var id; 
		
		var todayDate = moment().startOf('day');
		var YM = todayDate.format('YYYY-MM');
		var YESTERDAY = todayDate.clone().subtract(1, 'day').format('YYYY-MM-DD');
		var TODAY = todayDate.format('YYYY-MM-DD');
		var TOMORROW = todayDate.clone().add(1, 'day').format('YYYY-MM-DD');

		 
		$('#calendar').fullCalendar({
			header: {
				left: 'prev,today,next', 
				center: 'title', 
				right: '' 
			},
			defaultDate: new Date(), //캘린더 켜지면 화면상에 나오는 날짜
			editable: false, //마우스로 일정을 움직일 수 있음. 사용자는 캘린더를 보기만 하기 때문에 false
			eventLimit: false,//하루에 이벤트가 3개이상이면 more표시로 줄여주는 기능 다 보여줘야하기 때문에 false
			events: [
			     
							<%List<PerschdVO> perschdList = (List<PerschdVO>)request.getAttribute("perschdList");%>
							<%for(int i=0; i<perschdList.size();i++){
								if(i>0) out.print(",");
								PerschdVO perschdVO = perschdList.get(i);%>
			     { 
			    	 title: '<%=perschdVO.getPerschd_title()%>',
			         start:'<%=perschdVO.getPerschd_start_date()%>',
			         end:'<%=perschdVO.getPerschd_end_date()%>',
			         content:'<%=perschdVO.getPerschd_cont()%>',
			    	 date:'<%=perschdVO.getPerschd_date()%>'
			     }
			     
			    		<%}%> 
			],
	});
		
		
	$( 'h2' ).contents().unwrap().wrap( '<h5></h5>' );// 달력의 제목 크기 줄이기 
	});
	

</script>

<style>
#calendarBody {
	margin-top: 20px;
	width: 100%;
}
.fc-view-container{
	height: 300px;
}
</style>

<div class="col-xs-12" style="height: 300px;" >
	<div id="adminInfo">
		<h5>관리자 정보 출력</h5>
		아이디 : ${admin.admin_id}<br /> 이름 : ${admin.admin_nm}<br />
		<c:choose>
			<c:when test="${admin.admin_post eq '2' }">
			   직책 : 총괄
			   </c:when>
			<c:otherwise>
			   직책 : 일반
			   </c:otherwise>
		</c:choose>
	</div>
	<div id="calendarBody" style="height: 300px;">
		<div id='calendar'  style="height: 300px;"></div>
	</div>
</div>