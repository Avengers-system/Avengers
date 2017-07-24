<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Content -->

<div class="panel-body">
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
	<!-- 수강현황 -->
	<div class="col-md-5">
		<div class="panel panel-default">
			<div class="panel-heading" style="background-color: #2196F3;">
				<h4 class="panel-title" style="color: #ffffff;">강의 현황</h4>
			</div>
			<!-- 내용 -->
			<div class="panel-body" style="height: 260px;"></div>
		</div>
	</div>
	<!-- 상담현황 -->
	<div class="col-md-5">
		<div class="panel panel-default">
			<div class="panel-heading" style="background-color: #2196F3;">
				<h4 class="panel-title" style="color: #ffffff;">상담 현황</h4>
			</div>
			<!-- 내용 -->
			<div class="panel-body" style="height: 260px;"></div>
		</div>
	</div>
	<!-- 개인일정 -->
	<div class="col-md-2">
		<div class="panel panel-default">
			<div class="panel-heading" style="background-color: #2196F3;">
				<h4 class="panel-title" style="color: #ffffff;">개인 일정</h4>
			</div>
			<!-- 내용 -->
			<div class="panel-body" style="height: 285px;"></div>
		</div>
	</div>
	<!-- 게시판 -->
	<div class="col-md-10">

		<ul id="tabs-demo4" class="nav nav-tabs nav-tabs-v3" role="tablist"
			style="padding-top: 0; font-size: 15px;">
			<li role="presentation" class="active"><a
				href="#tabs-demo4-area1" id="tabs-demo4-1" role="tab"
				data-toggle="tab" aria-expanded="true">학교공지</a></li>
			<li role="presentation" class=""><a href="#tabs-demo4-area2"
				role="tab" id="tabs-demo4-2" data-toggle="tab" aria-expanded="true">학과공지</a>
			</li>
			<li role="presentation"><a href="#tabs-demo4-area3"
				id="tabs-demo4-3" role="tab" data-toggle="tab" aria-expanded="true">포털소식</a>
			</li>
		</ul>
		<div id="tabsDemo4Content" class="tab-content tab-content-v3">
			<!-- 학교공지 -->
			<div role="tabpanel" class="tab-pane fade active in"
				id="tabs-demo4-area1" aria-labelledby="tabs-demo4-area1"
				style="height: 290px;">
				<p>학교공지</p>
			</div>
			<!-- 학과공지 -->
			<div role="tabpanel" class="tab-pane fade" id="tabs-demo4-area2"
				aria-labelledby="tabs-demo4-area2" style="height: 290px;">
				<p>학과공지</p>
			</div>
			<!-- 포털소식 -->
			<div role="tabpanel" class="tab-pane fade" id="tabs-demo4-area3"
				aria-labelledby="tabs-demo4-area3" style="height: 290px;">
				<p>포털소식</p>
			</div>
		</div>
	</div>
</div>
