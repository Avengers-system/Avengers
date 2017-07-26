<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!--side Category-->
	<%@include file="../common/studentDetailSideCategory.jsp" %>

<div class="col-md-10">
	<div class="panel panel-default">
		<div class="panel-heading" style="background-color: #CC0000; color: #fff;  margin-top: 10px;">
			<h4 style="color: #fff; font-weight: bold; font-size: 20px;">장학신청 미처리 내역</h4>
			<form action = "${pageContext.request.contextPath}/admin/studentScrList" method="post">
					년도<select name="scr_year" id="scr_year">
						<option selected="selected">전체</option>
						<c:choose>
					<c:when test="${not empty yearList}">
						<c:forEach var="year" items="${yearList}" varStatus="status">
							<option value="${year}">${year}</option>
						</c:forEach>
						</c:when>
			
						</c:choose>
					</select> 학기<select name="scr_qtr" id="scr_qtr">
						<option selected="selected">전체</option>
						<option value="1">1</option>
						<option value="2">2</option>
					</select>
					<input type = "submit" value="검색">
					</form>
				</div>
			<div class="panel-body">
			<div class="responsive-table">
			<table id="datatables-example" class="table table-striped table-bordered" width="100%" cellspacing="0">
				<thead>
				<tr>
					<td>년도</td>
					<td>학기</td>
					<td>학번</td>
					<td>이름</td>
					<td>장학금명</td>
					<td>신청내용</td>
					<td>은행</td>
					<td>예금주</td>
					<td>계좌번호</td>
					<td>신청일자</td>
				</tr>
				</thead>
				<tbody>
				<c:choose>
					<c:when test="${not empty scrList}">
						<c:forEach var="scr" items="${scrList}" varStatus="status">
							<tr>											
								<td>${scr.get("scrappl_yr")}</td>
								<td>${scr.get("scrappl_qtr")}</td>
								<td>${scr.get("stud_num")}</td>
								<td>${scr.get("stud_nm")}</td>
								<td>${scr.get("scr_nm") }</td>
								<td>${scr.get("scrappl_cause") }</td>								
								<td>${scr.get("stud_bank") }</td>
								<td>${scr.get("stud_ah") }</td>
								<td>${scr.get("stud_act_num") }</td>
								<td>${scr.get("scrappl_date") }</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="10" style="text-align: center;">해당 내용이 없습니다.</td>
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
		<div class="panel-heading" style="background-color: #CC0000; color: #fff;  margin-top: 10px;">
			<h4 style="color: #fff; font-weight: bold; font-size: 20px;">장학신청 처리내역</h4>
			<form action = "${pageContext.request.contextPath}/admin/studentScrList" method="post">
			년도<select name="scrappl_year" id="scrappl_year">
						<option selected="selected" >전체</option>
						<c:choose>
					<c:when test="${not empty yearList}">
						<c:forEach var="year" items="${yearList}" varStatus="status">
							<option value="${year}">${year}</option>
						</c:forEach>
						</c:when>
						</c:choose>
					</select> 학기<select name="scrappl_qtr" id="scrappl_qtr">
						<option selected="selected">전체</option>
						<option value="1">1</option>
						<option value="2">2</option>
					</select>
					<input type = "submit" value="검색">
			</form>		
			</div>
			<div class="panel-body">
			<div class="responsive-table">
			<table id="datatables-example" class="table table-striped table-bordered" width="100%" cellspacing="0">
				<thead>
				<tr>
					<td>년도</td>
					<td>학기</td>
					<td>학번</td>
					<td>이름</td>
					<td>장학금명</td>
					<td>신청내용</td>
					<td>은행</td>
					<td>예금주</td>
					<td>계좌번호</td>
					<td>신청일자</td>
				</tr>
				</thead>
				<tbody>
				<c:choose>
					<c:when test="${not empty scrApplList}">
						<c:forEach var="scr" items="${scrApplList}" varStatus="status">
							<tr>											
								<td>${scr.get("scrappl_yr")}</td>
								<td>${scr.get("scrappl_qtr")}</td>
								<td>${scr.get("stud_num")}</td>
								<td>${scr.get("stud_nm")}</td>
								<td>${scr.get("scr_nm") }</td>
								<td>${scr.get("scrappl_cause") }</td>								
								<td>${scr.get("stud_bank") }</td>
								<td>${scr.get("stud_ah") }</td>
								<td>${scr.get("stud_act_num") }</td>
								<td>${scr.get("scrappl_date") }</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="10" style="text-align: center;">해당 내용이 없습니다.</td>
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
		<div class="panel-heading" style="background-color: #CC0000; color: #fff;  margin-top: 10px;">
			<h4 style="color: #fff; font-weight: bold; font-size: 20px;">장학반려 처리내역</h4>
			<form action = "${pageContext.request.contextPath}/admin/studentScrList" method="post">
			년도<select name="scrCancel_year" id="scrCancel_year">
						<option selected="selected" >전체</option>
						<c:choose>
					<c:when test="${not empty yearList}">
						<c:forEach var="year" items="${yearList}" varStatus="status">
							<option value="${year}">${year}</option>
						</c:forEach>
						</c:when>
						</c:choose>
					</select> 학기<select name="scrCancel_qtr" id="scrCancel_qtr">
						<option selected="selected">전체</option>
						<option value="1">1</option>
						<option value="2">2</option>
					</select>
					<input type = "submit" value="검색">
			</form>		
			</div>
			<div class="panel-body">
			<div class="responsive-table">
			<table id="datatables-example" class="table table-striped table-bordered" width="100%" cellspacing="0">
				<thead>
				<tr>
					<td>년도</td>
					<td>학기</td>
					<td>학번</td>
					<td>이름</td>
					<td>장학금명</td>
					<td>신청내용</td>
					<td>은행</td>
					<td>예금주</td>
					<td>계좌번호</td>
					<td>신청일자</td>
				</tr>
				</thead>
				<tbody>
				<c:choose>
					<c:when test="${not empty scrCancelList}">
						<c:forEach var="scr" items="${scrCancelList}" varStatus="status">
							<tr>											
								<td>${scr.get("scrappl_yr")}</td>
								<td>${scr.get("scrappl_qtr")}</td>
								<td>${scr.get("stud_num")}</td>
								<td>${scr.get("stud_nm")}</td>
								<td>${scr.get("scr_nm") }</td>
								<td>${scr.get("scrappl_cause") }</td>								
								<td>${scr.get("stud_bank") }</td>
								<td>${scr.get("stud_ah") }</td>
								<td>${scr.get("stud_act_num") }</td>
								<td>${scr.get("scrappl_date") }</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="10" style="text-align: center;">해당 내용이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
				</tbody>
			</table>
			</div>
        </div>
        </div>
        </div>