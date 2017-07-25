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
<<<<<<< HEAD
   <!-- 개인정보 -->
   <div class="col-md-2">
      <div class="panel panel-default">
         <div class="panel-heading" style="background-color: #2196F3;">
            <h4 class="panel-title" style="color: #ffffff;">개인정보</h4>
         </div>
         <!-- 내용 -->
         <div class="panel-body" style="height: 260px;">
            <img src="http://placehold.it/150x75">
         </div>
      </div>
   </div>
   <!-- 학생수 -->
   <div class="col-md-3">
      <div class="panel panel-default">
         <div class="panel-heading" style="background-color: #2196F3;">
            <h4 class="panel-title" style="color: #ffffff;">학생 현황</h4>
         </div>
         <!-- 내용 -->
         <div class="panel-body" style="height: 260px;">
               <div id="doughnut-chart" style="width: 80%; height: 80%" ></div>
         </div>
      </div>
   </div>
   <!-- 휴학현황 -->
   <div class="col-md-3">
      <div class="panel panel-default">
         <div class="panel-heading" style="background-color: #2196F3;">
            <h4 class="panel-title" style="color: #ffffff;">휴학 현황</h4>
         </div>
         <!-- 내용 -->
         <div class="panel-body" style="height: 260px;">
         </div>
      </div>
   </div>
   <!-- 복학현황 -->
   <div class="col-md-3">
      <div class="panel panel-default">
         <div class="panel-heading" style="background-color: #2196F3;">
            <h4 class="panel-title" style="color: #ffffff;">복학 현황</h4>
         </div>
         <!-- 내용 -->
         <div class="panel-body" style="height: 260px;"></div>
      </div>
   </div>
   
   <!-- 개인일정 -->
   <div class="col-md-2">
      <div class="panel panel-default">
         <div class="panel-heading" style="background-color: #2196F3;">
            <h4 class="panel-title" style="color: #ffffff;">개인일정</h4>
         </div>
         <!-- 내용 -->
         <div class="panel-body" style="height: 260px;">
            <div id='calendar'></div>
         </div>
      </div>
   </div>
   <!-- 자퇴현황 -->
   <div class="col-md-3">
      <div class="panel panel-default">
         <div class="panel-heading" style="background-color: #2196F3;">
            <h4 class="panel-title" style="color: #ffffff;">자퇴 현황</h4>
         </div>
         <!-- 내용 -->
         <div class="panel-body" style="height: 260px;"></div>
      </div>
   </div>
   <!-- 장학현황 -->
   <div class="col-md-3">
      <div class="panel panel-default">
         <div class="panel-heading" style="background-color: #2196F3;">
            <h4 class="panel-title" style="color: #ffffff;">장학현황</h4>
         </div>
         <!-- 내용 -->
         <div class="panel-body" style="height: 260px;"></div>
      </div>
   </div>
   <!-- 교수현황 -->
   <div class="col-md-3">
      <div class="panel panel-default">
         <div class="panel-heading" style="background-color: #2196F3;">
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
    
    var deptNmArray = new Array(9);//학과이름
    var deptProfCountArray = new Array(9);//학과당 교수의 수
    var iNum = 0;
    <c:forEach var="dept" items="${prfsOfDeptList }"  varStatus="status">
       deptNmArray[iNum]="${dept.dept_nm }";               
       deptProfCountArray[iNum]= "${dept.count }";
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
               {x: deptNmArray[8], y: deptProfCountArray[8]}
               
        ],
        xkey: 'x',
        ykeys: ['y'],
        labels: ['교수의수'],
        barColors: ['#FF3835','#515151','#6C76FF']
      }).on('click', function(i, row){
        console.log(i, row);
      });
      
    
});
</script>
