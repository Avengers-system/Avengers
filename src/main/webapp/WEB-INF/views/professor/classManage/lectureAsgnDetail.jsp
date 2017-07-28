<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../common/classManageLectureSideCategory.jsp"%>

<div class="col-md-10">
	<div class="panel panel-default">
		<div class="panel-heading"
			style="background-color: #666666; margin-top: 10px;">
			<h4 style="color: #fff; font-weight: bold; font-size: 20px;">
				과제상세페이지</h4>
		</div>
		<div class="panel-body">
			<form  class="form-horizontal">
			<div class="form-group">
				<label class="control-label col-sm-1" for="email">년도:</label>
				<div class="col-sm-2">
					<input type="text" readonly class="form-control" name="lct_yr" value="${asgnInfo.get('lct_yr')}">
				</div>
				<label class="control-label col-sm-1" for="sjt_nm">학기:</label>
				<div class="col-sm-2">
					<input type="text" readonly class="form-control" name="lct_qtr" value="${asgnInfo.get('lct_qtr')}">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-1" for="lct_nm_class">강의명:</label>
				<div class="col-sm-2">
					<input type="text" readonly class="form-control" value="${asgnInfo.get('lct_nm')}">
				</div>
				<label class="control-label col-sm-1" for="sjt_cd">분반:</label>
				<div class="col-sm-2">
					<input type="text" readonly class="form-control" value="${asgnInfo.get('lct_nm_class')}">
				</div>
		    </div>
		    <div class="form-group">
				<label class="control-label col-sm-1" for="lct_nm_class">제출시작일:</label>
				<div class="col-sm-2">
					<input type="text" readonly class="form-control" name="asgn_start_date" value="${asgnInfo.get('asgn_start_date')}">
				</div>
				<label class="control-label col-sm-1" for="sjt_cd">제출마감일:</label>
				<div class="col-sm-2">
					<input type="text" readonly class="form-control" name="asgn_dl_date" value="${asgnInfo.get('asgn_dl_date')}" >
				</div>
		    </div>
		    <div class="form-group">
				<label class="control-label col-sm-1" for="asgn_nm">과제명:</label>
				<div class="col-sm-8">
					<input type="text" readonly class="form-control" name="asgn_nm" value="${asgnInfo.get('asgn_nm')}">
				</div>
		    </div>
		    <div class="form-group">
				<label class="control-label col-sm-1" for="asgn_cont">과제내용:</label>
				<div class="col-sm-8">
					<textarea class="form-control" rows="10" cols="100" readonly name="asgn_cont">${asgnInfo.get('asgn_cont')}</textarea><br/>
				</div>
		    </div>
		    <div class="form-group">
				<label class="control-label col-sm-1" for="asgn_cont">첨부파일</label>
				<div class="col-sm-8">
					<a style="font-size:20px" href="${pageContext.request.contextPath}/professor/download?fileName=${asgnInfo.get('asgn_sub_form')}">${asgnInfo.get('asgn_sub_form')}</a>
				</div>
		    </div>
		     <div class="form-group">
				<label class="control-label col-sm-1" for="asgn_cont"></label>
				<div class="col-sm-8">
				    <input type="button" class="btn btn-outline btn-primary" onclick="location.href='${pageContext.request.contextPath}/professor/classManage/lectureAsgnDetail?asgn_num=${asgnInfo.get('asgn_num')}&division=2'" value="수정"/>
					<input type="button" class="btn btn-outline btn-primary" value="뒤로가기" onclick="location.href='${pageContext.request.contextPath}/professor/classManage/lectureAsgnMain'" /> 
				</div>
		    </div>
			</form>
		</div>
	</div>
</div>

<%-- 년도 : <input type="text" class="form-control" name="lct_yr" value="${asgnInfo.get('lct_yr')}" />  --%>
<%-- 				학기 : <input type="text" class="form-control" name="lct_qtr" value="${asgnInfo.get('lct_qtr')}" />  --%>
<%-- 			      강의명 : <input type="text" class="form-control" value="${asgnInfo.get('lct_nm')}" />  --%>
<%-- 				분반 : <input type="text" class="form-control" value="${asgnInfo.get('lct_nm_class')}" />  --%>
<%-- 				과제명 : <input type="text" class="form-control" name="asgn_nm" value="${asgnInfo.get('asgn_nm')}" />  --%>
<%-- 				제출시작일 : <input type="text" class="form-control" style="width: 300px" name="asgn_start_date" value="${asgnInfo.get('asgn_start_date')}" />  --%>
<%-- 				제출마감일 : <input type="text" class="form-control" style="width: 300px" name="asgn_dl_date" value="${asgnInfo.get('asgn_dl_date')}" />  --%>
<%-- 				과제내용:<br/><textarea rows="20" cols="80" name="asgn_cont" class="form-control">${asgnInfo.get('asgn_cont')}</textarea> --%>
<!-- 				<div style="border: 1px solid lightgrey; font-size: 20px"> -->
<%-- 					업로드파일 <a href="${pageContext.request.contextPath}/professor/download?fileName=${asgnInfo.get('asgn_sub_form')}">${asgnInfo.get('asgn_sub_form')}</a> --%>
<!-- 				</div> -->
<!-- 				<div style="margin-top:5px"> -->
<%-- 				<input type="button" onclick="location.href='${pageContext.request.contextPath}/professor/classManage/lectureAsgnDetail?asgn_num=${asgnInfo.get('asgn_num')}&division=2'" value="수정"/>  --%>
<%-- 				<input type="button" value="뒤로가기" onclick="location.href='${pageContext.request.contextPath}/professor/classManage/lectureAsgnMain'" /> --%>
<!-- 				</div> -->