<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="col-md-2">
	<a href="${pageContext.request.contextPath}/student/classManage/classMain">
		<div style="height: 40px; background-color: #2196F3; color: #fff; border-radius: 5px; font-size: 15px; text-align: center; padding-top: 8px; margin-top: 10px;">강의목록</div>
		</a>
	<!-- a 태그에 URL 적고 div 사이에 메뉴 이름을 적는다.  ${pageContext.request.contextPath}-->
	<a href="${pageContext.request.contextPath}/student/classManage/lectureDetail">
		<div style="height: 40px; background-color: #2196F3; color: #fff; border-radius: 5px; font-size: 15px; text-align: center; padding-top: 8px; margin-top: 10px;">강의계획서</div>
	</a>
	<a href="${pageContext.request.contextPath}/student/classManage/lectureExam">
		<div style="height: 40px; background-color: #2196F3; color: #fff; border-radius: 5px; font-size: 15px; text-align: center; padding-top: 8px; margin-top: 10px;">
			시험관리
		</div>
	</a>
	<a href="${pageContext.request.contextPath}/student/classManage/lectureAsgn">
		<div style="height: 40px; background-color: #2196F3; color: #fff; border-radius: 5px; font-size: 15px; text-align: center; padding-top: 8px; margin-top: 10px;">
			과제관리
		</div>
	</a>
</div>