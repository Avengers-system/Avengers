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
			<h4 style="color: #fff; font-weight: bold; font-size: 20px;">학생
				FAQ상세보기</h4>
		</div>

		<!-- 내용시작 -->
		<div class="panel-body" style="height: 580px; text-align: left;">
			<c:choose>
				<c:when test="${not empty faqNoticeList}">
					<form name="updatefaqBoard" action="faqUpdate">

						숫자:<input type="text" name="board_num"
							value="${faqNoticeList.board_num}" readonly><br> 제목:<input
							type="text" name="board_title"
							value="${faqNoticeList.board_title}"><br> 내용:<input
							type="text" name="board_cont" value="${faqNoticeList.board_cont}"><br>
						작성자:<input type="text" name="board_writer"
							value="${faqNoticeList.board_writer}" readonly><br>
						게시판분류고유번호:<input type="text" name="board_bc"
							value="${faqNoticeList.board_bc}" readonly><br> <input
							type="submit" value="수정"> <a
							href="faqDelete?board_num=${faqNoticeList.board_num}"><input
							type="button" value="삭제"></a>
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
