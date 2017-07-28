<%@page import="com.avengers.admin.mypage.service.AdminMypageService"%>
<%@page import="com.avengers.db.dto.PerschdVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.List"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


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
<!-- Content -->
<!-- side menu -->
<%@include file="../common/myPageSideCategory.jsp"%>
<!--  Counsel Right Side -->
<link href="${pageContext.request.contextPath}/resources/sweetalert/sweetalert.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/sweetalert/sweetalert.min.js"></script>
<div class="col-md-10">
   <div class="panel panel-default">
      <div class="panel-heading" style="background-color: #CC0000;  margin-top: 10px;">
         <h4 style="color: #fff; font-weight: bold; font-size: 20px;">
            개인일정
         </h4>
      </div>
      <div class="panel-body" style="height: 580px; text-align: center;" >
         <div class="col-md-3 col-md-offset-9" style="padding-left:0px;">
            <a href="#" class="button" data-toggle="modal" data-target="#addSchedule">일정등록 </a>
         </div>
         <div id='calendar'></div>
      </div>
   </div>
</div>
<script>
 
   $(function() {
      swal("Here's a message!");
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
                 number : '<%=perschdVO.getPerschd_num()%>',
                 title: '<%=perschdVO.getPerschd_title() %>',
                  start:'<%=perschdVO.getPerschd_start_date() %>',
                  end:'<%=perschdVO.getPerschd_end_date() %>',
                  content:'<%=perschdVO.getPerschd_cont() %>',
                 time:'<%=perschdVO.getPerschd_date() %>'
              }
              
                   <%
                   System.out.println(perschdVO.getPerschd_end_date()+"!!!");
                     }
                   %> 
         ],
         eventClick:function(event) {
            alert(event.number);
            $.ajax({
               url  : 'myScheduleDetail',
               type : 'post',
               data : "perschd_num="+event.number,
               success : function(perschd){                  
               $('#perschd_num').val(event.number);
               $('#perschd_writer').val(perschd.perschd_writer);
               $('#perschd_title').val(perschd.perschd_title);
               $('#perschd_start_date').val(perschd.perschd_start_date);
               $('#perschd_end_date').val(perschd.perschd_end_date);
               $('#perschd_cont').val(perschd.perschd_cont);
//                $('#perschd_date').val(perschd.perschd_date);
               
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


<!-- 상세보기&수정 모달 -->

<div class="modal fade" id="editSchedule">
      <div class="modal-dialog">
         <div class="modal-content">
            <div class="modal-header">
               <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
               </button>
               <h4 class="modal-title">일정 상세보기</h4>
            </div>
            <div class="modal-body">
               <div class="row"> 
                        <div class="col-md-12">
                        <div class="col-md-8 col-md-offset-2">
                        <form action="myScheduleUpdate" method="POST" name="myForm" >
                        
                        <ul>
                           <input id="perschd_num" type="text" class="form-control" name="perschd_num" value="" >
                           <input id="perschd_writer" type="hidden"  name="perschd_writer" value="" class="form-control" >
                           <li>
                              <label class='control-label'>title</label>
                           <input id="perschd_title" type="text" class="form-control" name="perschd_title" value="" >
                           </li>
                           <li>
                              <label class='control-label'>start date</label>
                           <input id="perschd_start_date" type="text"  name="perschd_start_date" value="" class="form-control" >
                           </li>
                           <li>
                              <label class='control-label'>end date</label>
                           <input  id="perschd_end_date" type="text"  name="perschd_end_date" value="" class="form-control">
                           </li>
                           <li>
                              <label class='control-label'>content</label>
                           <input id="perschd_cont" type="text" name="perschd_cont" value="" class="form-control" >
                           </li>
<!--                            <li> -->
<!--                               <label class='control-label'>date</label> -->
<!--                            <input id="perschd_date" type="text" name="perschd_date" value="" class="form-control" > -->
<!--                            </li> -->
                     </ul>
                     </form>
                     </div>
                      
                         <!-- button -->
                          <div class="col-md-12">  
                                 <div class="modal-footer">
                                 <div class="col-md-8 col-md-offset-1">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
<%--                                     <button type="button" onclick="location.href='myScheduleDelete?perschd_num=${perschd.perschd_num}" class="btn btn-default" >삭제</button> --%>
                                    <input type="submit" class="btn btn-primary">
                                    <input type="button" value="삭제" onclick="deleteSchd()"/>
                                 </div>
                                 </div>
                           </div>
<!--                      </form> -->
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
                        <form name="insertFrm" action="myScheduleInsert" method="POST">
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
