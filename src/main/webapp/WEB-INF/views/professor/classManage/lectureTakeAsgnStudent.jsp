<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../common/classManageLectureSideCategory.jsp"%>
<div class="col-md-10">
	<div class="panel panel-default">
		<div class="panel-heading" style="background-color: #666666;  margin-top: 10px;">
			<h4 style="color: #fff; font-weight: bold; font-size: 20px;">과제학생조회</h4>
		</div>
		<div class="panel-body">
			<table class="table table-hover">
				<c:choose>
					<c:when test="${asgnOfStudList eq null}">
						<th colspan="8">수강중인 학생이 존재하지 않습니다.</th>						
					</c:when>
					<c:otherwise>
						<thead>
							<tr>
								<th>글번호</th>
								<th>단과대학</th>
								<th>전공학과</th>
								<th>학번</th>
								<th>이름</th>
								<th>HP</th>
								<th>제출</th>
								<th>점수</th>
								<th>상세페이지</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${asgnOfStudList }" var="asgnOfStud" varStatus="status">
								<tr>
									<td>${status.count }</td>
									<td>${asgnOfStud.get('col_nm') }</td>
									<td>${asgnOfStud.get('dept_nm') }</td>
									<td>${asgnOfStud.get('stud_num') }</td>
									<td>${asgnOfStud.get('stud_nm') }</td>
									<td>${asgnOfStud.get('stud_hp') }</td>
									<td>${asgnOfStud.get('sub_check') }</td>
									<c:choose>
										<c:when test="${asgnOfStud.get('sub_sjt_point') == -1}">
											<td>미채점</td>
										</c:when>
										<c:otherwise>
											<td>${asgnOfStud.get('sub_sjt_point') }</td>									
										</c:otherwise>
									</c:choose>
									<td><button style="padding:5px" class="btn btn-outline btn-primary" onclick="location.href='${pageContext.request.contextPath}/professor/classManage/lectureAsgnStudentDetail?sub_num=${asgnOfStud.get('sub_num')}'">이동</button></td>
								</tr>
							</c:forEach>
						</tbody>			
					</c:otherwise>
				</c:choose>
			</table>
		<div>
			<button onclick="location.href='lectureAsgnMain'" style="float:right" class="btn btn-outline btn-primary">돌아가기</button>
		</div>
		</div>
	</div>
</div>