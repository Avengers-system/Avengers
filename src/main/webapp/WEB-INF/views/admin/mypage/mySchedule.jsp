<%@page import="com.avengers.admin.mypage.service.AdminMypageService"%>
<%@page import="com.avengers.db.dto.PerschdVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.List"%>

<head>
<meta http-equiv='Content-Type' content='text/html; charset=utf-8' />
<title>일정관리</title>

<meta name='description'content='Open source JavaScript jQuery plugin for a full-sized, drag &amp; drop event calendar'>
<meta name='keywords'content='calendar, JavaScript, jQuery, events, drag and drop'>
<meta name='author' content='Adam Shaw'>
<meta name="msapplication-TileColor" content="#2b5797">
<meta name="msapplication-TileImage" content="https://fullcalendar.io/mstile-144x144.png">



<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- jQuery library -->
<script src='${pageContext.request.contextPath}/resources/js/full_calender/jquery.min.js'></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

 
<link rel="apple-touch-icon" sizes="57x57"	href="https://fullcalendar.io/apple-touch-icon-57x57.png">
<link rel="apple-touch-icon" sizes="114x114"	href="https://fullcalendar.io/apple-touch-icon-114x114.png">
<link rel="apple-touch-icon" sizes="72x72"	href="https://fullcalendar.io/apple-touch-icon-72x72.png">
<link rel="apple-touch-icon" sizes="144x144"	href="https://fullcalendar.io/apple-touch-icon-144x144.png">
<link rel="apple-touch-icon" sizes="60x60"	href="https://fullcalendar.io/apple-touch-icon-60x60.png">
<link rel="apple-touch-icon" sizes="120x120"	href="https://fullcalendar.io/apple-touch-icon-120x120.png">
<link rel="apple-touch-icon" sizes="76x76"	href="https://fullcalendar.io/apple-touch-icon-76x76.png">
<link rel="apple-touch-icon" sizes="152x152"href="https://fullcalendar.io/apple-touch-icon-152x152.png">
<link rel="apple-touch-icon" sizes="180x180"href="https://fullcalendar.io/apple-touch-icon-180x180.png">
<link rel="icon" type="image/png"href="https://fullcalendar.io/favicon-192x192.png" sizes="192x192">
<link rel="icon" type="image/png"href="https://fullcalendar.io/favicon-160x160.png" sizes="160x160">
<link rel="icon" type="image/png"href="https://fullcalendar.io/favicon-96x96.png" sizes="96x96">
<link rel="icon" type="image/png"href="https://fullcalendar.io/favicon-16x16.png" sizes="16x16">
<link rel="icon" type="image/png"href="https://fullcalendar.io/favicon-32x32.png" sizes="32x32">

<style>
ol, ul {
    margin-top: 10px;
    margin-bottom: 10px;
    list-style: none;
}

#calendar {
	max-width: 900px;
	margin: 0 auto;
}

</style>

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
			     { 
			    	 title:'3',
			         start:'admin',
			         end:''
			     }
			     
			],
			    
			 
	});
		
		
		
			//수정하는 모달창 열기		
		$('.fc-event-container').click(function(){
// 			$('#editSchdule').modal();

// 			$(this).attr("href","updateEventForm?id=${event.id }");
			$(this).attr("data-toggle","modal");
			$(this).attr("data-target","#editSchedule");
		})
		
		
	});

	
	
	</script>


</head>
 
<body id='index-page'>

	<div id='body' class='section' >
		<div>
			<div class='two-col'>
					<div id='calendar'></div>
				</div>
			</div>
		</div>
	
	<a href="#" class="button" data-toggle="modal" data-target="#addSchedule">일정등록 </a>
<!-- 	<a href="modalTest"><button>일정등록</button></a> -->


<!-- 수정용모달창 -->

<div class="modal fade" id="editSchedule">
      <div class="modal-dialog">
         <div class="modal-content">
            <div class="modal-header">
               <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
               </button>
               <h4 class="modal-title">Edit schedule</h4>
            </div>
            <div class="modal-body">
            	<div class="row"> 
				            <div class="col-md-12">
				            <div class="col-md-8 col-md-offset-2">
			            	<form action="updateEvent?id=${event.perschd_num}" method="POST">
			            	<ul>
									<input type="hidden" class="form-control" name="perschd_num" value="${event.perschd_num}" >
			            		<li>
				            		<label class='control-label'>title</label>
									<input type="text" class="form-control" name="perschd_title" value="${event.perschd_title}" >
			            		</li>
			            		<li>
				            		<label class='control-label'>start date</label>
									<input type="date"  name="perschd_start_date" value="${event.perschd_start_date}" class="form-control" >
			            		</li>
			            		<li>
				            		<label class='control-label'>start date</label>
									<input type="date"  name="perschd_writer" value="${event.perschd_writer}" class="form-control" >
			            		</li>
			            		<li>
				            		<label class='control-label'>end date</label>
									<input type="date"  name="perschd_end_date" value="${event.perschd_end_date}" class="form-control">
			            		</li>
			            		<li>
				            		<label class='control-label'>content</label>
									<input type="text" name="perschd_cont" value="${event.perschd_cont}" class="form-control" >
			            		</li>
			            		<li>
				            		<label class='control-label'>date</label>
									<input type="text" name="perschd_date" value="${event.perschd_date}" class="form-control" >
			            		</li>
			            		 
							</ul>
							
			            </div>
			          
			          <!-- footer -->  
			     <div class="col-md-12">  
			            <div class="modal-footer">
			            <div class="col-md-8 col-md-offset-1">
			               <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			               <input type="submit" class="btn btn-primary">
			            </div>
			            </div>
	            </div>
			            </form>
         </div>
         
         </div>
         <!-- /.modal-content -->
      	</div>
      </div>
      <!-- /.modal-dialog -->
   </div>
   <!-- /.modal -->
   </div>
   
   
   
 

<!-- 추가모달창 -->

<div class="modal fade" id="addSchedule">
      <div class="modal-dialog">
         <div class="modal-content">
            <div class="modal-header">
               <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
               </button>
               <h4 class="modal-title">Add schedule</h4>
            </div>
            <div class="modal-body">
            	<div class="row"> 
				            <div class="col-md-12">
				            <div class="col-md-8 col-md-offset-2">
			            	<form action="createEvent" method="POST">
			            	<ul>
									<input type="hidden" class="form-control" name="ID" >
			            		<li>
				            		<label class='control-label'>title</label>
									<input type="text" class="form-control" name="TITLE" >
			            		</li>
			            		<li>
				            		<label class='control-label'>start date</label>
									<input type="date"  name="START_DATE"  class="form-control" >
			            		</li>
			            		<li>
				            		<label class='control-label'>end date</label>
									<input type="date"  name="END_DATE" class="form-control">
			            		</li>
			            		<li>
				            		<label class='control-label'>content</label>
									<input type="text" name="CONTENT"  class="form-control" >
			            		</li>
			            		 
							</ul>
							
			            </div>
			          
			          <!-- footer -->  
			     <div class="col-md-12">  
			            <div class="modal-footer">
			            <div class="col-md-8">
			               <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			               <input type="submit" class="btn btn-primary">
			            </div>
			            </div>
	            </div>
			            </form>
         </div>
         
         </div>
         <!-- /.modal-content -->
      	</div>
      </div>
      <!-- /.modal-dialog -->
   </div>
   <!-- /.modal -->
   </div>

</body>
</html>
































<%-- <c:choose> --%>
<%-- 		<c:when test="${not empty perschdList}"> --%>
<%-- 			<c:forEach var="perschd" items="${perschdList}"> --%>
<!-- 				<tr> -->
<%-- 					<td>번호:${perschd.perschd_num}</td> --%>
<%-- 					<td>제목:${perschd.perschd_title}</td> --%>
<%-- 					<td>내용:${perschd.perschd_cont}</td> --%>
<%-- 					<td>작성자:${perschd.perschd_writer}</td> --%>
<%-- 					<td>작성일:${perschd.perschd_date}</td> --%>
<%-- 					<td>시작일:${perschd.perschd_start_date}</td> --%>
<%-- 					<td>종료일:${perschd.perschd_end_date}</td> --%>
<!-- 				</tr> -->
<!-- 				<br/> -->
<%-- 			</c:forEach> --%>
<%-- 		</c:when> --%>
<%-- 		<c:otherwise> --%>
<!-- 			등록된 일정이 없습니다. -->
<%-- 		</c:otherwise> --%>
<%-- 	</c:choose> --%>