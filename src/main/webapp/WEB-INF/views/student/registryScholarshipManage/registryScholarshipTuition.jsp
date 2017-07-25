<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>




<!--side Category-->
	<%@include file="../common/resSchSideCategory.jsp" %>
<div class="col-md-10">	
	<div class="panel panel-default">
		<div class="panel-heading" style="background-color: #2196F3;  margin-top: 10px;">
			<h4 style="color: #fff; font-weight: bold; font-size: 20px;">
       		 학생정보 </h4>
       		 </div> 
       	<div class="panel-body" style="font-size:16px;">
       	<dl class="dl-horizontal">
		<dt>대학</dt><dd>${resSchStudent.col_nm}</dd>
		<dt>전공</dt><dd>${resSchStudent.dept_nm}</dd>
		<dt>학년</dt><dd>${resSchStudent.stud_grd}</dd>		
		<dt>평점평균</dt><dd>${average_rating}</dd> 
		<dt>취득학점</dt><dd>${grades}</dd>
		<dt>학번</dt><dd>${resSchStudent.stud_num}</dd>
		<dt>이름</dt><dd>${resSchStudent.stud_nm}</dd>
		</dl>
       	</div>	       
        </div>
        </div>

<div class="col-md-2">
</div>

<div class="col-md-10">
	<div class="panel panel-default">
		<div class="panel-heading" style="background-color: #2196F3;  margin-top: 10px;">
			<h4 style="color: #fff; font-weight: bold; font-size: 20px;">등록금이력조회</h4>
			<form action = "${pageContext.request.contextPath}/student/tuition" method="post">
					년도<select name="reg_yr" id="reg_yr">
						<option selected="selected">전체</option>
						<c:choose>
					<c:when test="${not empty yearList}">
						<c:forEach var="year" items="${yearList}" varStatus="status">
							<option value="${year}">${year}</option>
						</c:forEach>
						</c:when>
						</c:choose>
					</select> 학기<select name="reg_qtr" id="reg_qtr">
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
					<td>차수</td>
					<td>등록금액</td>
					<td>납부금액</td>					
					<td>은행</td>
					<td>예금주</td>
					<td>납부일</td>
				</tr>
				</thead>
				<tbody>
				<c:choose>
					<c:when test="${not empty tuitionList}">
						<c:forEach var="tuition" items="${tuitionList}" varStatus="status">
							<tr>											
								<td>${tuition.get("reg_yr")}</td>
								<td>${tuition.get("reg_qtr")}</td>
								<td>${tuition.get("dp_pymt_round")}</td>
								<td>${tuition.get("dept_ttn") }</td>
								<td>${tuition.get("dp_pymt_fee") }</td>
								<td>${tuition.get("reg_pymt_bank") }</td>
								<td>${tuition.get("reg_ah") }</td>
								<td>${tuition.get("dp_pymt_date") }</td>
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
        </div>