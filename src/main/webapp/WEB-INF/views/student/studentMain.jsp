<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!-- Content -->

<div class="panel-body">
	<!-- 개인정보 -->
	<div class="col-md-2">
		<div class="panel panel-default">
			<div class="panel-heading" style="background-color: #2196F3;">
				<h4 class="panel-title" style="color: #ffffff;">개인정보</h4>
			</div>
			<!-- 내용 -->
			<div class="panel-body" style="height: 260px; line-height: 40px;">
			<span class="label label-outline label-default" style="font-size: 15px;">이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;름</span>
			<span class="label label-outline label-default" style="display:inline-block;font-size: 15px; width: 160px;">${studentInfo.stud_nm}</span><br>
			<span class="label label-outline label-default" style="font-size: 15px;">학&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;과</span>
			<span class="label label-outline label-default" style="display:inline-block;font-size: 15px; width: 160px;">${dept.dept_nm }</span><br>
			<span class="label label-outline label-default" style="font-size: 15px;">학&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;년</span>
			<span class="label label-outline label-default" style="display:inline-block;font-size: 15px; width: 160px;">${studentInfo.stud_grd}</span><br>
			<span class="label label-outline label-default" style="font-size: 15px;">학적상태</span>
			<span class="label label-outline label-default" style="display:inline-block;font-size: 15px; width: 160px;"> ${studentInfo.stud_schreg_code}</span><br>
			</div>
		</div>
	</div>
	<!-- 수강현황 -->
	<div class="col-md-10">
		<div class="panel panel-default">
			<div class="panel-heading" style="background-color: #2196F3;">
				<h4 class="panel-title" style="color: #ffffff;">수강 현황</h4>
			</div>
			<!-- 내용 -->
			<div class="panel-body" style="height: 260px; overflow: scroll;">
		
					<table id="datatables-example" class="table table-striped table-bordered" width="100%" cellspacing="0">
					<thead>						
							<tr>
								<td>강의번호</td>
								<td>이수구분</td>
								<td>강의명</td>
								<td>강의실</td>
								<td>교수명</td>
								<td>시간</td>
								<td>학점</td>
								<td>강의계획서</td>
							</tr>
						</thead>
						</tbody>	
							<c:choose>
								<c:when test="${not empty admissionApplicationList}">
									<c:forEach var="admission" items="${admissionApplicationList }" varStatus="status">
										<tr>
											<td>${admission.get("lct_num")}</td>
											<td>${admission.get("sjt_cd")}</td>
											<td>${admission.get("lct_nm")}</td>
											<td>${admission.get("lr_num") }</td>
											<td>${admission.get("prfs_nm") }</td>
											<td>${admission.get("lr_date") }</td>
											<td>${admission.get("lct_crd") }</td>
											<td>
											<form action = "${pageContext.request.contextPath}/student/lectureDetail" method="post">
											<input type="hidden" name="lct_num" value="${admission.get('lct_num')}" /> 
											<input type="submit" class="btn btn-outline btn-primary"
												style="font-size: 13px; padding: 0; width: 80px;"
												value="View">
										</form>
											</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="9" style="text-align: center;">해당 내용이 없습니다.</td>
									</tr>
								</c:otherwise>
							</c:choose>
							</tbody>
							</table>
			</div>
		</div>
	</div>

	<!-- 개인일정 -->
	<div class="col-md-2">
		<div class="panel panel-default">
			<div class="panel-heading" style="background-color: #2196F3;">
				<h4 class="panel-title" style="color: #ffffff;">SCHEDULE</h4>
			</div>
			<!-- 내용 -->
			<div class="panel-body" style="height: 285px;">
				<div class="time">
					<h1 class="animated fadeInLeft" style="text-align: center; font-size: 50px; margin-top: 0; padding-top: 0;"></h1>
					<p class="animated fadeInRight"
						style="text-align: center; margin: 0; margin-bottom: 15px;"></p>
					<span class="label label-outline label-default">오늘 일정</span><br>
					<c:choose>
						<c:when test="${not empty scheduleContent}">
						<hr>
							${scheduleContent}
						</c:when>
						<c:otherwise>
						<hr>
							등록된 일정이 없습니다.
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>
	<!-- 게시판 -->
	<div class="col-md-10">

		<ul id="tabs-demo4" class="nav nav-tabs nav-tabs-v3" role="tablist"
			style="padding-top: 0; font-size: 15px;">
			<li role="presentation" class="active"><a
				href="#tabs-demo4-area1" id="tabs-demo4-1" role="tab"
				data-toggle="tab" aria-expanded="true">학교공지</a></li>
			<li role="presentation" class=""><a href="#tabs-demo4-area2"
				role="tab" id="tabs-demo4-2" data-toggle="tab" aria-expanded="true">학과공지</a>
			</li>
			<li role="presentation"><a href="#tabs-demo4-area3"
				id="tabs-demo4-3" role="tab" data-toggle="tab" aria-expanded="true">포털소식</a>
			</li>
		</ul>

		<div id="tabsDemo4Content" class="tab-content tab-content-v3">

			<!-- 학교공지 -->
			<div role="tabpanel" class="tab-pane fade active in"
				id="tabs-demo4-area1" aria-labelledby="tabs-demo4-area1"
				style="height: 290px;">
				<table class="table table-striped table-bordered dataTable no-footer">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일자</th>
						</tr>				
					</thead>
					<tbody>
					<!-- 여기서 for문 5개 만 -->
					<c:forEach var="school" items="${studMainSchoolNotice }" varStatus="status">
						<c:if test="${status.count < 6}">
						<tr>
							<td>${status.count}</td>
							<td>${school.board_title}</td>
							<td>${school.board_writer}</td>
							<td><fmt:formatDate pattern = "yyyy-MM-dd" value = "${school.board_date}" /></td>
						</tr>
						</c:if>
					</c:forEach>	
					</tbody>
				</table>
			</div>


			<!-- 학과공지 -->
			<div role="tabpanel" class="tab-pane fade" id="tabs-demo4-area2"
				aria-labelledby="tabs-demo4-area2" style="height: 290px;">
								<table class="table table-striped table-bordered dataTable no-footer">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일자</th>
						</tr>				
					</thead>
					<tbody>
					<!-- 여기서 for문 5개 만 -->
					<c:forEach var="depart" items="${studMainDepartNotice }" varStatus="status">
						<c:if test="${status.count < 6}">
						<tr>
							<td>${status.count}</td>
							<td>${depart.board_title}</td>
							<td>${depart.board_writer}</td>
							<td>${depart.board_date}</td>
						</tr>
						</c:if>
					</c:forEach>
						
					</tbody>
				</table>
			</div>

			<!-- 포털소식 -->
			<div role="tabpanel" class="tab-pane fade" id="tabs-demo4-area3"
				aria-labelledby="tabs-demo4-area3" style="height: 290px;">
								<table class="table table-striped table-bordered dataTable no-footer">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일자</th>
						</tr>				
					</thead>
					<tbody>
					<!-- 여기서 for문 5개 만 -->
						<c:forEach var="potal" items="${studMainPotalNotice}" varStatus="status">
							<c:if test="${status.count < 6}">
								<tr>
									<td>${status.count}</td>
									<td>${potal.board_title}</td>
									<td>${potal.board_writer}</td>
									<td>${potal.board_date}</td>
								</tr>
							</c:if>
						</c:forEach>

					</tbody>
				</table>

			</div>

		</div>
	</div>
</div>



