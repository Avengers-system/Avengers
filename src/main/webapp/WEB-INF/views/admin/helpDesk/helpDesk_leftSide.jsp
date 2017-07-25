<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
div.sub-left-menu scroll>ul li>a.tree-toggle nav-header {
	margin-left: 30px;
}
</style>


<div class="col-xs-12">
	<div class="sub-left-menu scroll" tabindex="5000"
		style="overflow: hidden; outline: none;">
		<ul class="nav nav-list">
			<li>
				<div class="left-bg"></div>
			</li>
			<li class="time">
				<h1 class="animated fadeInLeft">16:47</h1>
				<p class="animated fadeInRight">Thursday, July 20th 2017</p>
			</li>

			<div style="margin-top: 20px; border: 20px F0F3F4 dotted;">
				<a
					href="${pageContext.request.contextPath}/admin/univSchd/univSchdedule">
					학사일정(풀캘린더)</a>
			</div>
			
			
			
			
			
			<div style="margin-top: 20px; border: 20px F0F3F4 dotted;">
				<a href="${pageContext.request.contextPath}/admin/univNoticeList">
					학교게시판</a><br>
			</div>

			<div style="margin-top: 20px; border: 20px F0F3F4 dotted;">
				<a href="${pageContext.request.contextPath}/admin/deptNoticeList">
					우리학과소식</a>
			</div>

			<div style="margin-top: 20px; border: 20px F0F3F4 dotted;">
				<a href="${pageContext.request.contextPath}/admin/portalNoticeList">
					포털소식</a>
			</div>



			<div style="margin-top: 20px; border: 20px F0F3F4 dotted;">
				<li class="ripple"><a class="tree-toggle nav-header">Q&A </a>
					<ul class="nav nav-list tree" style="display: none;">
						<li><a
							href="${pageContext.request.contextPath}/admin/qnaNoticeList">학생Q&A</a></li>
						<li><a
							href="${pageContext.request.contextPath}/admin/qnaProfNoticeList">교수Q&A</a></li>
					</ul></li>
			</div>

			<div style="margin-top: 20px; border: 20px F0F3F4 dotted;">
				<li class="ripple"><a class="tree-toggle nav-header"> FAQ </a>
					<ul class="nav nav-list tree" style="display: none;">
						<li><a
							href="${pageContext.request.contextPath}/admin/faqNoticeList">학생FAQ</a></li>
						<li><a
							href="${pageContext.request.contextPath}/admin/faqProfNoticeList">교수FAQ</a></li>
					</ul></li>
			</div>


		
		</ul>
	</div>
</div>

