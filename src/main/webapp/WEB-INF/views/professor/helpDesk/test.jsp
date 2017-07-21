<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.avengers.db.dto.Event"%>
<script>
	$(function() {
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
				<%
				
				List<Event> eventList = (List<Event>)request.getAttribute("eventList");
				%>
			 	<%for(int i=0; i<eventList.size();i++){
			  		if(i>0) out.print(",");
			  		Event event =eventList.get(i);
			  	%>
			  	
			
				{
					title: '<%=event.getTitle()%>',
					start: '<%=event.getStart_date()%>',
					end:'<%=event.getEnd_date()%>',
					color:'<%=event.getColor()%>',
					url:'eventDetail?id=<%=event.getId()%>'
				}
				<%}%>
			],
		
	});
	});
	</script>
	
	
	<style>
#calendar {
	max-width: 900px;
	margin: 0 auto;
}
</style>
<body id='index-page'>
	<div id='body' class='section'>
		<div>
			<div class='two-col'>
				<div id='calendar'></div>
			</div>
		</div>
	</div>
	<a href="createEventForm"><button>일정등록</button></a>
