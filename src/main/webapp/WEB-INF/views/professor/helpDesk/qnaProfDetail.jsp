<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../common/profHelpDeskSide.jsp"%>

<div class="col-md-10">
	<div class="panel panel-default">
		<!--  메뉴제목 -->
		<div class="panel-heading"
			style="background-color: #666666; margin-top: 0px;">
			<h4 style="color: #fff; font-weight: bold; font-size: 20px;">

				Q&A</h4>
		</div>
		<div class="panel-body" style="height: 800px; text-align: center;">
			<c:choose>
				<c:when test="${not empty qnaProfNoticeList}">
					<form name="updateQnaProfBoard" action="qnaProfUpdate">

						숫자:<input type="text" name="board_num"
							value="${qnaProfNoticeList.board_num}" readonly><br>
						제목:<input type="text" name="board_title"
							value="${qnaProfNoticeList.board_title}"><br> 내용:<input
							type="text" name="board_cont"
							value="${qnaProfNoticeList.board_cont}"><br> 작성자:<input
							type="text" name="board_writer"
							value="${qnaProfNoticeList.board_writer}" readonly><br>
						게시판코드:<input type="text" name="board_bc"
							value="${qnaProfNoticeList.board_bc}" readonly><br>
						<input type="submit" value="수정"> <a
							href="qnaProfDelete?board_num=${qnaProfNoticeList.board_num}"><input
							type="button" value="삭제"></a> <input type="button"
							value="목록으로" onclick="history.go(-1)">
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





