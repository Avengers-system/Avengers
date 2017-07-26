<%@page import="com.avengers.db.dto.PerschdVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 템플릿 페이지 -->

<!-- Counsel Content -->
<!-- Counsel Left Side -->
<%@include file="../common/studentMypageSide.jsp" %>
<!--  Counsel Right Side -->
<div class="col-md-10">
	<div class="panel panel-default">
		<div class="panel-heading" style="background-color: #2196F3;  margin-top: 10px;">
			<h4 style="color: #fff; font-weight: bold; font-size: 20px;">
			
			개인일정관리
			</h4>
		</div>
		<div class="panel-body" style="height: 580px; text-align: center;" >

			<div class="col-md-3 col-md-offset-9" style="padding-left: 0px;">
				<a href="#" class="button" data-toggle="modal" data-target="#addSchedule">
					일정등록 
				</a>
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
			     
							<%List<PerschdVO> perschdList = (List<PerschdVO>)request.getAttribute("perschdList");%>
							<%for(int i=0; i<perschdList.size();i++){
								if(i>0) out.print(",");
								PerschdVO perschdVO = perschdList.get(i);%>
			     { 
			    	 title: '<%=perschdVO.getPerschd_title()%>',
			         start:'<%=perschdVO.getPerschd_start_date()%>',
			         end:'<%=perschdVO.getPerschd_end_date()%>',
			         content:'<%=perschdVO.getPerschd_cont()%>',
			    	 time:'<%=perschdVO.getPerschd_date()%>'
			     }
			     
			    		<%System.out.println(perschdVO.getPerschd_end_date()+"!!!");
							}%> 
			],
			eventClick:function(event) {
				
				$.ajax({
					url  : 'myScheduleDetail',
					type : 'post',
					data : "perschd_title="+event.title,
					success : function(perschd){						
					$('#perschd_num').val(perschd.perschd_num);
					$('#perschd_writer').val(perschd.perschd_writer);
					$('#perschd_title').val(perschd.perschd_title);
					$('#perschd_start_date').val(perschd.perschd_start_date);
					$('#perschd_end_date').val(perschd.perschd_end_date);
					$('#perschd_cont').val(perschd.perschd_cont);
// 					$('#perschd_date').val(perschd.perschd_date);
					
					},
					error: function(){
						alert("error");
					}
				})

				//모달불러오기 
				$(this).attr("data-toggle","modal");
				$(this).attr("data-target","#editSchedule");
            }
	});
		
			
		})
 
		
	function deleteSchd(){
		myForm.method="post";
		myForm.action="myScheduleDelete";
		myForm.submit();
	}
		
	</script>
