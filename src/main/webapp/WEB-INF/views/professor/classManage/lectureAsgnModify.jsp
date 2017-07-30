<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../common/classManageLectureSideCategory.jsp"%>

<div class="col-md-10">
	<div class="panel panel-default">
		<div class="panel-heading" style="background-color: #666666; margin-top: 10px;">
		<h4 style="color: #fff; font-weight: bold; font-size: 20px;">과제수정</h4>
		</div>
		<div class="panel-body">
			<form name="detailAsgn" method="post" action="${pageContext.request.contextPath}/professor/classManage/updateAsgn" enctype="multipart/form-data" class="form-horizontal">
			<input type="text" name="asgn_num" hidden="true" value="${asgnInfo.get('asgn_num') }"/>
			<div class="form-group">
				<label class="control-label col-sm-1" for="lct_yr">년도:</label>
				<div class="col-sm-2">
					<input type="text" readonly class="form-control" name="lct_yr" value="${asgnInfo.get('lct_yr')}">
				</div>
				<label class="control-label col-sm-1" for="lct_qtr">학기:</label>
				<div class="col-sm-2">
					<input type="text" readonly class="form-control" name="lct_qtr" value="${asgnInfo.get('lct_qtr')}">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-1" for="lct_nm">강의명:</label>
				<div class="col-sm-2">
					<input type="text" readonly class="form-control" value="${asgnInfo.get('lct_nm')}">
				</div>
				<label class="control-label col-sm-1" for="lct_nm_class">분반:</label>
				<div class="col-sm-2">
					<input type="text" readonly class="form-control" value="${asgnInfo.get('lct_nm_class')}">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-1" for="asgn_start_date">제출시작일:</label>
				<div class="col-sm-2">
					<input type="date" class="form-control" name="asgn_start_date" value="${asgnInfo.get('asgn_start_date')}">
				</div>
				<label class="control-label col-sm-1" for="asgn_dl_date">제출마감일:</label>
				<div class="col-sm-2">
					<input type="date" class="form-control" name="asgn_dl_date" value="${asgnInfo.get('asgn_dl_date')}" >
				</div>
		    </div>
			<div class="form-group">
				<label class="control-label col-sm-1" for="asgn_nm">과제명:</label>
				<div class="col-sm-8">
					<input type="text"  class="form-control" name="asgn_nm" value="${asgnInfo.get('asgn_nm')}">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-1" for="asgn_cont">과제내용:</label>
				<div class="col-sm-8">
					<textarea class="form-control" rows="10" cols="100" name="asgn_cont">${asgnInfo.get('asgn_cont')}</textarea><br/>
				</div>
		    </div>
		    <div class="form-group">
				<label class="control-label col-sm-1" for="asgn_sub_form">첨부파일</label>
				<div class="col-sm-3">
					<input type="file" name="asgn_sub_form" style="font-size:15px"/>
				</div>
		    </div>
		    <div class="form-group">
				<label class="control-label col-sm-1" for="asgn_cont"></label>
				<div class="col-sm-8">
				    <input type="submit" class="btn btn-outline btn-primary" value="수정완료"/>
					<input type="button" class="btn btn-outline btn-primary" value="뒤로가기" onclick="location.href='${pageContext.request.contextPath}/professor/classManage/lectureAsgnDetail?asgn_num=${asgnInfo.get('asgn_num') }&division=1'"/> 
				</div>
		    </div>
			</form>
		</div>
	</div>
</div>

<%-- <input type="text" name="asgn_num" hidden="true" value="${asgnInfo.get('asgn_num') }"/> --%>
<%-- 				년도 : <input type="text" class="form-control" name="lct_yr" value="${asgnInfo.get('lct_yr')}"/> --%>
<%-- 				학기 : <input type="text" class="form-control" name="lct_qtr" value="${asgnInfo.get('lct_qtr')}"/> --%>
				
<%-- 				강의명 : <input type="text" class="form-control" value="${asgnInfo.get('lct_nm')}"/> --%>
<%-- 				분반 : <input type="text" class="form-control" value="${asgnInfo.get('lct_nm_class')}"/> --%>
				
<%-- 				과제명 : <input type="text" class="form-control" name="asgn_nm" value="${asgnInfo.get('asgn_nm')}"/> --%>
				
<%-- 				제출시작일 : <input type="date" class="form-control" style="width:300px" name="asgn_start_date" value="${asgnInfo.get('asgn_start_date')}"/> --%>
<%-- 				제출마감일 : <input type="date"  class="form-control" style="width:300px" name="asgn_dl_date" value="${asgnInfo.get('asgn_dl_date')}"/> --%>
<%-- 				과제내용 : <br/><textarea rows="20" cols="80" name="asgn_cont" class="form-control">${asgnInfo.get('asgn_cont')}</textarea> --%>
<!-- 				<div style="border:1px solid lightgrey;font-size:15px;margin-top:5px"> -->
<!-- 				첨부파일&nbsp;<input type="file" name="asgn_sub_form"/> -->
<!-- 				</div> -->
<!-- 				<div style="border:1px solid lightgrey;font-size:15px;margin-top:5px"> -->
<!-- 					업로드파일 -->
<%-- 					<a href="${pageContext.request.contextPath}/professor/download?fileName=${asgnInfo.get('asgn_sub_form')}">${asgnInfo.get('asgn_sub_form')}</a> --%>
<!-- 				</div> -->
<!-- 				<div style="margin-top:5px"> -->
<!-- 					<input type="submit" value="수정완료"/> -->
<%-- 					<input type="button" value="뒤로가기" onclick="location.href='${pageContext.request.contextPath}/professor/classManage/lectureAsgnMain'"/> --%>
<!-- 				</div> -->