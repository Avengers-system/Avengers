<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="col-md-12">
	<div class="panel panel-default">
		<div class="panel-heading" style="background-color: #2196F3;  margin-top: 10px;">
			<h4 style="color: #fff; font-weight: bold; font-size: 20px;">강의목록</h4>
		</div>
		<div class="panel-body" style="height: 580px; text-align: center;" >
			<table class="table table-hover">
				<thead>
					<tr>
						<th>학번</th>
						<th>강의번호</th>
						<th>강의명</th>
						<th>분반</th>
						<th>교수명</th>
						<th>강의요일</th>
						<th>강의실</th>
						<th>상세페이지</th>
					</tr>
				</thead>
				<tbody>
			<%-- <button onclick="location.href='<%=request.getContextPath()%>/student/classManage/lecture'">강의목록</button> --%>
				<c:forEach items="${classList}" var="classList" varStatus="status">
					<tr>
						<td>${status.count }</td>
						<td>${classList.get("lct_num")}</td>
						<td>${classList.get("lct_nm") }</td>
						<td>${classList.get("lct_nm_class") }</td>
						<td>${classList.get("prfs_nm") }</td>
						<td>${classList.get("lr_date") }</td>
						<td>${classList.get("lr_lrc") }</td>
						<td><button style="padding:5px" class="btn btn-outline btn-primary" onclick="location.href='<%=request.getContextPath()%>/student/classManage/lectureMain?lct_num=${classList.get('lct_num')}'">상세페이지</button></td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>

