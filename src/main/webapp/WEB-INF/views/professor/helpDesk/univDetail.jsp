<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@include file="../common/profHelpDeskSide.jsp"%>

<div class="col-md-10">
	<div class="panel panel-default">
		<div class="panel-heading"
			style="background-color: #666666; margin-top: 0px;">
			<h4 style="color: #fff; font-weight: bold; font-size: 20px;">
				<!-- 제목 -->
				학교소식
			</h4>
		</div>
		<div class="panel-body" style="height: 800px; text-align: left;">
			<!-- 		내용 -->
			<c:set var="myContextPath" value="${pageContext.request.contextPath}" />
			<c:choose>
				<c:when test="${not empty univNoticeList}">
					<form name="updateUnivBoard" action="univProfUpdate" method="post"
						enctype="multipart/form-data">

						번호:<input type="text" name="board_num"
							value="${univNoticeList.board_num}" readonly><br>
						제목:<input type="text" name="board_title"
							value="${univNoticeList.board_title}"><br> 내용:<input
							type="text" name="board_cont"
							value="${univNoticeList.board_cont}"><br> 작성자:<input
							type="text" name="board_writer"
							value="${univNoticeList.board_writer}" readonly><br>


						첨부파일다운:<a
							href="<%=request.getContextPath()%>/professor/helpDesk/main/download?fileName=

${univNoticeList.board_af}&board_num=${board_num}"
							style="text-decoration: underline;">
							${univNoticeList.board_af} </a><br>




						<sec:authorize access="hasRole('ROLE_ADMIN')">첨부할파일:<input
								type="file" name="boardtoa" value="${univNoticeList.board_af}">
							<br>
						</sec:authorize>
						게시판코드:<input type="text" name="board_bc"
							value="${univNoticeList.board_bc}" readonly><br>
						<sec:authorize access="hasRole('ROLE_ADMIN')">
							<input type="submit" value="수정">
							<a href="univProfDelete?board_num=${univNoticeList.board_num}"><input
								type="button" value="삭제"></a>
						</sec:authorize>
						<input type="button" value="목록으로" onclick="history.go(-1)">
					</form>


				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="5" style="text-align: center;">해당 내용이 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</div>

	</div>
</div>




