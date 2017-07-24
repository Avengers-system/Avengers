<%@page import="com.avengers.db.dto.PerschdVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


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