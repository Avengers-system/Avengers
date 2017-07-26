<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
$(function(){
	$(document).on("click", "#addExamBtn", function(){	
		
		var count = $(".examQn").length+1;
		var qn1 = '';
// 		<input type="hidden" name="eq_qtn_type${status.count}" value="${eqInfo.getEq_qtn_type() }"/>
		if($('#select').val() == 1){
			qn1 = "<div class='examQn'>"+
					"<input type='hidden' class='eq_num' name='eq_num"+count+"' value='-1'/>"+
					"<input type='text' class='eq_qtna' name='eq_qtna"+count+"' readonly value='"+count+"'/>."+
					"<input type='text' class='eq_qtn' name='eq_qtn"+count+"' value=''/>"+
					"배점<input type='text' name='eq_score"+count+"' class='eq_score' style='width:50px'/>"+
					"<br/>"+
					"①<input type='text' class='eq_exmp_one' name='eq_exmp_one"+count+"' value=''/><br/>"+
					"②<input type='text' class='eq_exmp_two' name='eq_exmp_two"+count+"' value=''/><br/>"+
					"③<input type='text' class='eq_exmp_three' name='eq_exmp_three"+count+"' value=''/><br/>"+
					"④<input type='text' class='eq_exmp_four' name='eq_exmp_four"+count+"' value=''/><br/>"+
					"<input type='hidden' class='eq_qtn_type' name='eq_qtn_type"+count+"' value='1'/>"+
					"답:<input type='text' class='eq_ans' name='eq_ans"+count+"' value=''/><input type='button' id='removeExamBtn' value='삭제'/><br/><br/>"+
					"</div> ";
		} else{
			qn1 = "<div class='examQn'>"+
				"<input type='hidden' class='eq_num' name='eq_num"+count+"' value='-1'/>"+
				"<input type='text' class='eq_qtna' name='eq_qtna"+count+"' readonly value='"+count+"'/>."+
				"<input type='text' class='eq_qtn' name='eq_qtn"+count+"' value=''/>"+
				"배점<input type='text' name='eq_score"+count+"' class='eq_score' style='width:50px'/>"+
				"<input type='hidden' class='eq_qtn_type' name='eq_qtn_type"+count+"' value='2'/><br/>"+
				"주관식문항은 문제만 입력가능합니다.<input type='button' id='removeExamBtn' value='삭제'/><br/><br/>"+
				"</div> ";
		}
		if(count == 1){
// 			$("form[name=examRegistry]").after(qn1);
			$("#examRegistryBtn").before(qn1);
		} else {
			$(".examQn").last().after(qn1);
			$(".examQn").last().css("margin-bottom","30px");
		}
	});
	
	$(document).on("click","#removeExamBtn",function(){
// 		$(this).prevAll("input[name]")
		//이거 아작스를 써야될꺼같다.
		//만약에 얻어온 eq_num이 -1이 아니면 db쪽에서 딜리트를 수행해야되고 아니면 그냥 삭제하면됨
		//데이터를 어떻게 넘길까 ==> 페이지 전환이 되면 안되니까 아작스를 써야될꺼같음
		//근데 모든 데이터를 넘겨선 안되. 삭제 버튼 누른곳의 값들만 가져와야된다.
		//그리고 success쪽에 밑에 for문을 넣어야 될꺼같음
		var eq = $(this).prevAll(".eq_num").val();
		if($(".examQn").length == $(this).prevAll(".eq_qtna").val()){
			$(".examQn").last().remove();
		} else {
			$(this).parent().remove();
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
			$(".examQn").eq(i).find($(".eq_qtna")).removeAttr("readonly");			
			$(".examQn").eq(i).attr("id","eq"+(i+1));
			$(".examQn").eq(i).find($(".eq_num")).attr("name","eq_num"+(i+1));
			$(".examQn").eq(i).find($(".eq_qtna")).attr("name","eq_qtna"+(i+1));
			$(".examQn").eq(i).find($(".eq_qtna")).val(i+1+"");
			$(".examQn").eq(i).find($(".eq_qtn")).attr("name","eq_qtn"+(i+1));
			$(".examQn").eq(i).find($(".eq_qtn_type")).attr("name","eq_qtn_type"+(i+1));
			if($(".examQn").eq(i).find($(".eq_qtn_type")).val() == '1'){
				$(".examQn").eq(i).find($(".eq_exmp_one")).attr("name","eq_exmp_one"+(i+1));
				$(".examQn").eq(i).find($(".eq_exmp_two")).attr("name","eq_exmp_two"+(i+1));
				$(".examQn").eq(i).find($(".eq_exmp_three")).attr("name","eq_exmp_three"+(i+1));
				$(".examQn").eq(i).find($(".eq_exmp_four")).attr("name","eq_exmp_four"+(i+1));
				$(".examQn").eq(i).find($(".eq_ans")).attr("name","eq_ans"+(i+1));
			}
			$(".examQn").eq(i).find($(".eq_qtna")).attr("readonly",true);
			$(".examQn").eq(i).find($(".eq_score")).attr("name","eq_score"+(i+1));
// 					}
// 				}
// 			})
		}
		
		
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
 	.eq_ans, .eq_qtna{
 		width:35px;
 		text-align:center;
 	}
 	.eq_qtn{
 		width:483px;
 	}
	
 	.eq_exmp_one, .eq_exmp_two, .eq_exmp_three, .eq_exmp_four{
 		width:500px;
 	}
</style>
<!-- Content -->
<div class="col-md-2" id="commonLeftSide">
<%@include file="../common/classManageLectureSideCategory.jsp" %>
</div>
<div class="col-md-10">
	<div style="overflow:auto;height:900px">
		<h1>시험등록 및 수정</h1>
		<hr/>
		<select id="select" style="height:20px">
			<option value="1">객관식</option>
			<option value="2">주관식</option>
		</select>
		<button id="addExamBtn">추가</button>
		<form name="examRegistry">
			<c:choose>
				<c:when test="${eqList eq null }">
				</c:when>
				<c:otherwise>
					<c:forEach items="${eqList }" var="eqInfo" varStatus="status">
						<div class="examQn">
							문제고유번호 : <input type="hidden" class="eq_num" name="eq_num${status.count}" value="${eqInfo.getEq_num() }" /><br/>
							<input type="text" class="eq_qtna" readonly name="eq_qtna${status.count}" value="${eqInfo.getEq_qtna() }"/>.<input type="text" readonly class="eq_qtn" name="eq_qtn${status.count}" value="${eqInfo.getEq_qtn() }"/>배점<input type="text" name="eq_score${status.count }" class="eq_score" value="${eqInfo.getEq_score()}" style="width:100px"/><br/>
							<input type="hidden" class="eq_qtn_type" name="eq_qtn_type${status.count}" value="${eqInfo.getEq_qtn_type() }"/>
							<c:choose>
								<c:when test="${eqInfo.getEq_qtn_type() eq 1 }">
									①<input type="text" class="eq_exmp_one" name="eq_exmp_one${status.count}" value="${eqInfo.getEq_exmp_one() }"/><br/>
									②<input type="text" class="eq_exmp_two" name="eq_exmp_two${status.count}" value="${eqInfo.getEq_exmp_two() }"/><br/>
									③<input type="text" class="eq_exmp_three" name="eq_exmp_three${status.count}" value="${eqInfo.getEq_exmp_three() }"/><br/>
									④<input type="text" class="eq_exmp_four" name="eq_exmp_four${status.count}" value="${eqInfo.getEq_exmp_four() }"/><br/>
									답:<input type="text" class="eq_ans" name="eq_ans${status.count}" value="${eqInfo.getEq_ans() }"/><input type="button" id="removeExamBtn" value="삭제"/><br/><br/>
								</c:when>
								<c:otherwise>
									주관식문항은 문제만 입력이 가능합니다.<input type="button" id="removeExamBtn" value="삭제"/><br/><br/>
								</c:otherwise>
							</c:choose>
						</div>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			<input type="button" id="examRegistryBtn" value="등록"/>
			<input type="button" value="뒤로가기" onclick="location.href='${pageContext.request.contextPath}/professor/classManage/lectureExamQn?exam_num=${exam_num}&division=1'"/>
<!-- 		status의 마지막값을 파라미터로 넘겨서 확인?? -->
		</form>
	</div>
</div>
