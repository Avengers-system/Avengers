<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Content -->
<div class="col-md-2" id="commonLeftSide">
<%@include file="../common/classManageLectureSideCategory.jsp" %>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script>
	$(function(){
		//만약 채점되있는걸 들어오면 saNumArr이랑 saCheckArr을 맞춰줘야됨, index도
		//이거 내일 꼭 해요
		var index=0;
		var saNumArr = [];
		var saCheckArr = [];
		$(document).ready(function(){
			var count = $(".examSa").length;
			for(var i=0; i<count; i++){
				var sa_ans = $(".examSa").eq(i).find($(".sa_ans")).text();
				var imgTag = "<img src='../../resources/images/check.png' width='20px' style='position:absolute; left:37px'/>";
				if($(".examSa").eq(i).find($(".eq_qtn_type")).text() == '1'){
					if(sa_ans == '1'){
						$(".examSa").eq(i).find($(".one")).prepend(imgTag);
					} else if(sa_ans == '2'){
						$(".examSa").eq(i).find($(".two")).prepend(imgTag);
					} else if(sa_ans == '3'){
						$(".examSa").eq(i).find($(".three")).prepend(imgTag);
					} else if(sa_ans == '4'){
						$(".examSa").eq(i).find($(".four")).prepend(imgTag);
					}
				}
				if($(".examSa").eq(i).find($(".sa_check")).text()>0){
					saNumArr[i] = $(".examSa").eq(i).find($(".sa_num")).text(); 
					saCheckArr[i] = $(".examSa").eq(i).find($(".sa_check")).text();
					if($(".examSa").eq(i).find($(".sa_check")).text() == '1'){
						$(".examSa").eq(i).find($(".eq_qtna")).prepend("<img src='../../resources/images/answer2.png' class='answerImg' width='100px' style='position:absolute;left:5px'/>");
					}else{
						$(".examSa").eq(i).find($(".eq_qtna")).prepend("<img src='../../resources/images/x2.png' class='answerImg' width='45px' style='position:absolute;left:20px'/>");
					}
				}
			}
		});
		
		$(document).on("click" , "#autoAnswer", function(){
			var count = $(".examSa").length;
			$('#autoAnswer').removeAttr("id");
			for(var i=0; i<count; i++){
				//객관식인지 주관식인지를 알아야됨
				//객관식인 경우
				if($(".examSa").eq(i).find($(".eq_qtn_type")).text() == '1'){
					//학생풀이 기본키를 저장
					saNumArr[index] = $(".examSa").eq(i).find($(".sa_num")).text();
					//기존에 있는 img를 삭제
					if($(".examSa").eq(i).find(".answerImg").length>0){
						$(".examSa").eq(i).find(".answerImg").remove();
					}
					//학생이 푼 답안과 교수가 등록한 답안이 같은지를 비교
					if($(".examSa").eq(i).find($(".sa_ans")).text() == $(".examSa").eq(i).find($(".eq_ans")).text()){
						//답인경우 1
						$(".examSa").eq(i).find($(".eq_qtna")).prepend("<img src='../../resources/images/answer2.png' class='answerImg' width='100px' style='position:absolute;left:5px'/>");
						saCheckArr[index] = '1';
						index++;
					} else{
						$(".examSa").eq(i).find($(".eq_qtna")).prepend("<img src='../../resources/images/x2.png' class='answerImg' width='45px' style='position:absolute;left:20px'/>");
						saCheckArr[index] = '2';
						index++;
						//오답인경우 2
					}
				}
			}
			alert("객관식 자동채점은 1회만 제공됩니다.");
		})
		//주관식 답안을 위한 점수배정
		$(document).on("click", ".answerBtn, .wrongBtn", function(){
			//처음에 채점하고 변경할수도 있으니까 일단 있나 없나를 확인해야됨
			var saNum = $(this).siblings(".sa_num").text();
			if(saNumArr.length != 0){
				//saNum(기본키)를 비교해서 있는지 없는지 확인
				for(var i=0;i<saNumArr.length;i++){
					if(saNumArr[i] == saNum){
						saCheckArr[i] = $(this).val();
						break;
					} else if(i == saNumArr.length - 1){
						saNumArr[index] = saNum;
						saCheckArr[index] = $(this).val();
						index++;
					}
				}
			} else {
				//방이 0인 경우는 비교할 대상이 없으므로 pass
				saNumArr[index] = saNum;
				saCheckArr[index] = $(this).val();
				index++;
			}
			if($(this).siblings(".eq_qtna").children("img").length > 0){
				//변경
				if($(this).val()==1){
					alert("change img success");
// 					$(this).siblings(".eq_qtna").css({'position':'relative','right':'100px'});
					$(this).siblings(".eq_qtna").children("img").attr({'src':'../../resources/images/answer2.png','width':'100px'}).css({'position':'absolute','left':'5px'});
				}else{
					alert("change img fail");
// 					$(this).siblings(".eq_qtna").css({'position':'relative','right':'45px'});
					$(this).siblings(".eq_qtna").children("img").attr({'src':'../../resources/images/x2.png','width':'45px'}).css({'position':'absolute','left':'20px'});
				}
			} else {
				//새로운 img태그 입력
				if($(this).val() == 1){
					alert("new img success");
					$(this).siblings(".eq_qtna").prepend("<img src='../../resources/images/answer2.png' width='100px' style='position:absolute;left:5px'/>");
				} else{
					alert("new img fail");
					$(this).siblings(".eq_qtna").prepend("<img src='../../resources/images/x2.png' width='45px' style='position:absolute;left:20px'/>");
				}
			}
		})
		
		gradingSuccess = function(){
			if($(".examSa").length == saNumArr.length){
				var te = '<c:out value="${te_num}"/>';
				te = encodeURIComponent(te);
				te = te.replace("'", "%27");
				alert(te);
				$.ajax({
					url:'${pageContext.request.contextPath}/professor/classManage/lectureStudentAnswerUpdate'
					,type:'post'
					,data:{
						saNumArr : saNumArr,
						saCheckArr : saCheckArr,
						te_num : te
					},
					success:function(result){
						if(result == '-1'){
							//실패 시 해당페이지에 머물러있음
							alert("잠시후에 다시 시도해주세요");
						} else{
							//성공시 화면이동
							alert("채점이 완료되었습니다. 채점란에서 점수를 확인하세요!");
							var exam_num = '<c:out value="${exam_num}"/>';
							exam_num = encodeURIComponent(exam_num);
							exam_num = exam_num.replace("'", "%27");
							location.href="${pageContext.request.contextPath}/professor/classManage/lectureTakeExamStudent?exam_num="+exam_num;
						}
						//점수계산하고 시험점수 시험테이블에 저장
						//채점한 점수를 업데이트
					},
					error:function(){
						//문제가 아무것도 없을 때 이동하는 거 같은데, 테스트용 데이터를 넣어서 정확하진 않음.
						alert("다시 시도해주세요");
					}
				})
			} else {
				//examSa와 saNumArr의 길이가 같이 않으면 채점이 되지 않은 문항이 존재함으로 back
				alert("채점이 안된 문항이 존재합니다.");
			}
		}
	})
</script>
<div class="col-md-10">
	<h1>학생답안</h1>
	<hr/>
	<div>
		<form>
		소속 : <input type="text" value="${studInfo.get('col_nm')}"/> &nbsp; 
		학과 : <input type="text" value="${studInfo.get('dept_nm')}"/> &nbsp; 
		학번 : <input type="text" value="${studInfo.get('stud_num') }"/> &nbsp; 
		이름 : <input type="text" value="${studInfo.get('stud_nm') }"/> &nbsp;
		HP : <input type="text" value="${studInfo.get('stud_hp') }"/> &nbsp; 
		E-mail : <input type="text" value="${studInfo.get('stud_email') }"/> &nbsp;
		<!-- 완료되면 채점을 보여줘야 되는뎁 -->
		</form>
	</div>
		<button id="autoAnswer" style="font-size:15px; margin:15px">객관식 자동채점(1회)</button>
		<c:forEach items="${saInfoList }" var="saInfo">
			<div class="examSa" style="font-size:20px; margin-left:20px">
		<!-- 채점시 margin-bottom:-10px position:relative right:45px          채점이미지 width:50px  position:relative left:30px -->
			<span class="eq_qtna">${saInfo.get("eq_qtna")}.${saInfo.get("eq_qtn")}(배점${saInfo.get("eq_score")})</span>
			<p class="sa_num" hidden="true">${saInfo.get('sa_num')}</p>
			<p class="eq_qtn_type" hidden="true" style="">${saInfo.get('eq_qtn_type')}</p>
			<c:if test="${not empty saInfo.get('sa_check')}">
			<p class="sa_check" hidden="true">${saInfo.get('sa_check')}</p>
			</c:if>
				<c:choose>
						<c:when test="${saInfo.get('eq_qtn_type') eq '1' }">
							<p class="sa_ans" hidden="true">${saInfo.get('sa_ans')}</p>
							<p class="eq_ans" hidden="true">${saInfo.get('eq_ans')}</p>
							<p class="one" style="margin-top:-5px">①${saInfo.get('eq_exmp_one')}</p>
							<p class="two">②${saInfo.get('eq_exmp_two')}</p>
							<p class="three">③${saInfo.get('eq_exmp_three')}</p>
							<p class="four">④${saInfo.get('eq_exmp_four')}</p><br/>
						</c:when>
						<c:otherwise>
							<p class="sa_ans">${saInfo.get('sa_ans')}</p>
							<button class="answerBtn" value="1">정답</button>
							<button class="wrongBtn" value="2">오답</button>
							<br/><br/>
						</c:otherwise>
				</c:choose>
			</div>
		</c:forEach>
		<button onclick="javascript:gradingSuccess();">채점완료</button>
		<button onclick="location.href='${pageContext.request.contextPath}/professor/classManage/lectureTakeExamStudent?exam_num=${exam_num }'">뒤로가기</button>
</div>