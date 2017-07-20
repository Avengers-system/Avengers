<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
#userInformation{
	background-color: lightgray;
	height: 425px;
}
#userSchedule{
	background-color: lightgray;
	height: 425px;
}
#professorMainLectureInformation{
	background-color: lightgray;
	height: 425px;
}
#professorMainCounselInformation{
	background-color: lightgray;
	height:425px;
}
#professorMainCommonBoard{
	background-color: lightgray;
	height:425px;
}

</style>


<!-- Professor Header -->
<%@include file="common/topCategory.jsp"%>

<!-- Content -->
<div class="col-md-2" id="commonLeftSide">
	<%@include file="common/mainSideCategory.jsp" %>
</div>
<div class="col-md-10" id="commonRightSide">
							<div class="row">
							<div class="col-md-6">
								<div id="professorMainLectureInformation">
								<h6>강의정보</h6>
								<c:choose>
									<c:when test="${not empty lctList}">
										<c:forEach var="lct" items="${lctList }" varStatus="status">
											<tr>
												<td>강의번호:${lct.get("lct_num")}</td>
												<td>강의시간:${lct.get("lr_num")}</td>
												<td>강의날짜:${lct.get("lr_date")}</td>
												<td>강의실번호:${lct.get("lr_lct")}</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="5" style="text-align: center;">해당 내용이 없습니다.</td>
										</tr>
									</c:otherwise>
								</c:choose>
								</div>
							</div>
							<div class="col-md-6">
								<div id="professorMainCounselInformation">
								<h6>상담정보</h6>
								<c:choose>
									<c:when test="${not empty cnsList}">
										<c:forEach var="cns" items="${cnsList }">
											<tr>
												<td>상담번호:${cns.cns_num}</td>
												<td>상담종류:${cns.cns_kind}</td>
												<td>제목:${cns.cns_title}</td>
												<td>내용:${cns.cns_cont}</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="5" style="text-align: center;">해당 내용이 없습니다.</td>
										</tr>
									</c:otherwise>
								</c:choose>
								</div>
							</div>
							<div class="col-xs-12">
								<div id="professorMainCommonBoard">
								<h6>포탈공지</h6>
								<c:choose>
									<c:when test="${not empty portalNoticeList}">
										<c:forEach var="portal" items="${portalNoticeList }">
											<tr>
												<td>번호:${portal.board_num}</td>
												<td>제목:${portal.board_title}</td>
												<td>내용:${portal.board_cont}</td>
												<td>날짜:${portal.board_date}</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="5" style="text-align: center;">해당 내용이 없습니다.</td>
										</tr>
									</c:otherwise>
								</c:choose>
								<h6>학교공지</h6>
								<c:choose>
									<c:when test="${not empty schoolNoticeList}">
										<c:forEach var="school" items="${schoolNoticeList }">
											<tr>
												<td>번호:${school.board_num}</td>
												<td>제목:${school.board_title}</td>
												<td>내용:${school.board_cont}</td>
												<td>날짜:${school.board_date}</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="5" style="text-align: center;">해당 내용이 없습니다.</td>
										</tr>
									</c:otherwise>
								</c:choose>
								<h6>학과공지</h6>
								<c:choose>
									<c:when test="${not empty departmentNoticeList}">
										<c:forEach var="department" items="${departmentNoticeList }">
											<tr>
												<td>번호:${department.board_num}</td>
												<td>제목:${department.board_title}</td>
												<td>내용:${department.board_cont}</td>
												<td>날짜:${department.board_date}</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="5" style="text-align: center;">해당 내용이 없습니다.</td>
										</tr>
									</c:otherwise>
								</c:choose>
								<h6>학사일정</h6>
								<c:choose>
									<c:when test="${not empty schoolScheduleList}">
										<c:forEach var="schoolSchedule" items="${schoolScheduleList }">
											<tr>
												<td>번호:${schoolSchedule.board_num}</td>
												<td>제목:${schoolSchedule.board_title}</td>
												<td>내용:${schoolSchedule.board_cont}</td>
												<td>날짜:${schoolSchedule.board_date}</td>
											</tr>
										</c:forEach>
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
						
	</div>					
						
						

