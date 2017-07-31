<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@include file="../common/studHelpDeskSide.jsp"%>

<div class="col-md-10">
	<div class="panel panel-default">
		<div class="panel-heading"
			style="background-color: #2196F3; margin-top: 0px;">
			<h4 style="color: #fff; font-weight: bold; font-size: 20px;">
				<!-- 제목 -->
				FAQ
			</h4>
		</div>
		<div class="panel-body" style="height: 800px; text-align: left;">
			<!-- 		내용 -->
			글번호 : ${detail.board_num}<br> 제목 : ${detail.board_title}<br>
			내용 : ${detail.board_cont}<br> 작성자 : ${detail.board_writer}<br>
			<form action="${pageContext.request.contextPath}/download"
				method="post">
				<sec:authorize access="hasRole('ROLE_WSS')">
첨부파일 : ${detail.board_aff} <input type="submit" value="다운">
				</sec:authorize>
				<input type="hidden" name="board_af" value="${detail.board_af}">
			</form>


			<form
				action="${pageContext.request.contextPath}/student/helpDesk/studentFAQList"
				method="post">
				<input type="submit" value="목록"> <input type="hidden"
					name="pageNo" value="${pageNo}">
			</form>

			<br>
		</div>

	</div>
</div>

