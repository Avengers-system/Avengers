<%@page import="org.springframework.security.core.userdetails.User"%>
<%@page
   import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../common/helpDesk_leftSide.jsp"%>

<style>

 
form[name='insertUnivBoard']{
margin-top:50px;
}

input[type='text'], #board_cont{
 width : 500px;
}
   
div.row{
margin-bottom:20px;
}
</style>

<div class="col-md-10">
   <div class="panel panel-default">
      <!--  메뉴제목 -->
      <div class="panel-heading"
         style="background-color: #CC0000; margin-top: 10px;">
         <h4 style="color: #fff; font-weight: bold; font-size: 20px;">

            학교소식글쓰기</h4>
      </div>
      <div class="panel-body" style="height: 580px; text-align: left;">

         <c:set var="myContextPath" value="${pageContext.request.contextPath}" />
         
         <form name="insertUnivBoard" action="${myContextPath}/admin/univWrite" method="post"   enctype="multipart/form-data">

<!-- 게시판번호: --><input type="hidden" name="board_num" value="${insertBoard.board_num}"><br> 
               
               <div class="row">               
                              <div class="col-md-12">
                                 <div class="form-group">
                                    <label class="col-sm-2 control-label text-right" style="  padding-top: 8px;"><strong>제목</strong></label>
                                    <div class="col-sm-8">
                                       <input type="text" name="board_title">
                                    </div>
                                 </div>
                              </div>
               </div>               
<!--                내용 :<input -->
<!--                type="text" name="board_cont"><br> -->
                  
                  <div class="row">   
                  <div class="col-md-12">
                      <div class="form-group">
                        <label class="col-sm-2 control-label text-right" style="  padding-top: 8px;"><strong>내용</strong></label>
                        <div class="col-sm-8">
                        <textarea name="board_cont" class="form-control" rows="5" id="board_cont"></textarea>
                        </div>
                      </div>
                  </div>
                  </div>
            

            <%
               User user = (User) SecurityContextHolder.getContext()
                     .getAuthentication().getPrincipal();
            %>
            
            <div class="row">   
                  <div class="col-md-12">
                     <div class="form-group">
                        <label class="col-sm-2 control-label text-right" style="  padding-top: 8px;"><strong>작성자</strong></label> 
                        <div class="col-sm-8">
                           <input type="text" name="board_writer" readonly  value="<%=user.getUsername()%>">
                        </div>
                     </div>
                  </div>
            </div>
            <div class="row">   
                  <div class="col-md-12">
                     <div class="form-group">
                        <strong><label class="col-sm-2 control-label text-right" ><strong>첨부파일</strong></label>
                        <div class="col-sm-8">
                           <input type="file" name="boardaf" >
                        </div>
                     </div>
                  </div>
            </div>
            
                        <!--  게시판코드 : hidden--> 
                           <input type="hidden" name="board_bc" value="UNIV">
                           
                           
                           
                        <!--  조회수 : hidden--> 
<!--                         <label class="col-sm-2 control-label text-right">조회수</label> -->
                           <input type="hidden" name="board_count" readonly value="0">
            <div class="row">   
                   <div class="col-md-12 col-md-offset-6">
                      <input type="submit" class="btn btn-danger" value="등록"> 
                  </div>
            </div>
            
         </form>
      </div>
   </div>
</div>

