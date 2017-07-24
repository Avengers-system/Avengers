<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Content -->
<div class="col-md-2" id="commonLeftSide">
<%@include file="../common/classManageLectureSideCategory.jsp" %>
</div>
<div class="col-md-10">
	<h1>시험조회</h1>
	<hr/>
	<form>
		<c:choose>
			<c:when test="${eqList eq null }">
				등록된 시험문제가 없습니다.
			</c:when>
			<c:otherwise>
				<c:forEach items="${eqList }" var="eqInfo" varStatus="status">
					<div class="examQn">
						<input type="hidden" name="eq_num" disabled="disabled" value="${eqInfo.getEq_num() }"/><br/>
						${eqInfo.getEq_qtna() }.${eqInfo.getEq_qtn() }<br/>
						<c:choose>
							<c:when test="${eqInfo.getEq_qtn_type() eq 1 }">
								① ${eqInfo.getEq_exmp_one()}<br/>
								② ${eqInfo.getEq_exmp_two()}<br/>
								③ ${eqInfo.getEq_exmp_three()}<br/>
								④ ${eqInfo.getEq_exmp_four()}<br/>
								답:${eqInfo.getEq_ans()}<br/><br/>
							</c:when>
							<c:otherwise>
								주관식문항은 문제만 입력이 가능합니다.<br/><br/>
							</c:otherwise>
						</c:choose>
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</form>
	<button id="ExamEqRegistryBtn">시험등록/수정</button>
	<button onclick="location.href='${pageContext.request.contextPath }/professor/classManage/lectureExam'">뒤로가기</button>
</div>

<script>
	//이제부터 시험기간 등록 및 정정기간에만 등록버튼이 눌리는 걸 만들꺼야
	$(function(){
		$("#ExamEqRegistryBtn").click(function(){
			$.ajax({
				url:'checkRegistryExamDate'
				,type:'post'
				,cache : false
				,success:function(data){
					if(data == '1'){//성공
						var exam = '<c:out value="${exam_num}"/>';
						exam = encodeURIComponent(exam);
						exam = exam.replace("'", "%27");	
						location.href="${pageContext.request.contextPath}/professor/classManage/lectureExamQn?exam_num="+exam+"&division=2";
					} else {//실패
						alert("시험등록시간이 아닙니다.");
					}
				},error:function(){
					alert("다시 시도해주세요.");
				}
				
// 					$.ajax({
//		 				type:'post'
//		 				,url:'removeExamEq'
//		 				,data:{
//		 					eq_num:eq
//		 				}
//		 				,success:function(){
			})
		})
	})
</script>







