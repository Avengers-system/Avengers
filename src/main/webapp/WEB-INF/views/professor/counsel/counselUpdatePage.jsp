<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Content -->
<div class="col-md-2">
	<a href="${pageContext.request.contextPath}/professor/counsel/counselList">상담목록</a>
	<a href="${pageContext.request.contextPath}/professor/counsel/counselInsertPage">상담등록</a>
</div>
    수정페이지
    
    
        
        <form action="${pageContext.request.contextPath}/professor/counsel/counselUpdate">
        
        	<input type="text" name="cns_title" value="${cnsDetail.cns_title}">
        	<input type="hidden" name="cns_num" value="${cnsDetail.cns_num}">
        	<input type="submit" value="수정하기">
        </form>
        
        
        
        
        
        