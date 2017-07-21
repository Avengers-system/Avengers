<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<style>
div.sub-left-menu scroll>ul li>a.tree-toggle nav-header{margin-left:30px;}
</style>


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
                      <a class="tree-toggle nav-header"> Dashboard 
                        <span class="fa-angle-right fa right-arrow text-right"></span>
                      </a>
                      <ul class="nav nav-list tree" style="display: none;">
                          <li><a href="dashboard-v1.html">Dashboard v.1</a></li>
                      </ul>
                    </li>
                    <li class="ripple">
                      <a class="tree-toggle nav-header">
                         Q&A
                        <span class="fa-angle-right fa right-arrow text-right"></span>
                      </a>
                      <ul class="nav nav-list tree" style="display: none;">
                        <li><a href="${pageContext.request.contextPath}/admin/qnaNoticeList">Q&A</a></li>
                      </ul>
                    </li>
                    <li class="ripple">
                      <a class="tree-toggle nav-header">
                        FAQ
                  </a>
                      <ul class="nav nav-list tree" style="display: none;">
                        <li><a href="${pageContext.request.contextPath}/admin/faqNoticeList">FAQ</a></li>
                      </ul>
                    </li>
                    <li class="ripple">
                       <a class="tree-toggle nav-header">
                          학과게시판<span class="fa-angle-right fa right-arrow text-right"></span> 
                       </a>
                      
                       <ul class="nav nav-list tree" style="display: none;">
                           <li><a href="color.html">Color</a></li>
                           <li><a href="${pageContext.request.contextPath}/admin/deptNoticeList">학과게시판 &amp; Tooltip</a></li>
                       </ul>
                    </li>
                    <li class="ripple"><a class="tree-toggle nav-header">
                    
                          포털게시판<span class="fa-angle-right fa right-arrow text-right"></span> </a>
                      <ul class="nav nav-list tree" style="display: none;">
                        <li><a href="formelement.html">Form Element</a></li>
                        <li><a href="${pageContext.request.contextPath}/admin/portalNoticeList">포털게시판</a></li>
                      </ul>
                    </li>
                    <li class="ripple"><a class="tree-toggle nav-header">
                    학과게시판  <span class="fa-angle-right fa right-arrow text-right"></span> </a>
                      <ul class="nav nav-list tree" style="display: none;">
                        <li><a href="${pageContext.request.contextPath}/admin/deptNoticeList">학과게시판</a></li>
                      </ul>
                    </li>
                     <li class="ripple"><a class="tree-toggle nav-header">
                     학부게시판  <span class="fa-angle-right fa right-arrow text-right"></span> </a>
                      <ul class="nav nav-list tree" style="display: none;">
                        <li><a href="${pageContext.request.contextPath}/admin/collegeNoticeList">학부게시판</a></li>
                      </ul>
                    </li>
                  </ul>
                </div>
</div>

 
