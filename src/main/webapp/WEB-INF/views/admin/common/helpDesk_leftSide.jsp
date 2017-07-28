<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
  
<style>

#commonRightSide{
margin-top:50px;

}

div.detailBtn>*{
	margin:0 auto;
}

div.input-group{
	width : 400px;
}

div.input-group>span.input-group-addon{
	width:120px;
}

</style>
    
    
<div class="col-md-2">

	<!-- a 태그에 URL 적고 div 사이에 메뉴 이름을 적는다.  ${pageContext.request.contextPath}-->
	<a href="${pageContext.request.contextPath}/admin/univSchd/univSchdedule">
		<div style="height: 40px; background-color: #CC0000; color: #fff; border-radius: 5px; font-size: 15px; text-align: center; padding-top: 8px; margin-top: 10px;">
			학사일정</div>
	</a>
	<a href="${pageContext.request.contextPath}/admin/univNoticeList">
		<div style="height: 40px; background-color: #CC0000; color: #fff; border-radius: 5px; font-size: 15px; text-align: center; padding-top: 8px; margin-top: 10px;">
			학교소식
		</div>
	</a>
	<a href="${pageContext.request.contextPath}/admin/deptNoticeList">
		<div style="height: 40px; background-color: #CC0000; color: #fff; border-radius: 5px; font-size: 15px; text-align: center; padding-top: 8px; margin-top: 10px;">
			학과소식
		</div>
	</a>
	<a href="${pageContext.request.contextPath}/admin/portalNoticeList">
		<div style="height: 40px; background-color: #CC0000; color: #fff; border-radius: 5px; font-size: 15px; text-align: center; padding-top: 8px; margin-top: 10px;">
			포털소식
		</div>
	</a>
	<a href="${pageContext.request.contextPath}/admin/qnaNoticeList">
		<div style="height: 40px; background-color: #CC0000; color: #fff; border-radius: 5px; font-size: 15px; text-align: center; padding-top: 8px; margin-top: 10px;">
			학생Q&A
		</div>
	</a>
	<a href="${pageContext.request.contextPath}/admin/qnaProfNoticeList">
		<div style="height: 40px; background-color: #CC0000; color: #fff; border-radius: 5px; font-size: 15px; text-align: center; padding-top: 8px; margin-top: 10px;">
			교수Q&A
		</div>
	</a>
	<a href="${pageContext.request.contextPath}/admin/faqNoticeList">
		<div style="height: 40px; background-color: #CC0000; color: #fff; border-radius: 5px; font-size: 15px; text-align: center; padding-top: 8px; margin-top: 10px;">
			학생FAQ
		</div>
	</a>
	<a href="${pageContext.request.contextPath}/admin/faqProfNoticeList">
		<div style="height: 40px; background-color: #CC0000; color: #fff; border-radius: 5px; font-size: 15px; text-align: center; padding-top: 8px; margin-top: 10px;">
			교수FAQ
		</div>
	</a>
</div>