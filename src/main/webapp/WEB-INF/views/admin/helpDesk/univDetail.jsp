<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../common/helpDesk_leftSide.jsp"%>





<div class="col-md-10">
	<div class="panel panel-default">
		<!--  메뉴제목 -->
		<div class="panel-heading"
			style="background-color: #2196F3; margin-top: 10px;">
			<h4 style="color: #fff; font-weight: bold; font-size: 20px;">

				대학소식 상세보기</h4>
		</div>
		<!-- 내용시작 -->
		<div class="panel-body" style="height: 580px; text-align: left;">
			<c:set var="myContextPath" value="${pageContext.request.contextPath}" />
			<c:choose>
				<c:when test="${not empty univNoticeList}">
					<form name="updateUnivBoard" action="univUpdate" method="post"
						enctype="multipart/form-data">

						숫자:<input type="text" name="board_num"
							value="${univNoticeList.board_num}" readonly><br>
						제목:<input type="text" name="board_title"
							value="${univNoticeList.board_title}"><br> 내용:<input
							type="text" name="board_cont"
							value="${univNoticeList.board_cont}"><br> 작성자:<input
							type="text" name="board_writer"
							value="${univNoticeList.board_writer}" readonly><br>
						첨부된파일:<input type="text" name="board_af"
							value="${univNoticeList.board_af}"><br> 첨부할파일:<input
							type="file" name="boardtoa" value="${univNoticeList.board_af}"><br>
						게시판코드:<input type="text" name="board_bc"
							value="${univNoticeList.board_bc}" readonly><br> <input
							type="submit" value="수정"> <a
							href="univDelete?board_num=${univNoticeList.board_num}"><input
							type="button" value="삭제"></a>
							
							<a href="<%=request.getContextPath()%>/admin/main/download?fileName=${deptNoticeList.board_af}&board_num=${board_num}">다운</a>
							
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

