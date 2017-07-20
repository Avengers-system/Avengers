<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Student Header -->
<%@include file="../common/topCategory.jsp" %>
<style>
	.container{
		width:100%;
		height:100%;
		vertical-align:middle;
		margin:auto;
		text-align:center;
	}	
	#search{
		width:50%;
		height:10%;
	}
	#lct{
		width:100%;
		height:40%;
	}
	#info{		
		width:50%;
		height:50%;
	}
	#admission{
		width:100%;		
		height:50%;
		
	}
	#admission #tl{
		width:100%;
		height:25%;
	}
	#admission #cart{
		width:100%;
		height:25%;
	}
	td{
		border: 0.5px solid black;
		padding: 10px;
	}
	table{
		overflow:auto;
	}
</style>

    	 <div class="col-md-12" id="info">
    	 <div class="col-md-12"> 
    	 <div class="panel">
    	 <div class="panel-heading">
       		<!-- 학생개인정보 -->       		
			<h3> 개인정보 </h3>
		</div>
		 <div class="panel-body" id="">	
			 이름 : ${studentInfo.stud_nm}      
			 학과 : ${studentInfo.stud_dept }      
			 학년 : ${studentInfo.stud_grd}      
			 학적상태 : ${studentInfo.stud_schreg_code}      
			 최대 신청가능 학점 : ${studentInfo.stud_max_crd}        
			 현재 신청 학점 : ${cur_score}			 
			<!-- 시간표보기 -->
			<button onclick="location.href='${pageContext.request.contextPath}/student/pdfView'">시간표보기</button> 
		  </div>       
        </div>
        </div>
        </div>	
        
        <div class="col-md-12" id="search">
    	 <div class="col-md-12"> 
    	 <div class="panel">
    	 <div class="panel-heading">
       		<h3> 검색 </h3>
       		 </div> 
       	<div class="panel-body">
       	<!-- 셀렉트박스와 검색 셀렉트박스는 학년,이수구분 -->
			<form action = "${pageContext.request.contextPath}/student/admissionApplication" method="post">
				학년 <select name="sjt_estm_grd">			
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
				</select> 이수구분 <select name="sjt_cd">
					<option selected="selected" value="전%">전공</option>
					<option value="교%">교양</option>
				</select> 강의명: <input type="text" name="lct_nm" />
				<input type = "submit" value="검색">
			</form>
       	</div>	       
        </div>
        </div>
        </div>
        		
         	
		
        <div class="col-md-12 top-20 padding-0">
        <div class="col-md-12">             
        <div class="col-xs-12" id="lct">
        <div class="panel">  
       	 	<!-- 강의리스트 -->
       	 	<div class="panel-heading">       	 	
			<h3>강의리스트</h3>
			</div>
			<div class="panel-body">
			<div class="responsive-table">
			<table id="datatables-example" class="table table-striped table-bordered" width="100%" cellspacing="0">
				<thead>
				<tr>
					<td>장바구니담기</td>
					<td>수강신청</td>
					<td>강의번호</td>
					<td>이수구분</td>
					<td>강의명</td>
					<td>강의실</td>
					<td>교수명</td>
					<td>시간</td>
					<td>학점</td>
					<td>수강제한인원</td>
					<td>수강가능인원</td>
					<td>강의계획서</td>
				</tr>
				</thead>
				<tbody>
				<c:choose>
					<c:when test="${not empty lectureList}">
						<c:forEach var="lct" items="${lectureList }" varStatus="status">
							<tr>						
								<td>
									<form action = "${pageContext.request.contextPath}/student/insertCart" method="post">
									<input type="hidden" name="cart_lct" value="${lct.get('lct_num')}" />
									<input type = "submit" value="장바구니담기">
									</form>
								</td>
								<c:choose>		
									<c:when test="${term=='본수강신청' }">								
										<td>
											<form action = "${pageContext.request.contextPath}/student/insertTl" method="post">
											<input type="hidden" name="lct_num" value="${lct.get('lct_num')}" />
											<input type = "submit" value="신청">
											</form>
										</td>
									</c:when>
								</c:choose>						
								<td>${lct.get("lct_num")}</td>
								<td>${lct.get("sjt_cd")}</td>
								<td>${lct.get("lct_nm") }</td>
								<td>${lct.get("lr_num") }</td>
								<td>${lct.get("prfs_nm") }</td>
								<td>${lct.get("lr_date") }</td>
								<td>${lct.get("lct_crd") }</td>
								<td>${lct.get("lct_qua_num") }</td>
								<td>${lct.get("lct_qua_num") - lct.get("lct_cnt_num") }</td>
								<td>
								<form action = "${pageContext.request.contextPath}/student/lectureDetail" method="post">
								<input type="hidden" name="lct_num" value="${lct.get('lct_num')}" />
								<input type = "submit" value="강의계획서">
								</form>
								</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="5" style="text-align: center;">해당 내용이 없습니다.</td>
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
        </div> 
        
        <div class="col-md-12 top-20 padding-0">		
        <div class="col-md-12" id="admission">
        <div class="col-xs-12 col-md-1" id="cart">
        <div class="panel">
        		<!-- 장바구니리스트 -->
        		<div class="panel-heading">
				<h3>장바구니리스트</h3>
				</div>
				<div class="panel-body">
					<div class="responsive-table">
					<table id="datatables-example" class="table table-striped table-bordered" width="100%" cellspacing="0">
					<thead>
					<tr>
						<td>취소</td>
						<c:choose>				
							<c:when test="${term=='본수강신청' }">
								<td>신청</td>
							</c:when>
						</c:choose>
						<td>강의번호</td>
						<td>이수구분</td>
						<td>강의명</td>
						<td>강의실</td>
						<td>교수명</td>
						<td>시간</td>
						<td>학점</td>
						<td>강의계획서</td>
					</tr>
					</thead>
					<tbody>
					<c:choose>
						<c:when test="${not empty cartList}">
							<c:forEach var="cart" items="${cartList }">
								<tr>
									<td>
									<form action = "${pageContext.request.contextPath}/student/deleteCart" method="post">
									<input type="hidden" name="cart_lct" value="${cart.get('lct_num')}" />
									<input type = "submit" value="취소">
									</form>
									</td>
									<c:choose>		
										<c:when test="${term=='본수강신청' }">
											<td>
											<form action = "${pageContext.request.contextPath}/student/insertTl" method="post">
											<input type="hidden" name="lct_num" value="${cart.get('lct_num')}" />
											<input type = "submit" value="신청">
											</form>
											</td>
										</c:when>
									</c:choose>
									<td>${cart.get("lct_num")}</td>
									<td>${cart.get("sjt_cd") }</td>
									<td>${cart.get("lct_nm") }</td>
									<td>${cart.get("lr_num") }</td>
									<td>${cart.get("prfs_nm") }</td>
									<td>${cart.get("lr_date") }</td>
									<td>${cart.get("lct_crd") }</td>									
									<td>
									<form action = "${pageContext.request.contextPath}/student/lectureDetail" method="post">
									<input type="hidden" name="lct_num" value="${cart.get('lct_num')}" />
									<input type = "submit" value="강의계획서">
									</form>
									</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="5" style="text-align: center;">해당 내용이 없습니다.</td>
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
			</div>
			<div class="col-md-12 top-20 padding-0">		
        	<div class="col-md-12" id="admission">        
        	<div class="col-xs-12 col-md-1" id="tl">
        	<div class="panel">
       			<!-- 강의신청내역리스트(본수강신청기간에만) -->
				
					<div class="panel-heading">   
					<h3>강의신청내역</h3>
					</div>
					<div class="panel-body">
					<div class="responsive-table">
					<table id="datatables-example" class="table table-striped table-bordered" width="100%" cellspacing="0">
					<thead>						
							<tr>
								<td>취소</td>
								<td>강의번호</td>
								<td>이수구분</td>
								<td>강의명</td>
								<td>강의실</td>
								<td>교수명</td>
								<td>시간</td>
								<td>학점</td>
								<td>강의계획서</td>
							</tr>
						</thead>
						</tbody>	
							<c:choose>
								<c:when test="${not empty admissionApplicationList}">
									<c:forEach var="admission" items="${admissionApplicationList }" varStatus="status">
										<tr>
											<td>
											<form action = "${pageContext.request.contextPath}/student/deleteTl" method="post">
											<input type="hidden" name="tl_num" value="${admission.get('tl_num')}" />
											<input type = "submit" value="취소">
											</form>
											</td>								
											<td>${admission.get("lct_num")}</td>
											<td>${admission.get("sjt_cd")}</td>
											<td>${admission.get("lct_nm")}</td>
											<td>${admission.get("lr_num") }</td>
											<td>${admission.get("prfs_nm") }</td>
											<td>${admission.get("lr_date") }</td>
											<td>${admission.get("lct_crd") }</td>
											<td>
											<form action = "${pageContext.request.contextPath}/student/lectureDetail" method="post">
											<input type="hidden" name="lct_num" value="${admission.get('lct_num')}" />
											<input type = "submit" value="강의계획서">
											</form>
											</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="5" style="text-align: center;">해당 내용이 없습니다.</td>
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
        	
        </div>

