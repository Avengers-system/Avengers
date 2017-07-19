<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
$(function(){
	$(document).on("click", "#addBtn", function(){			
		var count = $(".examQn").length+1;
		var qn1 = '';
		if($('#select').val() == 1){
			qn1 = "<div class='examQn'>"+
					"<input type='text' name='eq_qtna' readonly value='"+count+"'/>."+
					"<input type='text' name='eq_qtn' value=''/>"+
					"<br/>"+
					"①<input type='text' name='eq_exmp_one' value=''/><br/>"+
					"②<input type='text' name='eq_exmp_two' value=''/><br/>"+
					"③<input type='text' name='eq_exmp_three' value=''/><br/>"+
					"④<input type='text' name='eq_exmp_four' value=''/><br/>"+
					"답:<input type='text' name='eq_ans' value=''/><input type='button' id='removeBtn' value='삭제'/><br/><br/>"+
					"</div> ";
		} else{
			qn1 = "<div class='examQn'>"+
				"<input type='text' name='eq_qtna' readonly value='"+count+"'/>."+
				"<input type='text' name='eq_qtn' value=''/>"+
				"<br/>"+
				"주관식문항은 문제만 입력가능합니다.<input type='button' id='removeBtn' value='삭제'/><br/><br/>"+
				"</div> ";
		}
		$(".examQn").last().after(qn1);
		//맨 마지막 문제에 마진주자
	});
	
	$(document).on("click","#removeBtn",function(){
		alert($(this).prevAll("input[name=eq_qtna]").val());
		alert($(".examQn").length);
		if($(".examQn").length == $(this).prevAll("input[name=eq_qtna]").val()){
			$(".examQn").last().remove();
		} else {
			$(this).parent().remove();
		}
		
		//eq(index)
		//속성값 변경 $("#").attr("name","새로운네임")
		for(var i = 0; i < $(".examQn").length; i++){
			$(".examQn").eq(i).attr("id","eq"+(i+1));
			$(".examQn").eq(i).find($("input[name=eq_qtna]")).attr("id","qtna"+(i+1)).val(i+1);
			$(".examQn").eq(i).find($("input[name=eq_qtn]")).attr("id","qtn"+(i+1));
		}
	});
})

</script>
<style>
 	input[name=eq_ans], input[name=eq_qtna]{
 		width:25px;
 		text-align:center;
 	}
 	input[name=eq_qtn]{
 		width:483px;
 	}
	
 	input[name=eq_exmp_one], input[name=eq_exmp_two], input[name=eq_exmp_three], input[name=eq_exmp_four]{
 		width:500px;
 	}
</style>
등록구분
<select id="select" style="height:20px">
	<option value="1">객관식</option>
	<option value="2">주관식</option>
</select><button id="addBtn">추가</button>
<form>
	<c:choose>
		<c:when test="${eqList eq null }">
		
		</c:when>
		<c:otherwise>
			<c:forEach items="${eqList }" var="eqInfo" varStatus="status">
				<div class="examQn">
					문제고유번호 : <input type="hidden" name="eq_num" value="${eqInfo.getEq_num() }" /><br/>
					<input type="text" name="eq_qtna" readonly value="${eqInfo.getEq_qtna() }"/>.<input type="text" readonly name="eq_qtn" value="${eqInfo.getEq_qtn() }"/><br/>
					<c:choose>
						<c:when test="${eqInfo.getEq_qtn_type() eq 1 }">
							①<input type="text" name="eq_exmp_one" value="${eq1.getEq_exmp_one() }"/><br/>
							②<input type="text" name="eq_exmp_two" value="${eq1.getEq_exmp_two() }"/><br/>
							③<input type="text" name="eq_exmp_three" value="${eq1.getEq_exmp_three() }"/><br/>
							④<input type="text" name="eq_exmp_four" value="${eq1.getEq_exmp_four() }"/><br/>
							답:<input type="text" name="eq_ans" value="${eq1.getEq_ans() }"/><input type="button" id="removeBtn" value="삭제"/><br/><br/>
						</c:when>
						<c:otherwise>
							주관식문항은 문제만 입력이 가능합니다.<input type="button" id="removeBtn" value="삭제"/><br/><br/>
						</c:otherwise>
					</c:choose>
				</div>
			</c:forEach>
		</c:otherwise>
	</c:choose>
	<input type="button" value="등록"/>
	<input type="button" value="뒤로가기" onclick="location.href='${pageContext.request.contextPath}/professor/classManage/lectureExamQn?exam_num=${exam_num}&division=1'"/>
</form>
