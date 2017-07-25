<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Content -->
<div class="col-md-2" id="commonLeftSide">
<%@include file="../common/classManageLectureSideCategory.jsp" %>
</div>
<div class="col-md-10">
<script>
	//미응시인 경우 학생답안을 조회할 수 없음
	function takeExamCheck(te_check, te_num, stud_num, exam_num){
		if(te_check == '응시'){
			location.href="${pageContext.request.contextPath}/professor/classManage/lectureStudentAnswer?te_num="+te_num+"&stud_num="+stud_num+"&exam_num="+exam_num;
		} else{
			alert("시험에 미응시한 학생의 답안은 조회하실수 없습니다");
		}
	}
	//TE테이블에서 점수가져와가지고 채점을 한 학생들은 점수 써주고 채점 아직 안한 학생들은 미채점이라고 써주자
</script>
	<h1>응시자화면</h1>
	<hr/>
	
	<!-- 만약에 응시자가 존재하지 않는 경우가 있나?? -->
	<c:if test="${studTeList eq null }">
		<!-- 비어있는 경우 -->
	</c:if>
	
	<table class="table table-hover">
		<thead>
			<tr>
				<th>번호</th>
				<th>과목명</th>
				<th>분반</th>
<!-- 				<th>시험유형</th> -->
				<th>학번</th>
				<th>학생이름</th>
				<th>HP</th>
				<th>응시여부</th>
				<th>점수</th>
				<th>학생답안</th>
			</tr>	
		</thead>
		<tbody>  
			<c:forEach items="${studTeList}" var="studTe" varStatus="status">
				<tr>
					<td>${status.count }</td>
					<td>${studTe.get("lct_nm") }</td>
					<td>${studTe.get("lct_nm_class") }</td>
<%-- 					<td>${studTe.get("exam_type") }</td> --%>
					<td>${studTe.get("stud_num") }</td>
					<td>${studTe.get("stud_nm") }</td>
					<td>${studTe.get("stud_hp") }</td>
					<td>${studTe.get("te_check") }</td>
					<c:choose>
						<c:when test="${not empty studTe.get('te_exam_point')}">
							<td>${studTe.get("te_exam_point") }</td>
						</c:when>
						<c:otherwise>
							<td>미채점</td>
						</c:otherwise>
					</c:choose>
					<td><button onclick="javascript:takeExamCheck('${studTe.get('te_check')}','${studTe.get('te_num') }','${studTe.get('stud_num')}','${exam_num }');">이동</button></td>
<%-- 					<td><button onclick="location.href='${pageContext.request.contextPath}/professor/classManage/lectureStudentAnswer?te_num=${studTe.get('te_num') }&stud_num=${studTe.get('stud_num')}&exam_num=${exam_num }'">보러가기</button></td> --%>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<!-- 이제 응시한 학생의 답안을 볼 수 있어야 한다 -->
