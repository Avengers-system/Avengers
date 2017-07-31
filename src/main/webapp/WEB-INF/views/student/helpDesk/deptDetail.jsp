<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@include file="../common/studHelpDeskSide.jsp"%>

<style>
form[name='insertUnivBoard'] {
	margin-top: 50px;
}

input {
	border: 1px none white;
}

input[type='text'], #board_cont {
	width: 350px;
}

div.row {
	margin-bottom: 20px;
}
</style>

<div class="col-md-10">
	<div class="panel panel-default">
		<!--  메뉴제목 -->
		<div class="panel-heading"
			style="background-color: #2196F3; margin-top: 10px;">
			<h4 style="color: #fff; font-weight: bold; font-size: 20px;">

				학과소식</h4>
		</div>
		<div class="panel-body" style="height: 580px; text-align: left;">
			<c:set var="myContextPath" value="${pageContext.request.contextPath}" />
			<c:choose>
				<c:when test="${not empty deptNoticeList}">
					<form name="updateDeptBoard" action="deptStudUpdate" method="post"
						enctype="multipart/form-data">

						<input type="hidden" name="board_num"
							value="${deptNoticeList.board_num}"><br>

						<!-- 제목 -->
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<label class="col-sm-2 control-label text-right"
										style="padding-top: 8px;"> <strong>제목</strong></label>
									<div class="col-sm-8">
										<input type="text" name="board_title"
											value="${deptNoticeList.board_title}" style="width: 800px;">
									</div>
								</div>
							</div>
						</div>



						<!-- 내용 -->
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<label class="col-sm-2 control-label text-right"
										style="padding-top: 8px;"> <strong>내용</strong></label>
									<div class="col-sm-8">
										<textarea id="board_cont" name="board_cont" class="form-control" rows="5"
											style="height: 220px; width: 800px;" >${deptNoticeList.board_cont}</textarea>
									</div>
								</div>
							</div>
						</div>

						<!-- 작성자 -->
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<label class="col-sm-2 control-label text-right"
										style="padding-top: 8px;"> <strong>작성자</strong></label>
									<div class="col-sm-8">
										<input type="text" name="board_writer"
											value="${deptNoticeList.board_writer}" style="width: 800px;" readonly>
									</div>
								</div>
							</div>
						</div>

						<!-- 첨부파일 -->
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<label class="col-sm-2 control-label text-right"><strong>첨부파일</strong></label>
									<div class="col-sm-8">
										<a
											href="<%=request.getContextPath()%>/student/helpDesk/main/download?fileName=${deptNoticeList.board_af}&board_num=${board_num}"
											style="text-decoration: underline;">
											${deptNoticeList.board_af} </a>
									</div>
								</div>
							</div>
						</div>

						<sec:authorize access="hasRole('ROLE_WSS')">

							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label class="col-sm-2 control-label text-right"
											style="padding-top: 8px;"> <strong>첨부파일</strong></label>
										<div class="col-sm-8">
											<input type="file" name="boardtoa"
												value="${deptNoticeList.board_af}">
										</div>
									</div>
								</div>
							</div>

						</sec:authorize>

						<div class="row" style="width: 1200px;">
							<sec:authorize access="hasRole('ROLE_WSS')">
								<div class="col-md-12 col-md-offset-6"
									style="width: 0px; margin-left: 240px; margin-right: 0px; margin-top: 0px;">
									<input type="submit" class="btn btn-stud" value="수정">
								</div>

								<div class="col-md-12 col-md-offset-6"
									style="float: left; margin-top: 0px; width: 0px; margin-right: 0px; margin-left: 48px;">
									<a
										href="${pageContext.request.contextPath}/student/helpDesk/deptStudDelete?board_num=${deptNoticeList.board_num}">
										<input type="button" class="btn btn-stud" value="삭제">
									</a>
								</div>
							</sec:authorize>

<div class="col-md-12 col-md-offset-6"
									style="float: left; margin-top: 0px; width: 0px; margin-right: 0px;margin-left: 594px;">
							<input type="button" value="목록으로" class="btn btn-stud" onclick="history.go(-1)"></div>
						</div>
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

