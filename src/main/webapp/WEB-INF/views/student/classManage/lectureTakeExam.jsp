<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
	$(function(){
		var index = 0;
		var qtnas = [];
		var answers = [];
		var eqSize = '<c:out value="${eqList.size()}"/>';
		ans_check = function(qtna, ans){
			alert(qtna + " " +ans);
			//이미지태그가 있는 경우를 생각, 즉 답을 처음에 체크했을 때를 생각
			for(var i=0; i<4; i++){
				//만약에 기존에 이미지태그가 존재하면 지워버린다.
				$(".studEq").eq(qtna-1).find($("a")).eq(i).find("img").remove();				
			}
			var imgTag = "<img src='../../resources/images/check.png' class='checkImg' width='20px' style='position:absolute; left:20px'/>";
			$(".studEq").eq(qtna-1).find($("a")).eq(ans-1).prepend(imgTag);
			if(index == 0){
				qtnas[index] = qtna;
				answers[index] = ans;
				index++;
			} else {//처음 답변이 저장될 때, 즉 index=0일 때 문항과 답변을 담아준다.
				for(var i=0; i<index;i++){
					if(qtnas[i] == qtna){//문항이 같은 경우, 해당 문항의 답변만 바꿔준다.
						answers[i] = ans;
						break;
					} else if(i == index - 1){//마지막까지 같은 문항을 찾지 못한 경우, 새로운 문항번호와 답변을 넣어준다.
						qtnas[index] = qtna;
						answers[index] = ans;
						index++;
						break;
					}
				}
			}
		};
		
		exam_submit = function (){
			if(confirm("시험을 응시하시겠습니까??")){
				if(qtnas.length == eqSize){
					var lct = '<c:out value="${lct_num}"/>';
					var te = '<c:out value="${te_num}"/>';
					lct = encodeURIComponent(lct);
					lct = lct.replace("'", "%27");
					te = encodeURIComponent(te);
					te = te.replace("'", "%27");
					$.ajax({
						url:'lectureExamSubmit'
						, type:'post'
						, data:{
							qtnaArr:qtnas,
							answerArr:answers,
							lct_num:lct,
							te_num:te
						},
						success:function(){
							location.href="lectureExam";
						}
					});
				} else {
					alert("풀지 않은 문제가 있습니다.");
				}
			}
		};
		
		$('textarea').blur(function(){
			if(!$(this).val()){
				//처음 쓰고 다 지우고 확인누르면 들어가짐 ㅠㅠ
			} else{
				if(index == 0){
					qtnas[index] = $(this).attr("id");
					answers[index] = $(this).val();
					index++;
				} else{
					for(var i=0; i<index;i++){
						if(qtnas[i] == $(this).attr("id")){//문항이 같은 경우, 해당 문항의 답변만 바꿔준다.
							answers[i] = $(this).val();
							break;
						} else if(i == index - 1){//마지막까지 같은 문항을 찾지 못한 경우, 새로운 문항번호와 답변을 넣어준다.
							qtnas[index] = $(this).attr("id");
							answers[index] = $(this).val();
							index++;
							break;
						}
					}
				}
			}
		})
		
		$("a").hover(
		function(){
			$(this).addClass("a-hover");
		},
		function(){
			$(this).removeClass();
		})
	});
</script>

<style>
	.studEq a{
		text-decoration:none;
	}
	
	.a-hover{
		color:red;
	}
</style>
<!--side Category-->
<%@include file="../common/classManageLectureSideCategory.jsp" %>
<div class="col-md-10">
	<div class="panel panel-default">
		<div class="panel-heading" style="background-color: #2196F3;  margin-top: 10px;">
			<h4 style="color: #fff; font-weight: bold; font-size: 20px;">시험응시</h4>
		</div>
		<div class="panel-body" style="height: 580px; text-align: center;" >
			<!--1.주관식 2.객관식 -->
			<form>
				<c:forEach items="${eqList}" var="eq1" varStatus="status">
					<div class="studEq" style="font-size:20px">
					${eq1.getEq_qtna() }.
					${eq1.getEq_qtn() }(배점:${eq1.getEq_score()}점)<br/>
					<c:choose>
						<c:when test="${eq1.getEq_qtn_type() eq 1}">
							<a href="javascript:ans_check(${eq1.getEq_qtna() },1)">①${eq1.getEq_exmp_one() }</a><br/>
							<a href="javascript:ans_check(${eq1.getEq_qtna() },2)">②${eq1.getEq_exmp_two() }</a><br/>
							<a href="javascript:ans_check(${eq1.getEq_qtna() },3)">③${eq1.getEq_exmp_three() }</a><br/>
							<a href="javascript:ans_check(${eq1.getEq_qtna() },4)">④${eq1.getEq_exmp_four() }</a><br/><br/>
						</c:when>
						<c:otherwise>
							<textarea id="${eq1.getEq_qtna() }" cols="100" rows="10"></textarea><br/><br/>
						</c:otherwise>
					</c:choose>
					</div>
				</c:forEach>
			</form>
			<button onclick="javascript:exam_submit();">제출</button>
		</div>
	</div>
</div>
