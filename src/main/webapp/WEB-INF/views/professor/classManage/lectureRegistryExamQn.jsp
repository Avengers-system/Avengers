<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
//2017.07.30추가
window.onload = function() {
		fncClearTime();
		initTimer();
		removeCheck=0;
		removeTimer();
	}
$(function(){	
	$(document).on("click", "#addExamBtn", function(){	
		
		var count = $(".examQn").length+1;
		var qn1 = '';
// 		<input type="hidden" name="eq_qtn_type${status.count}" value="${eqInfo.getEq_qtn_type() }"/>
		if($('#select').val() == 1){
			qn1 = "<div class='examQn'><input type='hidden' class='eq_qtn_type' name='eq_qtn_type"+count+"' value='1'/><input type='hidden' class='eq_num' name='eq_num"+count+"' value='-1' /><table class='registryExamQnTable'><tr><th>문항</th><td colspan='4' style='font-size:15px'><input type='text' class='eq_qtna' readonly name='eq_qtna"+count+"' value='"+count+"'/></td></tr><tr><th>문제</th><td colspan='4'><input type='text' class='eq_qtn' name='eq_qtn"+count+"' value='' style='width:900px;padding-top:5px;padding-bottom:5px'/></td></tr><tr><th>①</th><td colspan='4'><input type='text' class='eq_exmp_one' name='eq_exmp_one"+count+"' value='' style='width:900px;padding-top:5px;padding-bottom:5px'/></td></tr><tr><th>②</th><td colspan='4'><input type='text' class='eq_exmp_two' name='eq_exmp_two"+count+"' value='' style='width:900px;padding-top:5px;padding-bottom:5px'/></td></tr><tr><th>③</th><td colspan='4'><input type='text' class='eq_exmp_three' name='eq_exmp_three"+count+"' value='' style='width:900px;padding-top:5px;padding-bottom:5px'/></td></tr><tr><th>④</th><td colspan='4'><input type='text' class='eq_exmp_four' name='eq_exmp_four"+count+"' value='' style='width:900px;padding-top:5px;padding-bottom:5px'/></td></tr><tr><th>정답</th><td style='width:250px'><input type='text' class='eq_ans' name='eq_ans"+count+"' value=''/></td><th>점수</th><td style='width:250px'><input type='text' name='eq_score"+count+"' class='eq_score' value=''/></td><td style='width:50px;text-align:center'><input type='button' id='removeExamBtn' class='btn btn-outline btn-primary' value='삭제'/></td></tr></table><hr/></div>";
		} else{
			qn1 = "<div class='examQn'><input type='hidden' class='eq_qtn_type' name='eq_qtn_type"+count+"' value='2'/><input type='hidden' class='eq_num' name='eq_num"+count+"' value='-1' /><table class='registryExamQnTable'><tr><th>문항</th><td colspan='4' style='font-size:15px'><input type='text' class='eq_qtna' readonly name='eq_qtna"+count+"' value='"+count+"'/></td></tr><tr><th>문제</th><td colspan='4'><input type='text' class='eq_qtn' name='eq_qtn"+count+"' value='' style='width:900px;padding-top:5px;padding-bottom:5px'/></td></tr><tr><th></th><td colspan='4'>주관식 문항은 문제등록만 가능합니다.</td></tr><tr><th>점수</th><td style='width:250px'><input type='text' name='eq_score"+count+"' class='eq_score' value=''/></td><td style='width:50px;text-align:center'><input type='button' id='removeExamBtn' class='btn btn-outline btn-primary' value='삭제'/></td></tr></table><hr/></div>";
		}
		if(count == 1){
// 			$("form[name=examRegistry]").after(qn1);
			$("#examRegistryBtn").before(qn1);
		} else {
			$(".examQn").last().after(qn1);
			$(".examQn").last().css("margin-bottom","30px");
		}
	});
	
	$(document).on("click","#removeExamBtn1",function(){
		alert($(".examQn").eq(0).find($(".registryExamQnTable")).eq(0).find($(".eq_qtna")).val());	
		alert($(".examQn").eq(1).find($(".registryExamQnTable")).eq(0).find($(".eq_qtna")).val());
		alert($(".examQn").eq(2).find($(".registryExamQnTable")).eq(0).find($(".eq_qtna")).val());
		alert($(".examQn").eq(0).find($(".eq_num")).val());
		alert($(this).parents(".examQn").find($(".eq_qtna")).val());
		alert($(".examQn").length);
		alert($(this).parents(".examQn").remove());
		
	})
	
	$(document).on("click","#removeExamBtn",function(){
// 		$(this).prevAll("input[name]")
		//이거 아작스를 써야될꺼같다.
		//만약에 얻어온 eq_num이 -1이 아니면 db쪽에서 딜리트를 수행해야되고 아니면 그냥 삭제하면됨
		//데이터를 어떻게 넘길까 ==> 페이지 전환이 되면 안되니까 아작스를 써야될꺼같음
		//근데 모든 데이터를 넘겨선 안되. 삭제 버튼 누른곳의 값들만 가져와야된다.
		//그리고 success쪽에 밑에 for문을 넣어야 될꺼같음
		var eq = $(this).prevAll(".eq_num").val();
		
		if($(".examQn").length == $(this).parents(".examQn").find($(".eq_qtna")).val()){
			$(".examQn").last().remove();
		} else {
			$(this).parents(".examQn").remove();
		}
		
// 		if(eq != '-1'){
// 			$.ajax({
// 				type:'post'
// 				,url:'removeExamEq'
// 				,data:{
// 					eq_num:eq
// 				}
// 				,success:function(){
		for(var i = 0; i < $(".examQn").length; i++){
// 			$(".examQn").eq(i).find($(".eq_qtna")).removeAttr("readonly");		
// 			$(".examQn").eq(i).attr("id","eq"+(i+1));
			//$(".examQn").eq(i).find($(".eq_num")).attr("name","eq_num"+(i+1));
			$(".examQn").eq(i).find($(".eq_num")).attr("name","eq_num"+(i+1));
			
			//$(".examQn").eq(i).find($(".eq_qtna")).attr("name","eq_qtna"+(i+1));
			$(".examQn").eq(i).find($(".registryExamQnTable")).eq(0).find($(".eq_qtna")).attr("name","eq_qtna"+(i+1));
			
			//$(".examQn").eq(i).find($(".eq_qtna")).val(i+1+"");
			$(".examQn").eq(i).find($(".registryExamQnTable")).eq(0).find($(".eq_qtna")).val(i+1+"");
			
			//$(".examQn").eq(i).find($(".eq_qtn")).attr("name","eq_qtn"+(i+1));
			$(".examQn").eq(i).find($(".registryExamQnTable")).eq(0).find($(".eq_qtn")).attr("name","eq_qtn"+(i+1));
			
			//$(".examQn").eq(i).find($(".eq_qtn_type")).attr("name","eq_qtn_type"+(i+1));
			$(".examQn").eq(i).find($(".eq_qtn_type")).attr("name","eq_qtn_type"+(i+1));
			if($(".examQn").find($(".eq_qtn_type")).val() == '1'){
				$(".examQn").eq(i).find($(".registryExamQnTable")).eq(0).find($(".eq_exmp_one")).attr("name","eq_exmp_one"+(i+1));
				$(".examQn").eq(i).find($(".registryExamQnTable")).eq(0).find($(".eq_exmp_two")).attr("name","eq_exmp_two"+(i+1));
				$(".examQn").eq(i).find($(".registryExamQnTable")).eq(0).find($(".eq_exmp_three")).attr("name","eq_exmp_three"+(i+1));
				$(".examQn").eq(i).find($(".registryExamQnTable")).eq(0).find($(".eq_exmp_four")).attr("name","eq_exmp_four"+(i+1));
				$(".examQn").eq(i).find($(".registryExamQnTable")).eq(0).find($(".eq_ans")).attr("name","eq_ans"+(i+1));
			}
			//$(".examQn").eq(i).find($(".eq_qtna")).attr("readonly",true);
			$(".examQn").eq(i).find($(".registryExamQnTable")).eq(0).find($(".eq_score")).attr("name","eq_score"+(i+1));
			
// 					}
// 				}
// 			})
		}
		$(this).parents(".examQn").find($("hr")).remove();
		
		//eq(index)
		//속성값 변경 $("#").attr("name","새로운네임")
	});
	
	
	
	$(document).on("click","#examRegistryBtn", function(){
		var length = $(".examQn").length;
		var exam = '<c:out value="${exam_num}"/>';
		exam = encodeURIComponent(exam);
		exam = exam.replace("'", "%27");
		document.examRegistry.method= "post";
		document.examRegistry.action = "registryExamEq?length="+length+"&exam_num="+exam;
		document.examRegistry.submit();
	})
})

</script>
<style>
/*  	.eq_ans, .eq_qtna{ */
/*  		width:35px; */
/*  		text-align:center; */
/*  	} */
/*  	.eq_qtn{ */
/*  		width:600px; */
/*  	} */
	
/*  	.eq_exmp_one, .eq_exmp_two, .eq_exmp_three, .eq_exmp_four{ */
/*  		width:600px; */
/*  	} */
 	
 	#removeExamBtn{
 		margin-left:15px
 	}
 	
 	.registryExamQnTable{
 		margin-top:20px;
 	}
 	
 	.registryExamQnTable th{
 		border:0;
 		width:60px;
 		font-size:15px;
 		text-align:center;
 	}
 	
 	.registryExamQnTable td{
 		width:1000px;
 	}
 	
 	input[type=text]{
 		height:30px;
 	}
</style>
<%@include file="../common/classManageLectureSideCategory.jsp"%>

<div class="col-md-10">
	<div class="panel panel-default">
		<div class="panel-heading"
			style="background-color: #666666; margin-top: 10px;">
			<h4 style="color: #fff; font-weight: bold; font-size: 20px;">시험등록 및 수정</h4>
		</div>
		<div class="panel-body">
			<div>
				<select id="select" style="height:40px">
					<option value="1">객관식</option>
					<option value="2">주관식</option>
				</select>
				<button id="addExamBtn" class="btn btn-outline btn-primary" style="margin-bottom:4px">추가</button>
			</div>
			<form name="examRegistry">
				<c:forEach items="${eqList }" var="eqInfo" varStatus="status">
					<div class="examQn">
						<input type="hidden" class="eq_qtn_type" name="eq_qtn_type${status.count}" value="${eqInfo.getEq_qtn_type() }"/>
						<input type="hidden" class="eq_num" name="eq_num${status.count}" value="${eqInfo.getEq_num() }" />
						<table class="registryExamQnTable">
							<tr>
								<th>문항</th>
								<td colspan="4" style="font-size:15px"><input type="text" class="eq_qtna" readonly name="eq_qtna${status.count}" value="${eqInfo.getEq_qtna() }"/></td>
							</tr>
							<tr>
								<th>문제</th>
								<td colspan="4"><input type="text" class="eq_qtn" name="eq_qtn${status.count}" value="${eqInfo.getEq_qtn() }" style="width:900px;padding-top:5px;padding-bottom:5px"/></td>
							</tr>
							<c:choose>
								<c:when test="${eqInfo.getEq_qtn_type() eq 1 }">
									<tr>
										<th>①</th>
										<td colspan="4"><input type="text" class="eq_exmp_one" name="eq_exmp_one${status.count}" value="${eqInfo.getEq_exmp_one() }" style="width:900px;padding-top:5px;padding-bottom:5px"/></td>
									</tr>
									<tr>
										<th>②</th>
										<td colspan="4"><input type="text" class="eq_exmp_two" name="eq_exmp_two${status.count}" value="${eqInfo.getEq_exmp_two() }" style="width:900px;padding-top:5px;padding-bottom:5px"/></td>
									</tr>
									<tr>
										<th>③</th>
										<td colspan="4"><input type="text" class="eq_exmp_three" name="eq_exmp_three${status.count}" value="${eqInfo.getEq_exmp_three() }" style="width:900px;padding-top:5px;padding-bottom:5px"/></td>
									</tr>
									<tr>
										<th>④</th>
										<td colspan="4"><input type="text" class="eq_exmp_four" name="eq_exmp_four${status.count}" value="${eqInfo.getEq_exmp_four() }" style="width:900px;padding-top:5px;padding-bottom:5px"/></td>
									</tr>
									<tr>
										<th>정답</th>
										<td style="width:250px"><input type="text" class="eq_ans" name="eq_ans${status.count}" value="${eqInfo.getEq_ans() }"/></td>
										<th>점수</th>
										<td style="width:250px"><input type="text" name="eq_score${status.count }" class="eq_score" value="${eqInfo.getEq_score()}"/></td>
										<td style="width:50px;text-align:center"><input type="button" id="removeExamBtn" class="btn btn-outline btn-primary" value="삭제"/></td>			
									</tr>
								</c:when>
								<c:otherwise>
									<tr>
										<th></th>
										<td colspan="4">주관식 문항은 문제등록만 가능합니다.</td>
									</tr>
									
									<tr>
										<th>점수</th>
										<td style="width:250px"><input type="text" name="eq_score${status.count }" class="eq_score" value="${eqInfo.getEq_score()}"/></td>
										<td style="width:50px;text-align:center"><input type="button" id="removeExamBtn" class="btn btn-outline btn-primary" value="삭제"/></td>			
									</tr>
								</c:otherwise>
							</c:choose>
						</table>
						<hr style="border:1px solid green"/>
					</div>
				</c:forEach>
				<input type="button" id="examRegistryBtn" value="등록" class="btn btn-outline btn-primary"/>
				<input type="button" value="뒤로가기" onclick="location.href='${pageContext.request.contextPath}/professor/classManage/lectureExamQn?exam_num=${exam_num}&division=1'" class="btn btn-outline btn-primary"/>
			</form>
		</div>
	</div>
</div>
