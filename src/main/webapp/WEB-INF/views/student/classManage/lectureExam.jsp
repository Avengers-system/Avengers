<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Student Header -->
<%@include file="../common/topCategory.jsp" %>

<!-- Content -->
<div class="col-md-2" id="commonLeftSide">
<%@include file="../common/classManageLectureSideCategory.jsp" %>
</div>
<div class="col-md-10" id="commonRightSide">
	<h1>시험</h1>
	<hr/>
	<table class="table table-hover">
		<thead>
			<tr>
				<th>과목명</th>
				<th>분반</th>
				<th>시험유형</th>
				<th>시험일</th>
				<th>시험시간</th>
				<th>응시여부</th>
				<th>응시하기</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${examList }" var="exam" varStatus="status">
			<tr>
				<td>${exam.get("sjt_nm") }</td>
				<td>${exam.get("lct_nm_class") }</td>
				<td>${exam.get("exam_type") }</td>
				<td>${exam.get("exam_date") }</td>
				<td>${exam.get("exam_start_date") }~${exam.get("exam_end_date") }</td>
				<td>${exam.get("te_check") }</td>
				<td><button onclick="location.href='<%=request.getContextPath()%>/student/classManage/lectureTakeExam?exam_num=${exam.get('exam_num') }&te_num=${exam.get('te_num') }'">응시</button></td>
			
			</tr>
		</c:forEach>
		</tbody>
	</table>
</div>