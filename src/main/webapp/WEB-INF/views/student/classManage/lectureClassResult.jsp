<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../common/classManageLectureSideCategory.jsp"%>

<div class="col-md-10">
	<div class="panel panel-default">
		<div class="panel-heading"
			style="background-color: #2196F3; margin-top: 10px;">
			<h4 style="color: #fff; font-weight: bold; font-size: 20px;">
				성적</h4>
		</div>
		<div class="panel-body">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>년도</th>
						<th>학기</th>
						<th>과목명</th>
						<th>이수구분</th>
						<th>학점</th>
						<th>점수</th>
						<th>등급</th>
						<th>평균</th>
					</tr>		
				</thead>
				<tbody>
					<c:forEach items="${scoreList}" var="score" varStatus="status">
						<tr>
							<td>${score.get("lct_yr") }</td>
							<td>${score.get("lct_qtr")}</td>
							<td>${score.get("sjt_nm")}</td>
							<td>${score.get("sjt_cd")}</td>
							<td>${score.get("sjt_crd")}</td>
							<c:choose>
								<c:when test="${score.get('tl_point') eq null }">
									<td></td>
									<td></td>
								</c:when>
								<c:otherwise>
									<td>${score.get("tl_point")}</td>
									<td>${score.get("tl_lev")}</td>
								</c:otherwise>
							</c:choose>
							<td>${score.get("tl_mark")}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>