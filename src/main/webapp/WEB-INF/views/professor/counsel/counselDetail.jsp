<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    상담 상세정보
    
    ${cnsDetail.cns_title}
    
    
    
    <button onclick="location.href='${pageContext.request.contextPath}/professor/counsel/counselUpdatePage?cns_num=${cnsDetail.cns_num}'">수정</button>