<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="col-md-2">

	<!-- a 태그에 URL 적고 div 사이에 메뉴 이름을 적는다.  ${pageContext.request.contextPath}-->
	<a href="${pageContext.request.contextPath}/student/helpDesk/univStudNoticeList">
		<div style="height: 40px; background-color: #2196F3; color: #fff; border-radius: 5px; font-size: 15px; text-align: center; padding-top: 8px; margin-top: 10px;">
			학교공지사항</div>
	</a>
	<a href="${pageContext.request.contextPath}/student/helpDesk/deptStudNoticeList">
		<div style="height: 40px; background-color: #2196F3; color: #fff; border-radius: 5px; font-size: 15px; text-align: center; padding-top: 8px; margin-top: 10px;">
			학과게시판
		</div>
	</a>
	<a href="${pageContext.request.contextPath}/student/helpDesk/portalStudNoticeList">
		<div style="height: 40px; background-color: #2196F3; color: #fff; border-radius: 5px; font-size: 15px; text-align: center; padding-top: 8px; margin-top: 10px;">
			포털소식
		</div>
	</a>
	<a href="${pageContext.request.contextPath}/student/helpDesk/univSchd/univSchdedule">
		<div style="height: 40px; background-color: #2196F3; color: #fff; border-radius: 5px; font-size: 15px; text-align: center; padding-top: 8px; margin-top: 10px;">
			학사일정
		</div>
	</a>
	<a href="${pageContext.request.contextPath}/student/helpDesk/qnaStudNoticeList">
		<div style="height: 40px; background-color: #2196F3; color: #fff; border-radius: 5px; font-size: 15px; text-align: center; padding-top: 8px; margin-top: 10px;">
			Q&A
		</div>
	</a>
	<a href="${pageContext.request.contextPath}/student/helpDesk/studentFAQList">
		<div style="height: 40px; background-color: #2196F3; color: #fff; border-radius: 5px; font-size: 15px; text-align: center; padding-top: 8px; margin-top: 10px;">
			FAQ
		</div>
	</a>
</div>