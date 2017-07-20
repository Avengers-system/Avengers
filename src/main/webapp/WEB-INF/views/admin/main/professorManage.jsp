<%@page import="com.avengers.db.dto.PrfsVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	#professorTable,  #professorTable td{
		border : 2px solid black;
	}
</style>
 <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:if test="${msg !=null}">
		<script>
		 alert('zz');
		</script>

</c:if> 
 
<!-- Admin Header -->
<%@include file="../common/topCategory.jsp"%>

<h1>교수목록 리스트 </h1>
<br/>

 <table id="professorTable">
		 <c:forEach var="professor" items="${professorList }">
 			<tr>
	 		<td>교수 번호</td>
	 		<td>${professor.prfs_num}</td>
	 		</tr>
 			<tr>
	 		<td>교수 이름</td>
	 		<td><a href="professorManage/detail?prfs_num=${professor.prfs_num}">${professor.prfs_nm}</a></td>
	 		</tr>
 			<tr>
	 		<td>영문이름</td>
	 		<td>${professor.prfs_eng_nm}</td>
	 		</tr>
 			<tr>
	 		<td>학과번호</td>
	 		<td>${professor.prfs_dept}</td>
	 		</tr>
 			<tr>
	 		<td>생년월일</td>
	 		<td>${professor.prfs_bir}</td>
	 		</tr>
 			<tr>
	 		<td>주민등록번호</td>
	 		<td>${professor.prfs_regno}</td>
	 		</tr>
 			<tr>
	 		<td>성별</td>
	 		<c:choose>
					<c:when test="${professor.prfs_gen == '1'} ">
						<td>남자</td>
					</c:when>
					<c:otherwise>
						<td>여자</td>
				  	</c:otherwise>
			</c:choose>
	 		</tr>
 			<tr>
	 		<td>휴대폰번호</td>
	 		<td>${professor.prfs_hp}</td>
	 		</tr>
		 </c:forEach>
</table>
<!-- Content -->
<div class="col-md-2" id="commonLeftSide">
   <%@include file="../common/mainSideCategory.jsp" %>   
</div>
<div class="col-md-10" id="commonRightSide">

	<div class="col-md-12">
		<div class="col-md-1 col-md-offset-9">
			<button id ="addProf" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/admin/professorInsert'">교수추가하기</button>
		</div>
	</div>

<style>
			button#addProf{
			} 
			 .table-bordered {
			border: 1px solid #dddddd;
			border-collapse: separate;
			border-left: 0;
			-webkit-border-radius: 4px;
			-moz-border-radius: 4px;
			border-radius: 4px;
			}
			
			.table {
			width: 100%;
			margin-bottom: 20px;
			background-color: transparent;
			border-collapse: collapse;
			border-spacing: 0;
			display: table;
			}
			
			.widget.widget-table .table {
			margin-bottom: 0;
			border: none;
			}
			
			.widget.widget-table .widget-content {
			padding: 0;
			}
			
			.widget .widget-header + .widget-content {
			border-top: none;
			-webkit-border-top-left-radius: 0;
			-webkit-border-top-right-radius: 0;
			-moz-border-radius-topleft: 0;
			-moz-border-radius-topright: 0;
			border-top-left-radius: 0;
			border-top-right-radius: 0;
			}
			
			.widget .widget-content {
			padding: 20px 15px 15px;
			background: #FFF;
			border: 1px solid #D5D5D5;
			-moz-border-radius: 5px;
			-webkit-border-radius: 5px;
			border-radius: 5px;
			}
			
			.widget .widget-header {
			position: relative;
			height: 40px;
			line-height: 40px;
			background: #E9E9E9;
			background: -moz-linear-gradient(top, #fafafa 0%, #e9e9e9 100%);
			background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #fafafa), color-stop(100%, #e9e9e9));
			background: -webkit-linear-gradient(top, #fafafa 0%, #e9e9e9 100%);
			background: -o-linear-gradient(top, #fafafa 0%, #e9e9e9 100%);
			background: -ms-linear-gradient(top, #fafafa 0%, #e9e9e9 100%);
			background: linear-gradient(top, #fafafa 0%, #e9e9e9 100%);
			text-shadow: 0 1px 0 #fff;
			border-radius: 5px 5px 0 0;
			box-shadow: 0 2px 5px rgba(0,0,0,0.1),inset 0 1px 0 white,inset 0 -1px 0 rgba(255,255,255,0.7);
			border-bottom: 1px solid #bababa;
			filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#FAFAFA', endColorstr='#E9E9E9');
			-ms-filter: "progid:DXImageTransform.Microsoft.gradient(startColorstr='#FAFAFA', endColorstr='#E9E9E9')";
			border: 1px solid #D5D5D5;
			-webkit-border-top-left-radius: 4px;
			-webkit-border-top-right-radius: 4px;
			-moz-border-radius-topleft: 4px;
			-moz-border-radius-topright: 4px;
			border-top-left-radius: 4px;
			border-top-right-radius: 4px;
			-webkit-background-clip: padding-box;
			}
			
			thead {
			display: table-header-group;
			vertical-align: middle;
			border-color: inherit;
			}
			
			.widget .widget-header h3 {
			top: 2px;
			position: relative;
			left: 10px;
			display: inline-block;
			margin-right: 3em;
			font-size: 14px;
			font-weight: 600;
			color: #555;
			line-height: 18px;
			text-shadow: 1px 1px 2px rgba(255, 255, 255, 0.5);
			}
			
			.widget .widget-header [class^="icon-"], .widget .widget-header [class*=" icon-"] {
			display: inline-block;
			margin-left: 13px;
			margin-right: -2px;
			font-size: 16px;
			color: #555;
			vertical-align: middle;
			}
			 
			 </style>


  
	<div class="col-md-8 col-md-offset-2">
	
	<div class="widget stacked widget-table action-table">
    				
				<div class="widget-header">
					<i class="icon-th-list"></i>
					<h3>교수목록</h3>
				</div> <!-- /widget-header -->
				
				<div class="widget-content">
					
					
					 <table class="table table-striped table-bordered"> 
						<thead>
							<tr>
								<th>교수 번호</th>
								<th>이름</th>
								<th>영문이름</th>
								<th>학과번호</th>
								<th>생년월일</th>
								<th>주민등록번호</th>
								<th>성별</th>
								<th>휴대폰번호</th>
							</tr>
						</thead>
						<tbody>
					  <c:forEach var="professor" items="${professorList }">
							<tr>
								<td>${professor.prfs_num}</td>
								<td><a href="professorManage/detail?prfs_num=${professor.prfs_num}">${professor.prfs_nm}</a></td>
								<td>${professor.prfs_eng_nm}</td>
								<td>${professor.prfs_dept}</td>
								<td><fmt:formatDate pattern = "yyyy-MM-dd" value = "${professor.prfs_bir}" /></td>
								<td>${professor.prfs_regno}</td>
								<td>${professor.prfs_gen}</td>
								<td>${professor.prfs_hp}</td>
							</tr>
							</c:forEach>
							</tbody>
						</table>
					
			
            </div>
 
 			</div>
<br/>
<br/>
 
 
</div>
