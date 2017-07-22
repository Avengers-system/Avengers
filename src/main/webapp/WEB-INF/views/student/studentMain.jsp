<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!-- Content -->
<div class="row">
	<div class="col-xs-12">
		<div class="panel">
			<div class="panel-body">
				<div class="col-md-2">
					<div class="panel panel-default">
						<div class="panel-heading" style="background-color: #2196F3;">
							<h4 class="panel-title" style="color: #ffffff;">개인정보</h4>
						</div>
						<div class="panel-body">
							<img src="http://placehold.it/150x75">
						</div>
					</div>
				</div>
				<div class="col-md-5">
					<div class="panel panel-default">
						<div class="panel-heading" style="background-color: #2196F3;">
							<h4 class="panel-title" style="color: #ffffff;">수강 현황</h4>
						</div>
						<div class="panel-body">
							<img src="http://placehold.it/150x75">
						</div>
					</div>
				</div>
				<div class="col-md-5">
					<div class="panel panel-default">
						<div class="panel-heading" style="background-color: #2196F3;">
							<h4 class="panel-title" style="color: #ffffff;">상담 현황</h4>
						</div>
						<div class="panel-body">
							<img src="http://placehold.it/150x75">
						</div>
					</div>
				</div>
				<div class="col-md-2">
					<div class="panel panel-default">
						<div class="panel-heading" style="background-color: #2196F3;">
							<h4 class="panel-title" style="color: #ffffff;">개인 일정</h4>
						</div>
						<div class="panel-body">
							<img src="http://placehold.it/150x75">
						</div>
					</div>
				</div>
				<div class="col-md-10">
				

                    <ul id="tabs-demo3" class="nav nav-tabs nav-tabs-v2" role="tablist">
                      <li role="presentation" class="active">
                        <a href="#tabs-demo3-area1" id="tabs-demo3-1" role="tab" data-toggle="tab" aria-expanded="true">Menu 1</a>
                      </li>
                      <li role="presentation" class="">
                        <a href="#tabs-demo3-area2" role="tab" id="tabs-demo3-2" data-toggle="tab" aria-expanded="false">Menu 2</a>
                      </li>
                      <li role="presentation">
                        <a href="#tabs-demo3-area3" id="tabs-demo3-3" role="tab" data-toggle="tab" aria-expanded="false">Menu 3</a>
                      </li>
                      <li role="presentation" class="">
                        <a href="#tabs-demo3-area4" role="tab" id="tabs-demo3-4" data-toggle="tab" aria-expanded="false">Menu 4</a>
                      </li>
                    </ul>
                    <div id="tabsDemo3Content" class="tab-content tabs-content-v2">
                      <div role="tabpanel" class="tab-pane fade active in" id="tabs-demo3-area1" aria-labelledby="tabs-demo3-area1">
                        <p>Raw denim you probably haven't heard of them jean shorts Austin. Nesciunt tofu stumptown aliqua, retro synth master cleanse. Mustache cliche tempor, williamsburg carles vegan helvetica. Reprehenderit butcher retro keffiyeh dreamcatcher synth. Cosby sweater eu banh mi, qui irure terry richardson ex squid. Aliquip placeat salvia cillum iphone. Seitan aliquip quis cardigan american apparel, butcher voluptate nisi qui.</p>
                      </div>
                      <div role="tabpanel" class="tab-pane fade" id="tabs-demo3-area2" aria-labelledby="tabs-demo3-area2">
                        <p>Raw denim you probably haven't heard of them jean shorts Austin. Nesciunt tofu stumptown aliqua, retro synth master cleanse. Mustache cliche tempor, williamsburg carles vegan helvetica. Reprehenderit butcher retro keffiyeh dreamcatcher synth. Cosby sweater eu banh mi, qui irure terry richardson ex squid. Aliquip placeat salvia cillum iphone. Seitan aliquip quis cardigan american apparel, butcher voluptate nisi qui.</p>
                      </div>
                      <div role="tabpanel" class="tab-pane fade" id="tabs-demo3-area3" aria-labelledby="tabs-demo3-area3">
                        <p>Raw denim you probably haven't heard of them jean shorts Austin. Nesciunt tofu stumptown aliqua, retro synth master cleanse. Mustache cliche tempor, williamsburg carles vegan helvetica. Reprehenderit butcher retro keffiyeh dreamcatcher synth. Cosby sweater eu banh mi, qui irure terry richardson ex squid. Aliquip placeat salvia cillum iphone. Seitan aliquip quis cardigan american apparel, butcher voluptate nisi qui.</p>
                      </div>
                      <div role="tabpanel" class="tab-pane fade" id="tabs-demo3-area4" aria-labelledby="tabs-demo3-area4">
                        <p>Raw denim you probably haven't heard of them jean shorts Austin. Nesciunt tofu stumptown aliqua, retro synth master cleanse. Mustache cliche tempor, williamsburg carles vegan helvetica. Reprehenderit butcher retro keffiyeh dreamcatcher synth. Cosby sweater eu banh mi, qui irure terry richardson ex squid. Aliquip placeat salvia cillum iphone. Seitan aliquip quis cardigan american apparel, butcher voluptate nisi qui.</p>                                          </div>
                      </div>

				
				
				</div>
			</div>
		</div>
	</div>
</div>














<div class="col-xs-12">
	<br> 개인정보<br> 이름 : ${studentInfo.stud_nm}<br>
	학과:${dept.dept_nm }<br> 학년:${studentInfo.stud_grd}<br> 학적상태
	:${studentInfo.stud_schreg_code}<br> <br>
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


</div>


