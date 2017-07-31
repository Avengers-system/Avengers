<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--side Category-->
<%@include file="../common/classManageLectureSideCategory.jsp" %>
<div class="col-md-10">
	<div class="panel panel-default">
		<div class="panel-heading" style="background-color: #2196F3;  margin-top: 10px;">
			<h4 style="color: #fff; font-weight: bold; font-size: 20px;">시험</h4>
		</div>
		<div class="panel-body" style=" text-align: center;" >
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
						<td><button style="padding:5px" class="btn btn-outline btn-primary" onclick="javascript:takeExamTimeCheck('${exam.get('te_check')}','${exam.get('exam_num') }','${exam.get('te_num') }')">입장</button></td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
<script>
	$(function(){
		takeExamTimeCheck = function(te_check, exam_num, te_num){
			//시험에 응시한 경우 입장 불가능
			if(te_check == '응시'){
				alert('시험응시는 한번만 가능합니다.');
			} else{//시험에 미응시한 경우 시험일에만 입장가능
				//현재시간과 시험시간을 비교
				//아작스를 통해 구현
				$.ajax({
					url:'StudExamTimeCheck'
					, type:'post'
					, data:{
						exam_num:exam_num
					}
					,success:function(result){
						//시험 시작시간과 종료시간 사이에 있으면 접속이 가능하게 한다
						//result = 1(접속가능) result = -1(접속불가능)
						if(result == '1'){
							location.href="${pageContext.request.contextPath}/student/classManage/lectureTakeExam?exam_num="+exam_num+"&te_num="+te_num;
						} else if(result == '-1'){
							alert("응시가 불가능합니다(-1:시험시간이 아닙니다)");
						} else if(result == '0'){
							alert("오류");
						}
					}
					,error:function(){
						alert("잠시후에 다시 시도해주세요.");
					}
				});
			}
		}
		
	})
</script>