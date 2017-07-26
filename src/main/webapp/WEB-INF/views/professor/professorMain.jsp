<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Content -->

<div class="panel-body">
	<!-- 개인정보 -->
	<div class="col-md-2">
		<div class="panel panel-default">
			<div class="panel-heading" style="background-color: #666666;">
				<h4 class="panel-title" style="color: #ffffff;">개인정보</h4>
			</div>
			<!-- 내용 -->
			<div class="panel-body" style="height: 260px;">
			
			    <span class="label label-outline label-default" style="font-size: 15px;">이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;름</span>
				<span class="label label-outline label-default" style="display:inline-block;font-size: 15px; width: 160px;">${prfs.prfs_nm}</span><br>
				<span class="label label-outline label-default" style="font-size: 15px;">학&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;과</span>
				<span class="label label-outline label-default" style="display:inline-block;font-size: 15px; width: 160px;">${department}</span><br>
				<span class="label label-outline label-default" style="font-size: 15px;">이&nbsp;&nbsp;메&nbsp;&nbsp;일</span>
				<span class="label label-outline label-default" style="display:inline-block;font-size: 15px; width: 160px;">${prfs.prfs_email}</span><br>	
				
			</div>
		</div>
	</div>
	<!-- 수강현황 -->
	<div class="col-md-10">
		<div class="panel panel-default">
			<div class="panel-heading" style="background-color: #666666;">
				<h4 class="panel-title" style="color: #ffffff;">강의 현황</h4>
			</div>
			<!-- 내용 -->
			<div class="panel-body" style="height: 260px; overflow: scroll;">


				<table id="datatables-example"
					class="table table-striped table-bordered" width="100%"
					cellspacing="0">
					<thead>
						<tr>
							<td>강의번호</td>
							<td>강의시간</td>
							<td>강의날짜</td>
							<td>강의실번호</td>
						</tr>
					</thead>
					</tbody>
					<c:choose>
						<c:when test="${not empty lctList}">
							<c:forEach var="lct" items="${lctList}">
								<tr>
									<td>${lct.lct_num}</td>
									<td>${lct.lr_num}</td>
									<td>${lct.lr_date}</td>
									<td>${lct.lr_lct}</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="5" style="text-align: center;">현재 강의하시고 계신 수업이
									없습니다</td>
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
			<div class="panel-heading" style="background-color: #666666;">
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
						<c:when test="${not empty professorMainDateContent}">
						<hr>
							${professorMainDateContent}
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
					<c:forEach var="professorSchool" items="${professorMainSchoolNotice}" varStatus="status">
						<c:if test="${status.count < 6}">
						<tr>
							<td>${status.count}</td>
							<td>${professorSchool.board_title}</td>
							<td>${professorSchool.board_writer}</td>
							<td>${professorSchool.board_date}</td>
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
					<c:forEach var="professorDepartment" items="${professorMainDepartNotice}" varStatus="status">
						<c:if test="${status.count < 6}">
						<tr>
							<td>${status.count}</td>
							<td>${professorDepartment.board_title}</td>
							<td>${professorDepartment.board_writer}</td>
							<td>${professorDepartment.board_date}</td>
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
					<c:forEach var="professorPotal" items="${professorMainPotalNotice}" varStatus="status">
						<c:if test="${status.count < 6}">
						<tr>
							<td>${status.count}</td>
							<td>${professorPotal.board_title}</td>
							<td>${professorPotal.board_writer}</td>
							<td>${professorPotal.board_date}</td>
						</tr>
						</c:if>
					</c:forEach>	
					</tbody>
				</table>				
								



			</div>
		</div>
	</div>
</div>
