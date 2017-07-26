<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Content -->
<div class="col-md-2" id="commonLeftSide">
<%@include file="../common/classManageLectureSideCategory.jsp" %>
</div>
<div class="col-md-10">
	<div class="panel panel-default">
		<div class="panel-heading" style="background-color: #666666;  margin-top: 10px;">
			<h4 style="color:#fff; font-weight:bold; font-size:20px;">과제등록</h4>
		</div>
	</div>
	<form name="registryAsgn" method="post" action="${pageContext.request.contextPath}/professor/classManage/registryAsgn" enctype="multipart/form-data">
		년도 : <input type="text" class="form-control" name="lct_yr" value="${lctVO.getLct_yr()}"/>
		학기 : <input type="text" class="form-control" name="lct_qtr" value="${lctVO.getLct_qtr()}"/>
		강의명 : <input type="text" class="form-control" value=""/>
		분반 : <input type="text" class="form-control" value=""/>
		과제명 : <input type="text" class="form-control" name="asgn_nm"/>
		제출시작일 : <input type="date" class="form-control" style="width:300px" name="asgn_start_date"/>
		제출마감일 : <input type="date" class="form-control" style="width:300px" name="asgn_dl_date"/>
		과제내용 : <br/><textarea rows="20" cols="80" name="asgn_cont" class="form-control"></textarea>
		첨부파일 : <input type="file" class="form-control" name="asgn_sub_form"/>
		<input type="submit" value="등록"/>
		<input type="button" value="뒤로가기" onclick="location.href='${pageContext.request.contextPath}/professor/classManage/lectureAsgnMain'"/>
	</form>
</div>