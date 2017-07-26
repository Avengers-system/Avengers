<%@page import="com.avengers.db.dto.PerschdVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Content -->

<style>
   .fc-button-group{
      height:30%;
   }
   .fc-prev-button fc-button fc-state-default fc-corner-left {
      width:3%;
      height:3%;
   }
   .fc-today-button fc-button fc-state-default fc-state-disabled{
      width:3%;
      height:3%;
   }
   .fc-next-button fc-button fc-state-default fc-corner-right{
      width:3%;
      height:3%;
   }
   .fc-center h2{
      
   }
</style>

<div class="panel-body">
	<!-- 개인정보 -->
	<div class="col-md-2">
		<div class="panel panel-default">
			<div class="panel-heading" style="background-color: #CC0000;">
				<h4 class="panel-title" style="color: #ffffff;">개인정보</h4>
			</div>
			<!-- 내용 -->
			<div class="panel-body" style="height: 260px; line-height: 40px;">

	<span class="label label-outline label-default" style="font-size: 15px;">이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;름</span>
			<span class="label label-outline label-default" style="display:inline-block;font-size: 15px; width: 160px;">${admin.admin_nm}</span><br>
			<span class="label label-outline label-default" style="font-size: 15px;">직&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;책</span>
			 <span class="label label-outline label-default" style="display:inline-block;font-size: 15px; width: 160px;">${admin.admin_post}</span><br>
			<span class="label label-outline label-default" style="font-size: 15px;">이&nbsp;&nbsp;메&nbsp;&nbsp;일</span>
			<span class="label label-outline label-default" style="display:inline-block;font-size: 15px; width: 160px;">${admin.admin_email}</span><br>			
			</div>
		</div>
	</div>
	<!-- 학생수 -->
	<div class="col-md-2">
		<div class="panel panel-default">
			<div class="panel-heading" style="background-color: #CC0000;">
				<h4 class="panel-title" style="color: #ffffff;">학생 현황</h4>
			</div>
			<!-- 내용 -->
			<div class="panel-body" style="height: 260px; text-align: center;">
            	<div id="doughnut-chart" style="width: 80%; height: 80%; display: inline-block;" ></div>
			</div>
		</div>
	</div>
	<!-- 휴학현황 -->
	<div class="col-md-4">
		<div class="panel panel-default">
			<div class="panel-heading" style="background-color: #CC0000;">
				<h4 class="panel-title" style="color: #ffffff;">휴학 현황</h4>
			</div>
			<!-- 내용 -->
			<div class="panel-body" style="height: 260px;">
				<div id="deptLeave-chart" style="width: 80%%; height: 80%;"></div>
			</div>
		</div>
	</div>
	<!-- 복학현황 -->
	<div class="col-md-4">
		<div class="panel panel-default">
			<div class="panel-heading" style="background-color: #CC0000;">
				<h4 class="panel-title" style="color: #ffffff;">복학 현황</h4>
			</div>
			<!-- 내용 -->
			<div class="panel-body" style="height: 260px;">
				<div id="Reinstatement-chart" style="width: 80%%; height: 80%;"></div>
			</div>
		</div>
	</div>
	
	<!-- 개인일정 -->
	<div class="col-md-2">
		<div class="panel panel-default">
			<div class="panel-heading" style="background-color: #CC0000;">
				<h4 class="panel-title" style="color: #ffffff;">SCHEDULE</h4>
			</div>
			<!-- 내용 -->
			<div class="panel-body" style="height: 260px;">
				<div class="time">
					<h1 class="animated fadeInLeft" style="text-align: center; font-size: 50px; margin-top: 0; padding-top: 0;"></h1>
					<p class="animated fadeInRight"
						style="text-align: center; margin: 0; margin-bottom: 15px;"></p>
					<span class="label label-outline label-default">오늘 일정</span><br>
					<c:choose>
						<c:when test="${not empty adminMainDateContent}">
						<hr>
							${adminMainDateContent}
						</c:when>
						<c:otherwise>
						<hr>
							등록된 일정이 없습니다.
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>
	<!-- 자퇴현황 -->
	<div class="col-md-5">
		<div class="panel panel-default">
			<div class="panel-heading" style="background-color: #CC0000;">
				<h4 class="panel-title" style="color: #ffffff;">자퇴 현황</h4>
			</div>
			<!-- 내용 -->
			<div class="panel-body" style="height: 260px;">
				<div id='deptDropOff-chart' style="width: 80%%; height: 80%;"></div>
			</div>
		</div>
	</div>

	<!-- 교수현황 -->
	<div class="col-md-5">
		<div class="panel panel-default">
			<div class="panel-heading" style="background-color: #CC0000;">
				<h4 class="panel-title" style="color: #ffffff;">교수 현황</h4>
			</div>
			<!-- 내용 -->
			<div class="panel-body" style="height: 260px;">
				<div id="bar-chart" style="width: 80%%; height: 80%;"></div>
			</div>
		</div>
	</div>
</div>

<script>
$(function() {
   $('h2').contents().unwrap().wrap('<h4></h4>');
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
   
   
});   
$(document).ready(function() {
   var totalStudent= ${studStatus.get(0) }+${studStatus.get(1) }+${studStatus.get(2) }+${studStatus.get(3) };
    var  studStatusGet0 =  Math.round((${studStatus.get(0)}/totalStudent)*100);//재학생수
    var  studStatusGet1 =  Math.round((${studStatus.get(1)}/totalStudent)*100); //휴학생수
    var  studStatusGet2 =  Math.round((${studStatus.get(2)}/totalStudent)*100); //자퇴생수
    var  studStatusGet3 =  Math.round((${studStatus.get(3)}/totalStudent)*100); //제적생수
    
    var deptNmArray = new Array(10);//학과이름
    var deptProfCountArray = new Array(10);//학과당 교수의 수
    var iNum = 0;
    var leaveDeptCount = new Array(10);//휴학생수(휴학)
    var leaveDeptName = new Array(10);//학과이름(휴학)
    var leaveNum=0;
    var dropOffDeptCount = new Array(10);//자퇴학생수
    var dropOffName = new Array(10);//학과이름(자퇴)
    var ReinstatementDeptCount = new Array(10);//복학학생수
    var ReinstatementDeptName = new Array(10);//학과이름(복학)
    var dropOffNum = 0;
    
    <c:forEach var="dept" items="${prfsOfDeptList }"  varStatus="status">
       deptNmArray[iNum]="${dept.dept_nm }";               
       deptProfCountArray[iNum]= "${dept.count }";
       iNum++;
    </c:forEach>
    
    iNum =0;
    
    <c:forEach var="dept" items="${selectLeaveDeptList}"  varStatus="status">
	    leaveDeptCount[iNum]='${dept.get("count") }';               
	    leaveDeptName[iNum]= '${dept.get("dept_nm") }';
	    iNum++;
	</c:forEach>
	
	iNum =0;
	<c:forEach var="dept" items="${getDropOffDeptList}"  varStatus="status">
		dropOffDeptCount[iNum]='${dept.get("count") }';               
	    dropOffName[iNum]= '${dept.get("dept_nm") }';
	    iNum++;
	</c:forEach>
	
	iNum =0;
	<c:forEach var="dept" items="${getReinstatementDeptList}"  varStatus="status">
		ReinstatementDeptCount[iNum]='${dept.get("count") }';               
		ReinstatementDeptName[iNum]= '${dept.get("dept_nm") }';
		iNum++;
	</c:forEach>
	

    
    
   
   Morris.Donut({
        element: 'doughnut-chart',
        data: [
          {value:studStatusGet0, label: '재학생'+${studStatus.get(0)}+'명'},
          {value: studStatusGet1, label: '휴학생'+${studStatus.get(1)}+'명'},
          {value: studStatusGet2, label: '자퇴생'+${studStatus.get(2)}+'명'},
          {value:studStatusGet3, label: '제적생'+${studStatus.get(3)}+'명'}
        ],
        colors:['#FF3835','#515151','#6C76FF','#ddd'],
        formatter: function (x) { return x + "%"}
      }).on('click', function(i, row){
        console.log(i, row);
      });

      Morris.Bar({
        element: 'bar-chart',
        data: [
               {x: deptNmArray[0], y: deptProfCountArray[0]},
               {x: deptNmArray[1], y: deptProfCountArray[1]},
               {x: deptNmArray[2], y: deptProfCountArray[2]},
               {x: deptNmArray[3], y: deptProfCountArray[3]},
               {x: deptNmArray[4], y: deptProfCountArray[4]},
               {x: deptNmArray[5], y: deptProfCountArray[5]},
               {x: deptNmArray[6], y: deptProfCountArray[6]},
               {x: deptNmArray[7], y: deptProfCountArray[7]},
               {x: deptNmArray[8], y: deptProfCountArray[8]},
               {x: deptNmArray[9], y: deptProfCountArray[9]}
        ],
        xkey: 'x',
        ykeys: ['y'],
        labels: ['교수수'],
        barColors: ['#B2CCFF']
      }).on('click', function(i, row){
        console.log(i, row);
      });
      
      Morris.Bar({
          element: 'deptLeave-chart',
          data: [
                 {x: leaveDeptName[0], y: leaveDeptCount[0]},
                 {x: leaveDeptName[1], y: leaveDeptCount[1]},
                 {x: leaveDeptName[2], y: leaveDeptCount[2]},
                 {x: leaveDeptName[3], y: leaveDeptCount[3]},
                 {x: leaveDeptName[4], y: leaveDeptCount[4]},
                 {x: leaveDeptName[5], y: leaveDeptCount[5]},
                 {x: leaveDeptName[6], y: leaveDeptCount[6]},
                 {x: leaveDeptName[7], y: leaveDeptCount[7]},
                 {x: leaveDeptName[8], y: leaveDeptCount[8]},
                 {x: leaveDeptName[9], y: leaveDeptCount[9]}
                 
          ],
          xkey: 'x',
          ykeys: ['y'],
          labels: ['휴학생수'],
          barColors: ['#FFE400']
        }).on('click', function(i, row){
          console.log(i, row);
        });
      
      
      //자퇴한 학생의 수와 학과
      Morris.Bar({
          element: 'deptDropOff-chart',
          data: [
                 {x: dropOffName[0], y: dropOffDeptCount[0]},
                 {x: dropOffName[1], y: dropOffDeptCount[1]},
                 {x: dropOffName[2], y: dropOffDeptCount[2]},
                 {x: dropOffName[3], y: dropOffDeptCount[3]},
                 {x: dropOffName[4], y: dropOffDeptCount[4]},
                 {x: dropOffName[5], y: dropOffDeptCount[5]},
                 {x: dropOffName[6], y: dropOffDeptCount[6]},
                 {x: dropOffName[7], y: dropOffDeptCount[7]},
                 {x: dropOffName[8], y: dropOffDeptCount[8]},
                 {x: dropOffName[9], y: dropOffDeptCount[9]}
                 
          ],
          xkey: 'x',
          ykeys: ['y'],
          labels: ['자퇴학생수'],
          barColors: ['#F15F5F']
        }).on('click', function(i, row){
          console.log(i, row);
        });
      
      //복학한 학생의 수와 학과
      Morris.Bar({
          element: 'Reinstatement-chart',
          data: [
                 {x: ReinstatementDeptName[0], y: ReinstatementDeptCount[0]},
                 {x: ReinstatementDeptName[1], y: ReinstatementDeptCount[1]},
                 {x: ReinstatementDeptName[2], y: ReinstatementDeptCount[2]},
                 {x: ReinstatementDeptName[3], y: ReinstatementDeptCount[3]},
                 {x: ReinstatementDeptName[4], y: ReinstatementDeptCount[4]},
                 {x: ReinstatementDeptName[5], y: ReinstatementDeptCount[5]},
                 {x: ReinstatementDeptName[6], y: ReinstatementDeptCount[6]},
                 {x: ReinstatementDeptName[7], y: ReinstatementDeptCount[7]},
                 {x: ReinstatementDeptName[8], y: ReinstatementDeptCount[8]},
                 {x: ReinstatementDeptName[9], y: ReinstatementDeptCount[9]}
                 
          ],
          xkey: 'x',
          ykeys: ['y'],
          labels: ['복학학생수'],
          barColors: ['#D1B2FF']
        }).on('click', function(i, row){
          console.log(i, row);
        });
    
    
});
</script>
