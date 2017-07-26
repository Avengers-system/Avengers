<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="col-md-2" id="commonLeftSide">
	<%@include file="../common/classManageLectureSideCategory.jsp"%>
</div>

<div class="col-md-10">
	<div class="panel panel-default">
		<div class="panel-heading" style="background-color: #666666; margin-top: 10px;">
			<h4 style="color: #fff; font-weight: bold; font-size: 20px;">강의목록</h4>
		</div>
		<div class="panel-body">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>강의번호</th>
						<th>년도</th>
						<th>학기</th>
						<th>강의명</th>
						<th>분반</th>
						<th>강의시간</th>
						<th>강의실</th>
						<th>상세페이지</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${prfsLctList }" var="prfsLct" varStatus="status">
					<tr>
						<td>${prfsLct.get("lct_num") }</td>
						<td>${ prfsLct.get("lct_yr")}</td>
						<td>${ prfsLct.get("lct_qtr")}</td>
						<td>${ prfsLct.get("lct_nm")}</td>
						<td>${ prfsLct.get("lct_nm_class")}</td>
						<td>${ prfsLct.get("lr_date")}</td>
						<td>${ prfsLct.get("lr_lrc")}</td>
						<td><button onclick="location.href='${pageContext.request.contextPath }/professor/classManage/lectureMain?lct_num=${prfsLct.get('lct_num')}'">강의홈이동</button></td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
<%-- 		강의번호 : ${prfsLct.get("lct_num") }<br/> --%>
<%-- 		년도 : ${ prfsLct.get("lct_yr")}<br/> --%>
<%-- 		학기 : ${ prfsLct.get("lct_qtr")}<br/> --%>
<%-- 		강의명 : ${ prfsLct.get("lct_nm")}<br/> --%>
<%-- 		분반 : ${ prfsLct.get("lct_nm_class")}<br/> --%>
<%-- 		강의시간 : ${ prfsLct.get("lr_date")}<br/> --%>
<%-- 		강의실 : ${ prfsLct.get("lr_lrc")} --%>
