<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
#left-menu{
	margin-top: 0;
}
</style>
<div id="col-xs-12 left-menu">
              <div class="sub-left-menu scroll" tabindex="5000" style="overflow: hidden; outline: none;">
                <ul class="nav nav-list">
                
                    <li class="time">
                      <h1 class="animated fadeInLeft">20:36</h1>
                      <p class="animated fadeInRight">Thursday, July 20th 2017</p>
                    </li>
                    
                    
                    <li class="active ripple"onclick="myInfo_go()">
                      <a class="tree-toggle nav-header">
                      <span class="fa-home fa" ></span> 개인정보 
                        <span class="fa-angle-right fa right-arrow text-right"></span>
                      </a>
                    </li>
                    
                    <li class="ripple" onclick="mySchedule_go()">
                      <a class="tree-toggle nav-header">
                        <span class="fa-diamond fa"></span> 개인일정관리
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