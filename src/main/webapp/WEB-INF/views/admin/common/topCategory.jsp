<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>

.nav-tabs>li>a {
	text-align: center;
    width: 200px;
    line-height: 1.42857143;
    border: 1px solid transparent;
    border-radius: 4px 4px 0 0;
}


</style>

<!-- StudentHeader -->
<div class="panel">
<div class="panel-body">
<div class="col-md-12" id="commonUserHeader">
	<div class="col-md-10 col-md-offset-1">
			<ul class="nav nav-tabs">
				<li role="presentation"><a href="${pageContext.request.contextPath}/admin/mypage/">My Page</a></li>
				<li role="presentation"><a href="${pageContext.request.contextPath}/admin/mypage/mySchedule">개인일정관리</a></li>
				<li role="presentation"><a href="${pageContext.request.contextPath}/admin/professorManage">교수관리</a></li>
				<li role="presentation"><a href="${pageContext.request.contextPath}/admin/studentManage">학생관리</a></li>
				<li role="presentation"><a href="${pageContext.request.contextPath}">강의관리</a></li>
				<li role="presentation"><a href="${pageContext.request.contextPath}/admin/main/helpDeskMain">HelpDesk</a></li>
			</ul>
	</div>
</div>
</div>
</div>

							
						
							