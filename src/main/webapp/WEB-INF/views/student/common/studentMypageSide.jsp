<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="col-md-2">

	<!-- a 태그에 URL 적고 div 사이에 메뉴 이름을 적는다.  ${pageContext.request.contextPath}-->
	<a href="${pageContext.request.contextPath}/student/mypage/myInfo">
		<div style="height: 40px; background-color: #2196F3; color: #fff; border-radius: 5px; font-size: 15px; text-align: center; padding-top: 8px; margin-top: 10px;">
			개인정보</div>
	</a>
	<a href="${pageContext.request.contextPath}/student/mypage/mySchedule">
		<div style="height: 40px; background-color: #2196F3; color: #fff; border-radius: 5px; font-size: 15px; text-align: center; padding-top: 8px; margin-top: 10px;">
			개인일정관리
		</div>
	</a>
	
</div>