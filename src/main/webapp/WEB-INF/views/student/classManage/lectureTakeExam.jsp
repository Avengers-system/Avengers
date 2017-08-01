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
		var index = 0;
		var qtnas = [];
		var answers = [];
		var eqSize = '<c:out value="${eqList.size()}"/>';
		var horizental = 72;
		var vertical = 89;
		ans_check = function(qtna, ans){
			//이미지태그가 있는 경우를 생각, 즉 답을 처음에 체크했을 때를 생각
			for(var i=0; i<4; i++){
				//만약에 기존에 이미지태그가 존재하면 지워버린다.
				$(".studEq").eq(qtna-1).find($("a")).eq(i).find("img").remove();
				$(".answerSheet").eq(qtna-1).find($("td")).eq(i).find("img").remove();
			}
			var imgTag = "<img src='../../resources/images/check.png' class='checkImg' width='20px' style='position:absolute; left:34px'/>";
			$(".studEq").eq(qtna-1).find($("a")).eq(ans-1).prepend(imgTag);
			var imgTag = "<img src='../../resources/images/circle.png' class='answerImg' width='20px' style='position:absolute; left:"+(horizental+(ans-1)*49)+"px; top:"+(vertical+((qtna-1)*39))+"px'/>";
			$(".answerSheet").eq(qtna-1).find($("td")).eq(ans-1).prepend(imgTag);
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
		
		//시험응시
		exam_submit = function (){
			if(confirm("시험을 제출하시겠습니까??")){
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
						success:function(result){
							location.href="lectureExam";
// 							if(result > 0){
// 								alert("시험응시가 정상적으로 완료되었습니다.");
// 								location.href="lectureExam";
// 							} else {
// 								alert("시험응시가 비정상처리되었습니다.");
// 							}
// 						}, error:function(){
// 							alert("잠시후에 다시 시도해주세요");
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
				$(".answerSheet").eq($(this).parent(".studEq").index()).find($("td")).eq(1).find($("img")).remove();
				//답안을 다 쓰고 지운 경우 배열에서도 삭제해주어야 하기 때문에 검사실시
				for(var i=0; i<index; i++){
					if(qtnas[i] == $(this).attr("id")){//문항 같은 걸 찾은 경우
						qtnas.splice(i, 1); //문항 삭제
						answers.splice(i,1); //문항에 해당하는 답변 삭제
						index--;
						break;
					}
				}
				
			} else{
				//기존에 완료이미지가 있는 경우는 삭제
				if($(".answerSheet").eq($(this).parent(".studEq").index()).find($("td")).eq(1).find($("img")).length > 0){
					$(".answerSheet").eq($(this).parent(".studEq").index()).find($("td")).eq(1).find($("img")).remove();
				}
				//완료 이미지를 문항에 맞는 td에 넣어준다.
				var imgTag = "<img src='../../resources/images/completed.png' class='checkImg' width='70px' style='position:absolute; left:115px; top:"+(vertical+($(this).parent(".studEq").index()*39))+"px''/>";
				$(".answerSheet").eq($(this).parent(".studEq").index()).find($("td")).eq(1).prepend(imgTag);
				//index가 0인 경우
				if(index == 0){
					qtnas[index] = $(this).attr("id");
					answers[index] = $(this).val();
					index++;
				} else{//index가 0이 아닌 경우, 즉 다른 값이 들어있는 경우
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
	
	td{
		border:2px solid black;
	}
</style>
<!--side Category-->
<%@include file="../common/classManageLectureSideCategory.jsp" %>
<div class="col-md-8">
	<div class="panel panel-default">
		<div class="panel-heading" style="background-color: #2196F3;  margin-top: 10px;">
			<h4 style="color: #fff; font-weight: bold; font-size: 20px;">시험응시</h4>
		</div>
		<div class="panel-body">
			<!--1.주관식 2.객관식 -->
			<form>
				<c:forEach items="${eqList}" var="eq1" varStatus="status">
					<div class="studEq" style="font-size:20px">
					<div style="border:2px solid lightgrey;width:87.5%">
						<b>문제${eq1.getEq_qtna() }</b>.
						${eq1.getEq_qtn() }(배점:${eq1.getEq_score()}점)
					</div>
					<c:choose>
						<c:when test="${eq1.getEq_qtn_type() eq 1}">
							<a href="javascript:ans_check(${eq1.getEq_qtna() },1)">①${eq1.getEq_exmp_one() }</a><br/>
							<a href="javascript:ans_check(${eq1.getEq_qtna() },2)">②${eq1.getEq_exmp_two() }</a><br/>
							<a href="javascript:ans_check(${eq1.getEq_qtna() },3)">③${eq1.getEq_exmp_three() }</a><br/>
							<a href="javascript:ans_check(${eq1.getEq_qtna() },4)">④${eq1.getEq_exmp_four() }</a><br/><br/>
						</c:when>
						<c:otherwise>
							<textarea id="${eq1.getEq_qtna() }" cols="101" rows="10"></textarea><br/><br/>
						</c:otherwise>
					</c:choose>
					</div>
				</c:forEach>
			</form>
			<button onclick="javascript:exam_submit();" class="btn btn-outline btn-primary">제출</button>
		</div>
	</div>
</div>



















<div class="col-md-2">
	<div class="panel panel-default" style="position:fixed; width:270px; height:500px">
		<div class="panel-heading" style="background-color: #2196F3;  margin-top: 10px;">
			<h4 style="color: #fff; font-weight: bold; font-size: 20px;">답안지</h4>
		</div>
		<div class="panel-body">
			<table style="width:100%;height:15px;text-align:center">
				<tbody>
					<c:forEach items="${eqList}" var="eq1" varStatus="status">
						<tr class="answerSheet" style="height:35px">
						<td>${status.count }</td>
						<c:choose>
							<c:when test="${eq1.getEq_qtn_type() eq 1}">
									<td>①</td>
									<td>②</td>
									<td>③</td>
									<td>④</td>
							</c:when>
							<c:otherwise>
									<td colspan="4"></td>
							</c:otherwise>
						</c:choose>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
