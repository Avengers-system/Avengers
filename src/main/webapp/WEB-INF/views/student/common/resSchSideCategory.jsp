<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 등록/장학관리 sideCategory -->
<div class="col-xs-12">
	<input type="button" value="장학이력/신청조회" onclick="location.href='${pageContext.request.contextPath}/student/registryScholarshipManage'"/> 
	<input type="button" value="장학금신청" onclick="location.href='${pageContext.request.contextPath}/student/admissionApplication'"/> 	
	<input type="button" value="등록금이력조회" onclick="location.href='${pageContext.request.contextPath}/student/admissionApplication'"/> 
	<input type="button" value="등록금관리" onclick="location.href='${pageContext.request.contextPath}/student/admissionApplication'"/> 	
	<input type="button" value="logout" onclick="logout_go()"/><br/>
</div>