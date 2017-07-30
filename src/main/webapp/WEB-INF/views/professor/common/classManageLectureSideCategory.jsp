<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
	$(function(){
		$(".tree-toggle").click(function(){
			if($(this).next(".tree").css("display")=="none"){
				$(this).next(".tree").css("color","black").slideDown();
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
<div class="col-md-2">
	<!-- a 태그에 URL 적고 div 사이에 메뉴 이름을 적는다.  ${pageContext.request.contextPath}-->
	<a href="${pageContext.request.contextPath}/professor/classManage/classMain">
		<div style="height: 40px; background-color: #666666; color: #fff; border-radius: 5px; font-size: 15px; text-align: center; padding-top: 8px; margin-top: 10px;">
			강의목록</div>
	</a>
	<a href="${pageContext.request.contextPath }/professor/classManage/lectureDetail">
		<div style="height: 40px; background-color: #666666; color: #fff; border-radius: 5px; font-size: 15px; text-align: center; padding-top: 8px; margin-top: 10px;">
			강의계획서
		</div>
	</a>
	<a href="${pageContext.request.contextPath}/professor/classManage/lectureExam">
		<div style="height: 40px; background-color: #666666; color: #fff; border-radius: 5px; font-size: 15px; text-align: center; padding-top: 8px; margin-top: 10px;">
			시험조회
		</div>
	</a>
	<a href="${pageContext.request.contextPath}/professor/classManage/lectureAsgnMain">
		<div style="height: 40px; background-color: #666666; color: #fff; border-radius: 5px; font-size: 15px; text-align: center; padding-top: 8px; margin-top: 10px;">
			과제관리
		</div>
	</a>
</div>