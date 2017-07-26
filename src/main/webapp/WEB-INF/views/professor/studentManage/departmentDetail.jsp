<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<div class="col-xs-12">
	<div class="panel panel-default">
		<div class="panel-heading"
			style="background-color: #666666; margin-top: 10px;">
			<h4 style="color: #fff; font-weight: bold; font-size: 20px;">
				학생 정보
				
				</h4>
		</div>
		<div class="panel-body" style="height: 580px;">
		
			${studDetail.stud_num} <br> ${studDetail.stud_nm}
		
		<form
			action="${pageContext.request.contextPath}/professor/studentManage/departmentList"
			method="post">
			<input type="submit" value="목록"> <input type="hidden"
				name="pageNo" value="${pageNo}">
		</form>
		</div>
	</div>
</div>










