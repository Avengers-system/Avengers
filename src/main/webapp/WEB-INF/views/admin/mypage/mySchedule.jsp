<%@page import="com.avengers.admin.mypage.service.AdminMypageService"%>
<%@page import="com.avengers.db.dto.PerschdVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.List"%>



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

#commonRightSide{

	margin-top:50px;

}
</style>



	<!-- Admin Header -->
	<%@include file="../common/topCategory.jsp"%>
	
		<!-- Content -->
		<div class="col-md-2" id="commonLeftSide">
<%-- 			<%@include file="../common/mainSideCategory.jsp" %> --%>
		</div>

		<div class="col-md-10" id="commonRightSide">

		<div id='body' class='section' >
		<div>
			<div class='two-col'>
			
			<div class="col-md-3 col-md-offset-9" style="padding-left:0px;">
				<a href="#" class="button" data-toggle="modal" data-target="#addSchedule">일정등록 </a>
			
				</div>
			
			
					<div id='calendar'></div>
				</div>
			</div>
		</div>

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
			     
							<%
							
							List<PerschdVO> perschdList = (List<PerschdVO>)request.getAttribute("perschdList");
							%>
							<%for(int i=0; i<perschdList.size();i++){
								if(i>0) out.print(",");
								PerschdVO perschdVO = perschdList.get(i);
							%>
			     { 
			    	 title: '<%=perschdVO.getPerschd_title() %>',
			         start:'<%=perschdVO.getPerschd_start_date() %>',
			         end:'<%=perschdVO.getPerschd_end_date() %>',
			         content:'<%=perschdVO.getPerschd_cont() %>',
			    	 date:'<%=perschdVO.getPerschd_date() %>'
			     }
			     
			    		<%
							}
			    		%> 
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
   
   
 </div>
 
 
 
 
 
   
 

<!-- 추가모달창 -->

<div class="modal fade" id="addSchedule">
      <div class="modal-dialog">
         <div class="modal-content">
            <div class="modal-header">
               <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
               </button>
               <h4 class="modal-title">일정등록</h4>
            </div>
            <div class="modal-body">
            	<div class="row"> 
				            <div class="col-md-12">
				            <div class="col-md-8 col-md-offset-2">
			            	<form action="myScheduleInsert" method="POST">
			            	<ul>
									<input type="hidden" class="form-control" name="PERSCHD_NUM" >
			            		<li>
				            		<label class='control-label'>title</label>
									<input type="text" class="form-control" name="PERSCHD_TITLE" >
			            		</li>
			            		<li>
									<input type="hidden" class="form-control" name="PERSCHD_WRITER" >
			            		<li>
				            		<label class='control-label'>start date</label>
									<input type="date"   class="form-control" name="PERSCHD_START_DATE" >
			            		</li>
			            		<li>
				            		<label class='control-label'>end date</label>
									<input type="date"  class="form-control" name="PERSCHD_END_DATE" >
			            		</li>
			            		<li>
				            		<label class='control-label'>content</label>
									<input type="text" class="form-control" name="PERSCHD_CONT"   >
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
   
