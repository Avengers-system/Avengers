<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!--side Category-->
	<%@include file="../common/studentDetailSideCategory.jsp" %>

<div class="col-md-10">
	<div class="panel panel-default">
		<div class="panel-heading" style="background-color: #CC0000;  margin-top: 10px;">
			<h4 style="color: #fff; font-weight: bold; font-size: 20px;">자퇴신청 미처리 내역</h4>			
				</div>
			<div class="panel-body">
			<div class="responsive-table">
			<table id="datatables-example" class="table table-striped table-bordered" width="100%" cellspacing="0">
				<thead>
				<tr>
					<td>승인</td>
					<td>반려</td>
					<td>학번</td>
					<td>이름</td>
					<td>학과</td>
					<td>면담내용</td>
					<td>신청일자</td>
				</tr>
				</thead>
				<tbody>
				<c:choose>
					<c:when test="${not empty scrList}">
						<c:forEach var="scr" items="${scrList}" varStatus="status">
							<tr>											
								<td>
									<form action = "${pageContext.request.contextPath}/admin/studentUpdateScrList" method="post">
									<input type="hidden" name="scrappl_num" value="${scr.get('scrappl_num')}" />
									<input type="hidden" name="scrappl_appr_check" value="1" />
									<input class="btn btn-outline btn-primary" type = "submit" value="승인">
									</form>
								</td>
								<td>
									<form action = "${pageContext.request.contextPath}/admin/studentUpdateScrList" method="post">
									<input type="hidden" name="scrappl_num" value="${scr.get('scrappl_num')}" />
									<input type="hidden" name="scrappl_appr_check" value="2" />
									<input class="btn btn-outline btn-primary" type = "submit" value="반려">
									</form>
								</td>											
								<td>${scr.get("scrappl_yr")}</td>
								<td>${scr.get("scrappl_qtr")}</td>
								<td>${scr.get("stud_num")}</td>
								<td>${scr.get("stud_nm")}</td>
								<td>${scr.get("scr_nm") }</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="7" style="text-align: center;">해당 내용이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
				</tbody>
			</table>
			</div>
        </div>
        </div>
        </div>


<div class="col-md-2">
</div>

<div class="col-md-10">
	<div class="panel panel-default">
		<div class="panel-heading" style="background-color: #CC0000;  margin-top: 10px;">
			<h4 style="color: #fff; font-weight: bold; font-size: 20px;">자퇴신청 처리내역</h4>
			
			</div>
			<div class="panel-body">
			<div class="responsive-table">
			<table id="datatables-example" class="table table-striped table-bordered" width="100%" cellspacing="0">
				<thead>
				<tr>
					<td>승인취소</td>
					<td>학번</td>
					<td>이름</td>
					<td>학과</td>
					<td>면담내용</td>
					<td>승인일</td>
				</tr>
				</thead>
				<tbody>
				<c:choose>
					<c:when test="${not empty scrApplList}">
						<c:forEach var="scr" items="${scrApplList}" varStatus="status">
							<tr>											
								<td>
									<form action = "${pageContext.request.contextPath}/admin/studentUpdateScrList" method="post">
									<input type="hidden" name="scrappl_num" value="${scr.get('scrappl_num')}" />
									<input type="hidden" name="scrappl_appr_check" value="3" />
									<input class="btn btn-outline btn-primary" type = "submit" value="승인취소">
									</form>
								</td>													
								<td>${scr.get("scrappl_yr")}</td>
								<td>${scr.get("scrappl_qtr")}</td>
								<td>${scr.get("stud_num")}</td>
								<td>${scr.get("stud_nm")}</td>
								<td>${scr.get("scr_nm") }</td>							
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="8" style="text-align: center;">해당 내용이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
				</tbody>
			</table>
			</div>
        </div>
        </div>
        </div>
<div class="col-md-2">
</div>

<div class="col-md-10">
	<div class="panel panel-default">
		<div class="panel-heading" style="background-color: #CC0000;  margin-top: 10px;">
			<h4 style="color: #fff; font-weight: bold; font-size: 20px;">자퇴신청 반려내역</h4>
			
			</div>
			<div class="panel-body">
			<div class="responsive-table">
			<table id="datatables-example" class="table table-striped table-bordered" width="100%" cellspacing="0">
				<thead>
				<tr>
					<td>반려취소</td>
					<td>학번</td>
					<td>이름</td>
					<td>학과</td>
					<td>면담내용</td>
					<td>반려일</td>
				</tr>
				</thead>
				<tbody>
				<c:choose>
					<c:when test="${not empty scrCancelList}">
						<c:forEach var="scr" items="${scrCancelList}" varStatus="status">
							<tr>											
								<td>
									<form action = "${pageContext.request.contextPath}/admin/studentUpdateScrList" method="post">
									<input type="hidden" name="scrappl_num" value="${scr.get('scrappl_num')}" />
									<input type="hidden" name="scrappl_appr_check" value="3" />
									<input class="btn btn-outline btn-primary" type = "submit" value="반려취소">
									</form>
								</td>												
								<td>${scr.get("scrappl_yr")}</td>
								<td>${scr.get("scrappl_qtr")}</td>
								<td>${scr.get("stud_num")}</td>
								<td>${scr.get("stud_nm")}</td>
								<td>${scr.get("scr_nm") }</td>							
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="8" style="text-align: center;">해당 내용이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
				</tbody>
			</table>
			</div>
        </div>
        </div>
        </div>