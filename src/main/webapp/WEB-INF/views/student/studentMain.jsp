<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!-- Content -->


<div class="col-md-2" id="commonLeftSide">
	<%@include file="common/mainSideCategory.jsp"%>
</div>
			<div class="col-md-10" id="commonRightSide">
						<h4>수강현황</h4>
					</div>
						<!-- 수강현황 -->
						<c:forEach var="lectureList" items="${lectureList}">
					강의명 : ${lectureList.lct_nm}<br>
					강의요일 :${lectureList.lr_date}<br>
					강의시간 :${lectureList.lr_hour}<br>
					강의실명:${lectureList.lrc_nm}<br>
						</c:forEach>
						<h4>상담현황</h4>
						<!-- 상담현황 -->
						<c:forEach var="consult" items="${consultList}">
					상담제목: ${consult.cns_title}<br>
					상담여부 : ${consult.cns_check}<br>
						</c:forEach>


					<!--개인일정  -->
						<h4>개인일정</h4>
						<c:forEach var="perschd" items="${perschdList}">
						제목 : ${perschd.perschd_title}<br>
						시작일 : ${perschd.perschd_start_date}<br>
						</c:forEach>
			<!-- 학사관련 (이수학기,총이수학점,수강신청 등) -->



			<!-- 포털소식,학교공지,학과공지,학사일정 -->
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

			<!-- 포털소식,학교공지,학과공지,학사일정 -->
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





