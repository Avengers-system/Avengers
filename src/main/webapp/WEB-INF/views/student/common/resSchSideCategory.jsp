<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
#left-menu{
	margin-top: 0;
}

	<input type="button" value="장학이력/신청조회" onclick="location.href='${pageContext.request.contextPath}/student/resSchManage/studRes'"/> 
	<input type="button" value="장학금신청" onclick="location.href='${pageContext.request.contextPath}/student/admissionApplication'"/> 	
	<input type="button" value="등록금이력조회" onclick="location.href='${pageContext.request.contextPath}/student/admissionApplication'"/> 
	<input type="button" value="등록금관리" onclick="location.href='${pageContext.request.contextPath}/student/admissionApplication'"/> 
</style>
<div id="col-xs-12 left-menu">
              <div class="sub-left-menu scroll" tabindex="5000" style="overflow: hidden; outline: none;">
                <ul class="nav nav-list">
                
                    <li class="time">
                      <h1 class="animated fadeInLeft">20:36</h1>
                      <p class="animated fadeInRight">Thursday, July 20th 2017</p>
                    </li>
                    
                    
                    <li class="active ripple"onclick="location.href='${pageContext.request.contextPath}/student/studRes'">
                      <a class="tree-toggle nav-header">
                      <span class="fa-home fa" ></span> 장학이력/신청조회 
                        <span class="fa-angle-right fa right-arrow text-right"></span>
                      </a>
                    </li>                    
                    <li class="ripple" onclick="location.href='${pageContext.request.contextPath}/student/'">
                      <a class="tree-toggle nav-header">
                        <span class="fa-diamond fa"></span> 장학금신청
                        <span class="fa-angle-right fa right-arrow text-right"></span>
                      </a>
                    </li>
                    <li class="ripple" onclick="mySchedule_go()">
                      <a class="tree-toggle nav-header">
                        <span class="fa-diamond fa"></span> 등록금이력조회
                        <span class="fa-angle-right fa right-arrow text-right"></span>
                      </a>
                    </li>
                    <li class="ripple" onclick="mySchedule_go()">
                      <a class="tree-toggle nav-header">
                        <span class="fa-diamond fa"></span> 등록금관리
                        <span class="fa-angle-right fa right-arrow text-right"></span>
                      </a>
                    </li>
                  </ul>
                </div>
            </div>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
function adminMain_go(){
  location.href="<%=request.getContextPath()%>/admin/main/adminMain";
  ${pageContext.request.contextPath}
  }
function logout_go(){
   location.href="<%=request.getContextPath()%>/common/logout";
   }
function myInfo_go(){
    location.href="<%=request.getContextPath()%>/admin/mypage/myInfo";
    }
function mySchedule_go(){
    location.href="<%=request.getContextPath()%>/admin/mypage/mySchedule";
	}
</script>
