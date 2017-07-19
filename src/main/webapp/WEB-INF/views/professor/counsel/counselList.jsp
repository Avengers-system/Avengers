<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



    상담 리스트
    
 <button onclick="location.href='${pageContext.request.contextPath}/professor/counsel/counselInsertPage'">등록</button>
   상담일자 / 요일 / 상담신청일자 / 신청학생이름 /
 <c:forEach var="counselList" items="${counselList}">   
 	상담날짜 : <a href="${pageContext.request.contextPath}/professor/counsel/counselDetail?cns_num=${counselList.cns_num}">${counselList.cns_date}</a><br>
 	상담신청일자 : ${counselList.cns_appl_date}<br>
 	신청학생학번 :${counselList.cns_stud}
 
 </c:forEach>