<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>




<!--side Category-->
<div class="col-md-2" id="commonLeftSide">
	<%@include file="../common/resSchSideCategory.jsp" %>
</div>
<div class="col-md-10 padding-0">
 <div class="col-md-12 padding-0" id="search">
    	 <div class="panel">
    	 <div class="panel-heading">
       		<h3> 학생정보 </h3>
       		 </div> 
       	<div class="panel-body" style="font-size:16px;">
       	<dl class="dl-horizontal">
		<dt>대학</dt><dd>${resSchStudent.col_nm}</dd>
		<dt>전공</dt><dd>${resSchStudent.dept_nm}</dd>
		<dt>학년</dt><dd>${resSchStudent.stud_grd}</dd>		
		<dt>평점평균</dt><dd>${average_rating}</dd> 
		<dt>취득학점</dt><dd>${grades}</dd>
		<dt>학번</dt><dd>${resSchStudent.stud_num}</dd>
		<dt>이름</dt><dd>${resSchStudent.stud_nm}</dd>
		</dl>
       	</div>	       
        </div>
        </div>

<div class="col-md-12 top-20 padding-0">
        <div class="panel">  
       	 	<!-- 장학내역 -->
       	 	<div class="panel-heading">       	 	
			<h3>장학내역</h3>
			<form action = "${pageContext.request.contextPath}/student/studRes" method="post">
					년도<select name="scr_year" id="scr_year">
						<option selected="selected">전체</option>
						<c:choose>
					<c:when test="${not empty yearList}">
						<c:forEach var="year" items="${yearList}" varStatus="status">
							<option value="${year}">${year}</option>
						</c:forEach>
						</c:when>
						</c:choose>
					</select> 학기<select name="scr_qtr" id="scr_qtr">
						<option selected="selected">전체</option>
						<option value="1">1</option>
						<option value="2">2</option>
					</select>
					<input type = "submit" value="검색">
					</form>
				</div>
			<div class="panel-body">
			<div class="responsive-table">
			<table id="datatables-example" class="table table-striped table-bordered" width="100%" cellspacing="0">
				<thead>
				<tr>
					<td>년도</td>
					<td>학기</td>
					<td>장학금명</td>
					<td>장학금액</td>
					<td>은행</td>
					<td>예금주</td>
					<td>계좌번호</td>
				</tr>
				</thead>
				<tbody>
				<c:choose>
					<c:when test="${not empty scrList}">
						<c:forEach var="scr" items="${scrList}" varStatus="status">
							<tr>											
								<td>${scr.get("scrappl_yr")}</td>
								<td>${scr.get("scrappl_qtr")}</td>
								<td>${scr.get("scr_nm") }</td>
								<td>${scr.get("scr_money") }</td>								
								<td>${scr.get("stud_bank") }</td>
								<td>${scr.get("stud_ah") }</td>
								<td>${scr.get("stud_act_num") }</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="7" style="text-align: center;">해당 내용이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
				</tbody>
			</table>
			</div>
        </div>
        </div>
        </div>



<div class="col-md-12 top-20 padding-0">
        <div class="panel">  
       	 	<!-- 신청내역 -->
       	 	<div class="panel-heading">       	 	
			<h3>신청내역</h3>
			<form action = "${pageContext.request.contextPath}/student/studRes" method="post">
			년도<select name="scrappl_year" id="scrappl_year">
						<option selected="selected" >전체</option>
						<c:choose>
					<c:when test="${not empty yearList}">
						<c:forEach var="year" items="${yearList}" varStatus="status">
							<option value="${year}">${year}</option>
						</c:forEach>
						</c:when>
						</c:choose>
					</select> 학기<select name="scrappl_qtr" id="scrappl_qtr">
						<option selected="selected">전체</option>
						<option value="1">1</option>
						<option value="2">2</option>
					</select>
					<input type = "submit" value="검색">
			</form>		
			</div>
			<div class="panel-body">
			<div class="responsive-table">
			<table id="datatables-example" class="table table-striped table-bordered" width="100%" cellspacing="0">
				<thead>
				<tr>
					<td>년도</td>
					<td>학기</td>
					<td>장학금명</td>
					<td>신청내용</td>
					<td>은행</td>
					<td>예금주</td>
					<td>계좌번호</td>
					<td>신청일자</td>
				</tr>
				</thead>
				<tbody>
				<c:choose>
					<c:when test="${not empty scrApplList}">
						<c:forEach var="scr" items="${scrApplList}" varStatus="status">
							<tr>											
								<td>${scr.get("scrappl_yr")}</td>
								<td>${scr.get("scrappl_qtr")}</td>
								<td>${scr.get("scr_nm") }</td>
								<td>${scr.get("scrappl_cause") }</td>								
								<td>${scr.get("stud_bank") }</td>
								<td>${scr.get("stud_ah") }</td>
								<td>${scr.get("stud_act_num") }</td>
								<td>${scr.get("scrappl_date") }</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="8" style="text-align: center;">해당 내용이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
				</tbody>
			</table>
			</div>
        </div>
        </div>
        </div>

</div>

<script>
// $("select").change(function(){
// 	$.ajax({
// 		type:"POST",
// 		url:'studRes',
// 		data:{
// 			scr_year:$('#scr_year').val() ,
// 			scr_qtr:$('#scr_qtr').val() ,
// 			scrappl_year:$('#scrappl_year').val() ,
// 			scrappl_qtr:$('#scrappl_qtr').val()			
// 		},
// 		success:function(){
// 			location.href="${pageContext.request.contextPath}/student/studRes";
// 		}
// 	});
// })
</script>

