<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<h1></h1>
<form name="detailAsgn" method="post" action="${pageContext.request.contextPath}/professor/classManage/registryAsgn" enctype="multipart/form-data">
	년도 : <input type="text" class="form-control" name="lct_yr" value="${asgnInfo.get('lct_yr')}"/>
	학기 : <input type="text" class="form-control" name="lct_qtr" value="${asgnInfo.get('lct_qtr')}"/>
	강의명 : <input type="text" class="form-control" value="${asgnInfo.get('lct_nm')}"/>
	분반 : <input type="text" class="form-control" value="${asgnInfo.get('lct_nm_class')}"/>
	과제명 : <input type="text" class="form-control" name="asgn_nm" value="${asgnInfo.get('asgn_nm')}"/>
	제출시작일 : <input type="text" class="form-control" style="width:300px" name="asgn_start_date" value="${asgnInfo.get('asgn_start_date')}"/>
	제출마감일 : <input type="text" class="form-control" style="width:300px" name="asgn_dl_date" value="${asgnInfo.get('asgn_dl_date')}"/>
	과제내용 : <br/><textarea rows="20" cols="80" name="asgn_cont" class="form-control">${asgnInfo.get('asgn_cont')}</textarea>
	<div style="border:1px solid lightgrey;font-size:20px">
		첨부파일
		<a href="${pageContext.request.contextPath}/professor/download?fileName=${asgnInfo.get('asgn_sub_form')}">${asgnInfo.get('asgn_sub_form')}</a>
	</div>
	<input type="submit" value="등록"/>
	<input type="button" value="뒤로가기" onclick="location.href='${pageContext.request.contextPath}/professor/classManage/lectureAsgnMain'"/>
</form>
