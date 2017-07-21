<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Content -->
<div class="col-md-2" id="commonLeftSide">
<%@include file="../common/classManageLectureSideCategory.jsp" %>
</div>
<div class="col-md-10" id="commonRightSide">
	<h1>과제</h1>
	<hr/>
	<table class="table table-hover">
		<thead>
			<tr>
				<th>글번호</th>
				<th>과제번호</th>
				<th>과목명</th>
				<th>분반</th>
				<th>과제명</th>
				<th>제출시작일</th>
				<th>제출마감일</th>
				<th>제출여부</th>
				<th>상세페이지</th>
			</tr>		
		</thead>
		<tbody>
			<c:forEach items="${asgnList}" var="asgn" varStatus="status">
				<tr>
					<td>${status.count }</td>
					<td>${asgn.get("asgn_num") }</td>
					<td>${asgn.get("lct_nm") }</td>
					<td>${asgn.get("lct_nm_class") }</td>
					<td>${asgn.get("asgn_nm")}</td>
					<td>${asgn.get("asgn_start_date") }</td>
					<td>${asgn.get("asgn_dl_date") }</td>
					<td>${asgn.get("sub_check") }</td>
					<td><button onclick="location.href='<%=request.getContextPath()%>/student/classManage/lectureAsgnDetail?asgn_num=${asgn.get('asgn_num') }'">상세페이지</button></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>