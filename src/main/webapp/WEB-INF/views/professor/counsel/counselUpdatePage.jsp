<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    수정페이지
    
    
        
        <form action="${pageContext.request.contextPath}/professor/counsel/counselUpdate">
        
        	<input type="text" name="cns_title" value="${cnsDetail.cns_title}">
        	<input type="hidden" name="cns_num" value="${cnsDetail.cns_num}">
        	<input type="submit" value="수정하기">
        </form>
        
        
        
        
        
        