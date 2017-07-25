<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
	$(function(){
		$(".tree-toggle").click(function(){
			if($(this).next(".tree").css("display")=="none"){
				$(this).next(".tree").css("color","black").slideDown();
			} else {
				$(this).next(".tree").slideUp();
			}
		})
	})
</script>
<!-- <div class="col-xs-12"> -->
<!-- 	<div id="classMainLecture"> -->
		
<%-- 		<a href="${pageContext.request.contextPath}/professor/classManage/lectureDetail">강의계획서</a><br/> --%>
<%-- 		<a href="${pageContext.request.contextPath}/professor/classManage/lectureExam">시험관리</a><br/> --%>
		
<!-- 	</div> -->
<!-- </div> -->

<div class="col-xs-12">    
      <div class="sub-left-menu scroll" tabindex="5000" style="overflow: hidden; outline: none;">
                <ul class="nav nav-list">
                    <li>
                          <div class="left-bg"></div>   
                    </li>
                    <li class="time">
                            <h1 class="animated fadeInLeft">16:47</h1>
                            <p class="animated fadeInRight">Thursday, July 20th 2017</p>
                    </li>
                    <li class="active ripple">
						<a class="tree-toggle nav-header"> 강의목록
						  <span class="fa-angle-right fa right-arrow text-right"></span>
						</a>
						<ul class="nav nav-list tree" style="display: none;">
							<li><a class="nav-header" href="${pageContext.request.contextPath}/professor/classManage/classMain">--강의목록</a></li>
					</ul>
                    </li>
                    <li class="ripple">
                      <a class="tree-toggle nav-header"> 강의계획서
                        <span class="fa-angle-right fa right-arrow text-right"></span>
                      </a>
                    </li>
                    <li class="ripple">
                      <a class="tree-toggle nav-header"> 시험관리
                    </a>
                      <ul class="nav nav-list tree" style="display: none;">
                        <li><a href="${pageContext.request.contextPath}/admin/faqNoticeList">FAQ</a></li>
                      </ul>
                    </li>
                    <li class="ripple">
                       <a class="tree-toggle nav-header">과제관리
                       		<span class="fa-angle-right fa right-arrow text-right"></span> 
                       </a>
                       <ul class="nav nav-list tree" style="display: none;">
                           <li><a href="${pageContext.request.contextPath}/professor/classManage/lectureAsgnMain">--과제관리</a></li>
                       </ul>
                    </li>
                  </ul>
                </div>
</div>