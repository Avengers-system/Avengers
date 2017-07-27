<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../common/classManageLectureSideCategory.jsp"%>

<div class="col-md-10">
	<div class="panel panel-default">
		<div class="panel-heading"
		style="background-color: #666666; margin-top: 10px;">
			<h4 style="color: #fff; font-weight: bold; font-size: 20px;">
			시험문제등록</h4>
		</div>
		<div class="panel-body">
			<form>
				<c:choose>
					<c:when test="${eqList eq null }">
						등록된 시험문제가 없습니다.
					</c:when>
				<c:otherwise>
					<c:forEach items="${eqList }" var="eqInfo" varStatus="status">
						<div class="examQn" style="font-size:20px">
							<div style="border:2px solid lightgrey;width:100%">
							<input type="hidden" name="eq_num" disabled="disabled" value="${eqInfo.getEq_num() }"/>
								<b>문제${eqInfo.getEq_qtna() }</b>.${eqInfo.getEq_qtn() }(배점:${eqInfo.getEq_score()}점)<br/>
							</div>
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
			<button id="ExamEqRegistryBtn" class="btn btn-outline btn-primary">시험등록/수정</button>
			<button onclick="location.href='${pageContext.request.contextPath }/professor/classManage/lectureExam'" class="btn btn-outline btn-primary">뒤로가기</button>
		</div>
	</div>
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







