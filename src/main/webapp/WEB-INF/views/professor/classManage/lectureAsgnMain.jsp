<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="col-md-2" id="commonLeftSide">
<%@include file="../common/classManageLectureSideCategory.jsp" %>
</div>

<div class="col-md-10">
	<div class="panel panel-default">
		<div class="panel-heading" style="background-color: #666666;  margin-top: 10px;">
			<h4 style="color: #fff; font-weight: bold; font-size: 20px;">
				과제관리
			</h4>
		</div>
		<div class="panel-body" style="height: 580px;" >
			<table class="table table-hover">
				<c:choose>
					<c:when test="${lctAsgnInfo eq null}">
						<th colspan="8">등록된 과제가 없습니다.</th>						
					</c:when>
					<c:otherwise>
						<thead>
							<tr>
								<th>글번호</th>
								<th>년도</th>
								<th>학기</th>
								<th>과제명</th>
								<th>제출시작일</th>
								<th>제출마감일</th>
								<th>상세페이지</th>
								<th>학생조회</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${lctAsgnInfo }" var="asgn" varStatus="status">
								<tr>
									<td>${status.count }</td>
									<td>${asgn.get('lct_yr') }</td>
									<td>${asgn.get('lct_qtr') }</td>
									<td>${asgn.get('asgn_nm') }</td>
									<td>${asgn.get('asgn_start_date') }</td>
									<td>${asgn.get('asgn_dl_date') }</td>
									<td><button onclick="location.href='${pageContext.request.contextPath}/professor/classManage/lectureAsgnDetail?asgn_num=${asgn.get('asgn_num')}&division=1'">상세페이지</button></td>
									<td><button onclick="location.href='${pageContext.request.contextPath}/professor/classManage/lectureTakeAsgnStudent?asgn_num=${asgn.get('asgn_num')}'">학생조회</button></td>
								</tr>
							</c:forEach>
						</tbody>			
					</c:otherwise>
				</c:choose>
			</table>
			<div>
				<button style="float:right">돌아가기</button>
				<button style="float:right;margin-right:10px" onclick="location.href='lectureRegistryAsgn'">등록</button>
			</div>
		</div>
	</div>
</div>