<%@page import="com.avengers.db.dto.PrfsVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<style>
			button#addStud{
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


<!-- Admin Header -->
<%@include file="../common/topCategory.jsp"%>
<!-- Content -->
<div class="col-md-2" id="commonLeftSide">
	<%@include file="../common/mainSideCategory.jsp" %>
</div>
<div class="col-md-10" id="commonRightSide">


		<div class="col-md-12">
				<div class="col-md-1 col-md-offset-9">
					<button id ="addStud" class="btn btn-primary" onclick="location.href='<%=request.getContextPath()%>/admin/studentInsert'">학생추가하기</button>
				</div>
		</div>


<div class="col-md-8 col-md-offset-2">
	
	<div class="widget stacked widget-table action-table">
    				
				<div class="widget-header">
					<i class="icon-th-list"></i>
					<h3>학생목록 리스트</h3>
				</div> <!-- /widget-header -->
				
				<div class="widget-content">
					
					
					 <table class="table table-striped table-bordered"> 
						<thead>
							<tr>
								<th>학번</th>
								<th>이름</th>
								<th>학과</th>
								<th>학기</th>
								<th>성별</th>
								<th>생년월일</th>
								<th>휴대폰번호</th>
								<th>주민등록번호</th>
								<th>우편번호</th>
								<th>주소</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="student" items="${studentList}">
							<tr>
								<td>${student.stud_num }</td>
								<td><a href="studentManage/detail?stud_num=${student.stud_num}">${student.stud_nm}</a></td>
								<td>${student.stud_dept }</td>
								<td>${student.stud_qtr }</td>
								<c:choose>
									<c:when test="${student.stud_gen == '2'}">
										<td>여자</td>
									</c:when>
									<c:otherwise>
										<td>남자</td>
									</c:otherwise>
								</c:choose>
								<td><fmt:formatDate pattern = "yyyy-MM-dd" value = "${student.stud_bir}" /></td>
								<td>${student.stud_hp }</td>
								<td>${student.stud_regno}</td>
								<td>${student.stud_zip}</td>
								<td>${student.stud_addr}</td>
							</tr>
						</c:forEach>
							</tbody>
						</table>
					
			
            </div>
 
 			</div>
<br/>
<br/>
 
 
</div>

 </div>
 
