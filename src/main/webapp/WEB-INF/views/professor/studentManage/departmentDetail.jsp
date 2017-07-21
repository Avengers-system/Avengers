<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<div class="panel panel-default">
	<div class="panel-heading">
		<h1>학생 정보</h1>
	</div>
	<div class="panel-body">
		${studDetail.stud_num} <br> ${studDetail.stud_nm}

		<form
			action="${pageContext.request.contextPath}/professor/studentManage/departmentList"
			method="post">
			<input type="submit" value="목록"> <input type="hidden"
				name="pageNo" value="${pageNo}">
		</form>
	</div>
	
</div>


